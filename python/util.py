# -*- coding: utf-8 -*-
# import numpy as np
# import random, re
import pandas as pd 

import os
import sys

# error stop
def errorStop(msg):
    try:
        print(msg)
        print('---------------------------------------------------')
        print('Process End')
        print('---------------------------------------------------')
        sys.exit(0)
    except NameError as err:
        print(err)
    return msg

# 로그 프린트
def log(log):
    print("-"*50)
    print(log)
    print("-"*50)

# file parsing
def confParsing(filename):
    try:
        parameter = {}

        f = open(filename, encoding='utf-8')
        data = f.readlines()

        for line in data:
            if not line.strip() or line[0] =='#':
                continue
            else:
                #print(line)
                key, value = line.split("=")
                parameter[key.strip()] = value.strip()
        f.close()
        return parameter
    except OSError:
        print('No such file or directory: ',filename)

# create-folder
def createFolder(directory):
    try:
        if not os.path.exists(directory):
            os.makedirs(directory)
    except OSError:
        print('Error: Creating directory. '+ directory)

# 리스트를 딕션러리 변환
def listToDic(listdata):
    dic_data = {}

    for data in listdata:
        data_split = data.split(':')

        # 문자열 데이터를 숫자로 변환하기 
        #value
        #fn = lambda n : float(n) if re.match(r'^[0-9\.]+$', n) else n
        #list(map(fn, value))

        key     = data_split[0]
        value   = data_split[1]

        dic_data[key] = (value)
    return dic_data

# OneHot Encoder 변환 함수
def oheChange(categorical, category_object, dataset, data):
    #dd
    for cat in categorical:
        print('Column ---> :',cat)
        # Ohe-hot 정보를 불려 옵니다.
        oh_encoder = category_object[cat]
        # LabelEncoder & OneHot Encoder 불러 옵니다.
        le = oh_encoder['LabelEncoder']
        ohe = oh_encoder['OneHotEncoder']
        # 예측데이터 중 새로운 범주가 있는 경우 Label Encoder 추가 합니다.
        # One-Hot 에서는 해당없음 '0' 으로 처리 됩니다.
        le_category = set(le.classes_)
        data_category =set(dataset[cat].unique())
        # new label 확인합니다.
        new_category = list(data_category - le_category)
        if len(new_category) > 0:
            for new_label in new_category:
                print('New Label --->',new_label)
                le.classes_ = np.append(le.classes_, new_label)
        # 범주형 LabelEncoder 처리 합니다.
        cat_le_arr = le.transform(dataset[cat])
        cat_ohe_arr = ohe.transform(cat_le_arr.reshape(-1,1)).toarray()
        oh_df = pd.DataFrame(cat_ohe_arr, columns=[cat+'_'+le.inverse_transform([int(i)])[0] for i in range(cat_ohe_arr.shape[1])])
        # OneHot 결과 데이터 추가 합니다.
        data = pd.concat([data, oh_df], axis=1)
    return data