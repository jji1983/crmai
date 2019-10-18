#-*- coding: utf-8 -*-
import pandas as pd
import numpy as np 
import datetime as dt
import pickle
import sys
import subprocess

# target ai
import dbcontrol as db
import util as ut
import selfoptimize as so 

# input argv(src id)
if len(sys.argv) == 1:
    src_id = '1-1001'
else:
    src_id = sys.argv[1]

# 머신예측
# 캠페인 정보 가져오기
cam_info = db.camStatusQuery(src_id)        # [0] src id, [1] name, [2] status
if cam_info != None:
	if cam_info[2] == 'Learning Complete':
		ut.log('캠페인 정상 조회 되었습니다.')
	else:
	    ut.errorStop('캠페인 상태를 확인 하세요.')
else:
	ut.errorStop('캠페인이 존재하지 않습니다.')	
# 파일 정보 가져오기
cam_file = db.camPredictFileFind(src_id)
if cam_file == None:
	ut.errorStop('예측 파일이 존재하지 않습니다.')

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
ut.log("머신러닝 예측 시작 합니다.")

# 머신러닝 최적 모델 선택 합니다
model_file = db.modelFileFind(src_id, 'Machine Learning')

model_name = model_file[0]
model_dir = model_file[1]

# model load
try:
	loaded_model = pickle.load(open(model_dir+model_name,'rb'))
except:
	print('Train model not exist')
	sys.exit()

# dataset & predict & probability 
pred = loaded_model.predict(x_data)
prob = loaded_model.predict_proba(x_data)

# predict dataset
# predictData = pd.DataFrame(x_data[x_data.columns[0]])
predictData = pd.DataFrame(x_data.index.values, columns=['index_id'])
predictData['predict_val'] = pd.DataFrame(pred)
predictData['success_prob'] = pd.DataFrame(prob[:,1:])
predictData['fail_prob'] = pd.DataFrame(prob[:,0:1])
predictData['src_id'] = src_id
predictData['train_type'] = 'Machine Learning'
predictData['train_method'] = model_name

# DB 저장
db.predictSave(src_id,'Machine Learning', model_name, predictData)

# Machine Learning 예측 종료 합니다.
ut.log("머신러닝 예측 종료 합니다.")
subprocess.call(['python', 'predictservice_dl.py', src_id])