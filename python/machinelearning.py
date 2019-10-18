#-*- coding: utf-8 -*-
import pandas as pd
import numpy as np 
import datetime as dt
import pickle
import sys
import warnings

from sklearn import preprocessing, svm, metrics
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.linear_model import LogisticRegression

import subprocess

# target ai
import dbcontrol as db
import util as ut
import selfoptimize as so 

# logistic warning
warnings.filterwarnings("ignore", category=FutureWarning)

# input argv(src id)
if len(sys.argv) == 1:
    src_id = '1-1001'
else:
    src_id = sys.argv[1]

# so 엔진 사용여부 
so_flag = 'N'

# 머신러닝 함수
# 캠페인 정보 가져오기
cam_info = db.camStatusQuery(src_id)        # [0] src id, [1] name, [2] status
if cam_info[2] == 'Deep Learning':
	ut.log('캠페인 정상 조회 되었습니다.')
else:
    ut.errorStop('캠페인 상태를 확인 하세요.')

# 캠페인 상태 변경
db.camStatusUpdate(src_id, 'Machine Learning')

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
y_data = pd.DataFrame()
y_data[target_column] = dataset[target_column]
del dataset[target_column]

# 반응결과 0 & 1 변환
resp_success = ['Y','y']
def respFunc(resp):
	if resp in resp_success:
		return 1
	else:
		return 0
y_data[target_column] = y_data[target_column].map(respFunc)

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
ut.log("Machine Learning 시작 합니다.")

# 훈련데이터와 테스트데이터 분리
X_train, X_test, y_train, y_test = train_test_split(x_data, y_data, test_size = 0.3, random_state = 100)

# trainning method
trainMethodList = ['RandomForest','DecisionTree','LogisticRegression']
# trainMethodList = ['RandomForest','DecisionTree','LogisticRegression','SVM']

for trainmethod in trainMethodList:
	# 시작 시간 확인
	now = dt.datetime.now()
	train_start_time = now.strftime('%Y-%m-%d %H:%M:%S')
	try:
		if trainmethod == 'RandomForest':
			clf = RandomForestClassifier()
			print('Trainning Method :',trainmethod)
		elif trainmethod == 'DecisionTree':
			clf = DecisionTreeClassifier()
			clf.probability = True
			print('Trainning Method :',trainmethod)
		elif trainmethod == 'LogisticRegression':
			clf = LogisticRegression(solver='lbfgs')
			print('Trainning Method :',trainmethod)
		elif trainmethod == 'SVM':
			clf = svm.SVC()
			clf.probability = True
			X_train, X_test, y_train, y_test = train_test_split(x_data, y_data, test_size = 0.8, random_state = 10)
			# Data length
			print('Trainning Method :',trainmethod)
		# fit & predict & test
		clf.fit(X_train, y_train)
		predict = clf.predict(X_test)
		ac_score = metrics.accuracy_score(y_test, predict)
		print(trainmethod + ' accuracy is .................. :',round(ac_score,3))
	except NameError as err:
		ut.errorStop(err)
	# SO engine
	if so_flag == 'Y':
		dataset = x_data
		dataset[y_data.columns[0]] = y_data
		so_score = so.engine(src_id, dataset, trainmethod, ac_score)
	else:
		# model name
		modelname = trainmethod+'.pkl'
		# model save 
		pickle.dump(clf, open(foldername + modelname, 'wb'))
		# so acc
		so_score = 0.0
	# 종료 시간 확인
	now = dt.datetime.now()
	train_end_time = now.strftime('%Y-%m-%d %H:%M:%S')

	# 모델 정보 DB 저장
	train_df = pd.DataFrame({"src_id":[src_id]})		# src_id
	train_df['train_type'] = 'Machine Learning'			# 학습 유형
	train_df['train_method'] = trainmethod				# deeplearning 모델
	train_df['original_acc'] = round(ac_score,3)		# 학습 정확도
	train_df['so_acc'] = so_score						# SO 정확도
	train_df['model_dir'] = foldername					# 모델 저장 경로
	train_df['model_name'] =  trainmethod+'.pkl'		# 모델 명
	train_df['train_start'] = train_start_time			# 학습 시작 시간
	train_df['train_end'] = train_end_time				# 학습 종료 시간

	# DB 저장
	db.trainModelSave(src_id, 'Machine Learning', train_df)
# 머신러닝 모델 선택
db.mlChoiceModel(src_id)
# 학습 종료
db.camStatusUpdate(src_id, 'Learning Complete')

# Deep Learning 학습 종료
ut.log("Machine Learning 종료 합니다.")
subprocess.call(['python', 'predictservice_ml.py', src_id])