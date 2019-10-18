#-*- coding: utf-8 -*-
import pandas as pd
import datetime as dt
import pickle
import sys
from sklearn import preprocessing

import subprocess

# target ai
import dbcontrol as db
import util as ut

# input argv(src id)
if len(sys.argv) == 1:
    src_id = '1-1001'
else:
    src_id = sys.argv[1]

# 캠페인 정보 가져오기
cam_info = db.camStatusQuery(src_id)        # [0] src id, [1] name, [2] status
ut.log(cam_info)
if cam_info[2] == 'File Upload':
    ut.log('캠페인 정상 조회 되었습니다.')
else:
    ut.errorStop('캠페인 상태를 확인 하세요.')

# 캠페인 상태 변경
db.camStatusUpdate(src_id, 'Preprocessing')

# 파일 정보 가져오기
cam_file = db.camTrainFileFind(src_id)      # [0] file name, [1] file dir

# Train 파일 정보 가져오기
file_name = cam_file[0]
file_dir = cam_file[1]

# 전처리 시작 합니다. 
ut.log("전처리 시작 합니다.")

# 전처리 저장을 위한 환경 정보 입니다.
foldername = './outputs/'+src_id+'/'
ut.createFolder(foldername)

delete_columns = []         # 삭제 컬럼정보
scaler_object = {}          # 연속형 scaler 
category_object = {}        # 범주형 Label Encoder

# 데이터 로딩 합니다.
ut.log("데이터 로딩합니다.")
dataset = pd.read_csv(file_dir +'/'+ file_name, encoding='utf-8', low_memory=False)

# Feature Name & type 정보를 저장합니다.
feature_df = pd.DataFrame(columns=['feature_name','feature_type'])
for feature in dataset.columns:
    feature_df = feature_df.append({'feature_name':feature, 'feature_type':dataset[feature].dtype}, ignore_index=True)

# Feature 정보에 저장합니다. (Src Id 정보 추가)
feature_df['src_id'] = src_id
db.featureSave(src_id,feature_df)

# null -> 0 처리 합니다.
dataset = dataset.fillna(0)

# 전처리 과정에서 필요없는 항목을 삭제 합니다.
ut.log("항목 삭제 합니다.")
for col in dataset.columns:
    # 이산형과 연속형 분리하여 처리합니다.
    # 이산형
    if dataset[col].dtype == 'object':
        if dataset[col].value_counts().shape[0] <= 1:
            del dataset[col]
            delete_columns.append(col)
        elif dataset[col].value_counts().shape[0]/dataset.shape[0] > 0.5:
            del dataset[col]
            delete_columns.append(col)
    # 연속형
    else:
        # 범위가 1이하인 항목 삭제 합니다.
        if dataset[col].value_counts().shape[0] <= 1:
            del dataset[col]
            delete_columns.append(col)

# 삭제한 Column 정보 저장합니다.
ut.log("삭제 정보 저장 합니다.")
delete_columns = pd.DataFrame(delete_columns)
delete_columns.to_csv(foldername+'delete_columns.csv',mode='w',encoding='utf-8',header=1,index=0)

# 연속형 범주형 구분 합니다.
num_df = dataset.select_dtypes(include=['int64','float64'])
cat_df = dataset.select_dtypes(include=['object'])

# 연속형 데이터 scaler & 정보 저장합니다.
ut.log("연속형 데이터 전처리 합니다.")
scaler = preprocessing.StandardScaler()
scaler.fit(num_df)
with open(foldername+'scaler_object.pickle','wb') as f:
    pickle.dump(scaler, f, pickle.HIGHEST_PROTOCOL)

# 범주형 데이터 LE & ONE 변환 합니다.
ut.log("범주형 데이터 전처리 합니다.")
categorical = list(cat_df.columns.values)

# category 별 le & ohe 변환
for cat_col in categorical:
    # le & ohe 결과를 이미 저장할 Object 정의 합니다.
    oh_encoder = {}
    # Label Encoding 사용 합니다.
    le = preprocessing.LabelEncoder()
    le.fit(dataset[cat_col].astype(str))
    name_arr = le.transform(dataset[cat_col])
    # One-Hot 적용합니다.
    ohe = preprocessing.OneHotEncoder(handle_unknown='ignore')
    ohe.fit(name_arr.reshape(-1,1))
    # 학습과 예측을 위해 le & ohe 저장합니다.
    oh_encoder['LabelEncoder'] = le
    oh_encoder['OneHotEncoder'] = ohe
    # 항목별 OneHot 정보를 저장합니다.
    category_object[cat_col] = oh_encoder
    # 다음을 위해 le & ohe 삭제 합니다.
    del ohe
    del le

# 범주형 데이터 전처리 환경 저장합니다.
with open(foldername+'category_object.pickle','wb') as f:
    pickle.dump(category_object, f, pickle.HIGHEST_PROTOCOL)

# 전처리 종료 합니다.
ut.log("전처리 정상 종료 합니다.")

subprocess.call(['python', 'deeplearning.py', src_id])
