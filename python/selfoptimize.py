#-*- coding: utf-8 -*-

from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn import svm, metrics

import pandas as pd 
import numpy as np
import pickle
import csv
import warnings

# target ai
import util	as ut 
import dbcontrol as db 

# logistic warning
warnings.filterwarnings("ignore", category=FutureWarning)

def engine(src_id, dataset, trainmethod, ac_score):
	print('---------------------------------------------------')
	print('SO Engine Start')
	print('---------------------------------------------------')


	# 전처리 정보 확인 합니다.
	print('Step 0. 환경설정')
	output_dir = './outputs/'
	foldername = output_dir+src_id+'/'

	print('Step 1. LogisticRegression Probability')
	## logistic regiression
	log_clf = LogisticRegression(solver='lbfgs')
	## column & probability dataframe
	col_df = pd.DataFrame({"ColumnName":dataset.columns[0:-1]})
	col_prob = []
	## columns count
	col_count = len(dataset.columns)

	## column probability
	for var_num in range(0, col_count-1):
		# print
		if (var_num+1) % 30 == 0:
			print('컬럼 삭제 수 :',var_num)
		# data split & train
		LR_X = dataset.values[:,var_num:var_num+1]
		LR_Y = dataset.values[:,-1]
		X_train, X_test, y_train, y_test = train_test_split(LR_X, LR_Y, test_size = 0.7, random_state = 100)
		log_clf.fit(X_train, y_train)
		lr_acc = log_clf.score(X_test, y_test)
		col_prob.append(lr_acc)
		# next column
		var_num += 1

	## column & probability join
	col_df['Probability'] = col_prob
	## probability max/min
	col_proba_max = np.max(col_df.Probability)
	col_proba_min = np.min(col_df.Probability)
	## learning rate
	learning_rate = round((col_proba_max - col_proba_min)/(col_count-1),5)

	print('Step 2. Column Deleting Probability')
	## so variable
	so_next_prob = 0
	so_score = ac_score
	## delete column
	so_col_del = []
	## trainning method
	try:
		if trainmethod == 'RandomForest':
			clf = RandomForestClassifier()
		elif trainmethod == 'DecisionTree':
			clf = DecisionTreeClassifier()
			clf.probability = True
		elif trainmethod == 'LogisticRegression':
			clf = LogisticRegression()
		elif trainmethod == 'SVM':
			clf = svm.SVC()
			clf.probability = True
	except NameError as err:
		print(err)
		sys.exit()
	## loop
	try:
		while 1:
			## colimn delete list
			col_drop = col_df[col_df.Probability < col_proba_min + (learning_rate * so_next_prob)]
			col_del = list(col_drop['ColumnName'].values)

			# print columns delete list
			print('Column Delete List :',col_del)

			if len(dataset.columns) <= len(col_del) +1 :
				break;

			so_dataset = dataset.drop(col_del, axis = 1)
			## train data split
			X = so_dataset.values[:,:-1]
			Y = so_dataset.values[:,-1]

			# train method
			X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size = 0.3, random_state = 100)
			if trainmethod == 'SVM':
				X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size = 0.8, random_state = 100)
				
			## fit & predict & test
			clf.fit(X_train, y_train)
			predict = clf.predict(X_test)
			so_score_temp = metrics.accuracy_score(y_test, predict)
			## next loop
			if so_score >= so_score_temp:
				so_next_prob += 1
			else:
				## so acc change
				so_score = so_score_temp
				so_col_del = col_del
			## engine break
			if so_next_prob >= (col_count-3) or len(col_del) >= (col_count-3):
				break 
	except NameError as err:
			print(err)

	print('Step 3. SO Accuracy Train')
	# SO train
	so_dataset = dataset.drop(so_col_del, axis =1)
	# train data split
	X = so_dataset.values[:,0:-1]
	Y = so_dataset.values[:,-1]
	X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size = 0.3, random_state = 100)
	if trainmethod == 'SVM':
		X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size = 0.99, random_state = 100)
	clf.fit(X_train, y_train)
	predict = clf.predict(X_test)

	# 최고 정확도 보장
	#so_score = metrics.accuracy_score(y_test, predict)

	print('Step 4. Model & delete list save')
	# create folder
	try:
		# create folder
		modelname = trainmethod+'.pkl'
		coldelname = trainmethod+'_coldel.csv'
		ut.createFolder(foldername)
		# model save
		pickle.dump(clf, open(foldername + modelname, 'wb'))
		# delete column list save
		f = open(foldername+'/'+coldelname, 'w', encoding='utf-8', newline = '')
		wr = csv.writer(f)
		wr.writerow(so_col_del)
		f.close()
	except NameError as err:
		print(err)

	print('Step 5. Model Importances Feature save')

	# feature importances
	if trainmethod == 'RandomForest' or trainmethod == 'DecisionTree':
		# feature label
		feature_names = np.array(so_dataset.columns[:-1])
		# 중요한 feature 찾기
		importances = pd.DataFrame({'feature_name':feature_names,'weight':np.round(clf.feature_importances_,4)})
		importances['src_id'] = src_id
		importances['train_method'] = trainmethod
		importances['train_type'] = 'Machine Learning'

		# predict dataset insert
		db.modelFeatureWeight(src_id, trainmethod, importances)

	print('---------------------------------------------------')
	print('SO Engine End')
	print('---------------------------------------------------')

	return so_score

