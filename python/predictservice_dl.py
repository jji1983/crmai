#-*- coding: utf-8 -*-
import pandas as pd
import numpy as np 
import datetime as dt
import pickle
import tensorflow as tf 
import sys

import subprocess

# target ai
import dbcontrol as db
import util as ut
import selfoptimize as so 
import copy

# input argv(src id)
if len(sys.argv) == 1:
    src_id = '1-1001'
else:
    src_id = sys.argv[1]

# 딥러닝 예측 함수
# 캠페인 정보 가져오기
cam_info = db.camStatusQuery(src_id)        # [0] src id, [1] name, [2] status
if cam_info[2] == 'Learning Complete':
	ut.log('캠페인 정상 조회 되었습니다.')
else:
    ut.errorStop('캠페인 상태를 확인 하세요.')

# 파일 정보 가져오기
cam_file = db.camPredictFileFind(src_id)

# Train 파일 정보 가져오기
file_name = cam_file[0]
file_dir = cam_file[1]

# 전처리 정보 확인 합니다.
ut.log("전처리 정보 로딩합니다.")
foldername = './outputs/'+src_id+'/'

delete_columns = []         # 삭제 컬럼정보
scaler_object = {}          # 연속형 scaler 
category_object = {}        # 범주형 Label Encoder

# 삭제 컬럼정보
delete_columns = np.array(pd.read_csv(foldername+'delete_columns.csv',delimiter=',',encoding='utf-8'))
# 연속형 scaler 정보
with open(foldername+'scaler_object.pickle','rb') as f:
	scaler_object = pickle.load(f)
# 범주형 O&H 정보
with open(foldername+'category_object.pickle','rb') as f:
	category_object = pickle.load(f)

# 데이터 로딩 합니다.
ut.log("데이터 로딩합니다.")
dataset = pd.read_csv(file_dir +'/'+ file_name, low_memory=False)

#CSV 파일 저장을 위한 임시 저장
csv_save = copy.deepcopy(dataset);

# 삭제 정보를 이용하여 컬럼 삭제 합니다.
for col in delete_columns:
	del dataset[col[0]]

# 종속/결과 항목을 가져 옵니다.
target_object = db.camTargetCol(src_id)
if target_object is None:
	target_column = dataset.columns[0]
else:
	target_column = target_object[0]

# Label 데이터 분리
del dataset[target_column]

# 연속형 범주형 분리 합니다.
num_df = dataset.select_dtypes(include=['int64','float64'])
cat_df = dataset.select_dtypes(include=['object'])

# 연속형 데이터 scaler
ut.log("연속형 데이터 scaler 합니다.")
scaler_arr = scaler_object.transform(num_df)
data = pd.DataFrame(scaler_arr, columns = num_df.columns)

# 범주형 데이터 O&H
ut.log("범주형 데이터 OneHot 합니다.")
data_cat = list(cat_df.columns.values)

# Train 범주형 OneHot 변환
x_data = ut.oheChange(data_cat, category_object, dataset, data)

# Machine Learning 시작 합니다.
ut.log("딥러닝 예측 시작 합니다.")

# 딥러닝 최적 모델 선택 합니다
model_file = db.modelFileFind(src_id, 'Deep Learning')

model_name = model_file[0]
model_dir = model_file[1]



# DNN 모델 구성
# 그래프 초기화 & 랜덤값 설정 & gpu 사용 설정
tf.reset_default_graph()
tf.set_random_seed(1234)

# 파라미터값을 설정한다.
learning_rate = 0.001
training_cnt = 50
batch_size = 1000

# X & Y shape 
learn_shape = db.learnShapeFind(src_id,'Deep Learning','Deep Neural Network')

# Input & Output
X = tf.placeholder(tf.float32, [None, learn_shape[0]])
Y = tf.placeholder(tf.float32, [None, learn_shape[1]])
keep_prob = tf.placeholder(tf.float32)

# deep neural network와 ReLU 추가
W1 = tf.get_variable("W1", shape=[learn_shape[0], 250],
                     initializer=tf.keras.initializers.he_normal())
b1 = tf.Variable(tf.random_normal([250]))
L1 = tf.nn.relu(tf.matmul(X, W1) + b1)
L1 = tf.nn.dropout(L1, keep_prob=keep_prob)

W2 = tf.get_variable("W2", shape=[250, 250],
                     initializer=tf.keras.initializers.he_normal())
b2 = tf.Variable(tf.random_normal([250]))
L2 = tf.nn.relu(tf.matmul(L1, W2) + b2)
L2 = tf.nn.dropout(L2, keep_prob=keep_prob)

W3 = tf.get_variable("W3", shape=[250, 250],
                     initializer=tf.keras.initializers.he_normal())
b3 = tf.Variable(tf.random_normal([250]))
L3 = tf.nn.relu(tf.matmul(L2, W3) + b3)
L3 = tf.nn.dropout(L3, keep_prob=keep_prob)

W4 = tf.get_variable("W4", shape=[250, 250],
                     initializer=tf.keras.initializers.he_normal())
b4 = tf.Variable(tf.random_normal([250]))
L4 = tf.nn.relu(tf.matmul(L3, W4) + b4)

W5 = tf.get_variable("W5", shape=[250, learn_shape[1]],
                     initializer=tf.keras.initializers.he_normal())
b5 = tf.Variable(tf.random_normal([learn_shape[1]]))
logits = tf.matmul(L4, W5) + b5

# Cost : cross_entry 사용
cost = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(logits=logits, labels=Y))
optimizer = tf.train.AdamOptimizer(learning_rate)
op_train = optimizer.minimize(cost)

# 학습된 예측값을 확인, 정확도 계산
pred = tf.nn.softmax(logits)
prediction = tf.argmax(pred, 1)
true_Y = tf.argmax(Y, 1)
accuracy = tf.reduce_mean(tf.cast(tf.equal(prediction, true_Y), dtype=tf.float32))


# DNN 모델 로드
init = tf.global_variables_initializer()

save_file = model_dir+model_name
# saver = tf.train.import_meta_graph(save_file+'.meta')
saver = tf.train.Saver()

# 모델 이용하여 예측
with tf.Session() as sess:
	saver.restore(sess, save_file)
	# pred = tf.argmax(model, 1)
	# is_correct = tf.equal(pred, tf.argmax(Y, 1))
	predict = sess.run(pred, feed_dict={X: x_data, keep_prob:1})

predictData = pd.DataFrame(predict, columns=['fail_prob','success_prob'])

# 성공/실패 판단 함수
def predFunc(row):
	if row['success_prob'] > 0.5:
		return 1
	else:
		return 0

#파일 저장 시 값 변환 함수
def valueChangeFunc(row):
	if row['predict_val'] == 1:
		return 'Y'
	else:
		return 'N'

# 성공/실패 적용
predictData['predict_val'] = predictData.apply(predFunc, axis=1)

# predict dataset
# predictData = pd.DataFrame(x_data[x_data.columns[0]])
predictData['index_id'] = predictData.index.values
predictData['src_id'] = src_id
predictData['train_type'] = 'Deep Learning'
predictData['train_method'] = model_name

# DB 저장
db.predictSave(src_id,'Deep Learning', model_name, predictData)

#csv 파일 저장을 위한 값 추가
predict_csv_name = file_dir +'/'+ file_name+"predictdl.csv"
csv_save['predict_val']= predictData.apply(valueChangeFunc, axis=1)
csv_save.to_csv(predict_csv_name,mode='w',header=True)

db.predictDlCsvSave(src_id, file_name, predict_csv_name)

# Machine Learning 예측 종료 합니다.
ut.log("딥러닝 예측 종료 합니다.")
