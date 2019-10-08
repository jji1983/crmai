#-*- coding: utf-8 -*-
import pandas as pd
import numpy as np 
import datetime as dt
import pickle
import tensorflow as tf 
import sys
from sklearn import preprocessing

# target ai
import dbcontrol as db
import util as ut

# GPU 사용을 위한 Tensorflow 설정
config = tf.ConfigProto()
config.gpu_options.allow_growth = True
config.gpu_options.per_process_gpu_memory_fraction = 0.9

# input argv(src id)
if len(sys.argv) == 1:
    src_id = '1-1001'
else:
    src_id = sys.argv[1]

# 딥러닝
# 시작 시간 확인
now = dt.datetime.now()
train_start_time = now.strftime('%Y-%m-%d %H:%M:%S')

# 캠페인 정보 가져오기
cam_info = db.camStatusQuery(src_id)        # [0] src id, [1] name, [2] status
# 캠페인 상태
if cam_info[2] == 'Preprocessing':
	ut.log('캠페인 정상 조회 되었습니다.')
else:
	result = ut.errorStop('캠페인 상태를 확인 하세요.')

# 캠페인 상태 변경
db.camStatusUpdate(src_id, 'Deep Learning')

# 파일 정보 가져오기
cam_file = db.camTrainFileFind(src_id)

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
labeldataset = pd.DataFrame()
labeldataset[target_column] = dataset[target_column]
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

# Label 데이터 categorical
label_cat = labeldataset.columns.values
labeldata = pd.DataFrame()

# x & y OneHot 변환
x_data = ut.oheChange(data_cat, category_object, dataset, data)
y_data = ut.oheChange(label_cat, category_object, labeldataset, labeldata)

# Deep Learning 시작 합니다.
ut.log("Deep Learning 시작 합니다.")

# 그래프 초기화 & 랜덤값 설정 & gpu 사용 설정
tf.reset_default_graph()
tf.set_random_seed(1234)

# 파라미터값을 설정한다.
learning_rate = 0.001
training_cnt = 30
batch_size = 1000

# x & y shape 저장 합니다
x_shape = x_data.shape[1]
y_shape = y_data.shape[1]
db.learnShapeSave(src_id,'Deep Learning', 'Deep Neural Network', x_shape, y_shape)

# Input & Output
X = tf.placeholder(tf.float32, [None, x_shape])
Y = tf.placeholder(tf.float32, [None, y_shape])

keep_prob = tf.placeholder(tf.float32)

# deep neural network와 ReLU 추가
W1 = tf.get_variable("W1", shape=[x_shape, 250],
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

W5 = tf.get_variable("W5", shape=[250, y_data.shape[1]],
                     initializer=tf.keras.initializers.he_normal())
b5 = tf.Variable(tf.random_normal([y_shape]))
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

# 모델 실행
init = tf.global_variables_initializer()
sess = tf.Session(config=config)
sess.run(init)

# 모델 저장 정보
save_file = foldername+'deeplearning_model.ckpt'
saver = tf.train.Saver()

for epoch in range(training_cnt):
    avg_cost = 0
    total_batch = int(x_data.shape[0] / batch_size)

    for i in range(total_batch):
        batch_xs = x_data.sample(batch_size)
        batch_ys = y_data.iloc[batch_xs.index]
        feed_dict = {X: batch_xs, Y: batch_ys, keep_prob: 0.7}
        c, _ = sess.run([cost, op_train], feed_dict=feed_dict)
        avg_cost += c / total_batch

    # 학습정보 확인
    if (epoch + 1) % 5 == 0:
        print('Epoch:', '%04d' % (epoch + 1), 'cost =', '{:.9f}'.format(avg_cost))
    # 학습 모델 저장
    saver.save(sess, save_file)

print('\n(최적화 완료!)')
train_accuracy = sess.run(accuracy, feed_dict={X: batch_xs, Y: batch_ys, keep_prob: 1.0})
print('Accuracy(Train):', train_accuracy,'\n')
# print('Accuracy(Predict):', sess.run(accuracy, feed_dict={X: p_data, Y: p_label, keep_prob: 1.0}))

sess.close()

# 종료 시간 확인
now = dt.datetime.now()
train_end_time = now.strftime('%Y-%m-%d %H:%M:%S')

# DB 저장 정보
train_df = pd.DataFrame({"src_id":[src_id]})		# src_id
train_df['train_type'] = 'Deep Learning'			# 학습 유형
train_df['train_method'] = 'Deep Neural Network'	# deeplearning 모델
train_df['original_acc'] = train_accuracy			# 학습 정확도
train_df['model_dir'] = foldername					# 모델 저장 경로
train_df['model_name'] = 'deeplearning_model.ckpt' 	# 모델 명
train_df['train_start'] = train_start_time			# 학습 시작 시간
train_df['train_end'] = train_end_time				# 학습 종료 시간
train_df['model_flg'] = 'Y'							# 모델 사용여부

# DB 저장
db.trainModelSave(src_id, 'Deep Learning', train_df)

# Deep Learning 학습 종료
ut.log("Deep Learning 종료 합니다.")