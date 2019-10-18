#-*- coding: utf-8 -*-
import subprocess
from flask import Flask, render_template, request
from flask_restful import Resource, Api, reqparse
from flask_httpauth import HTTPBasicAuth
from flask_cors import CORS, cross_origin
from aiohttp import web
from aiohttp_wsgi import WSGIHandler
import util as ut

app = Flask(__name__)
auth = HTTPBasicAuth()
cors = CORS(app, resources={
    r"/preprocess":{"origin": "*"},
    r"/deeplearning":{"origin":"*"},
    r"/machinelearning":{"origin":"*"},
    r"/predictservice_ml":{"origin":"*"},
    r"/predictservice_dl":{"origin":"*"},
    })

# 전처리 호출
@app.route('/preprocess', methods = ['GET','POST'])
def preprocess():
	try:
		if request.method == 'POST':
			# 입력변수
			parser = reqparse.RequestParser()
			parser.add_argument('src_id', type=str)
			args = parser.parse_args()

			# 캠페인 Id
			src_id = args['src_id']
			ut.log(src_id)
			# 전처리 py 호출
			subprocess.call(['python', 'preprocess.py', src_id])

			# 결과 리턴
			return {'result_cd': '0000',
			        'result_msg': 'Ok.'}
	except Exception as e:
		return {'resutl_cd': '1000',
				'result_msg': str(e)}

# 딥러닝 호출
@app.route('/deeplearning', methods = ['GET','POST'])
def deeplearning():
	try:
		if request.method == 'POST':
			# 입력변수
			parser = reqparse.RequestParser()
			parser.add_argument('src_id', type=str)
			args = parser.parse_args()		

			# 캠페인 Id
			src_id = args['src_id']

			# 딥러닝 호출
			subprocess.call(['python', 'deeplearning.py', src_id])
			return {'result_cd': '0000',
			        'result_msg': 'Ok.'}
	except Exception as e:
		return {'resutl_cd': '1000',
				'result_msg': str(e)}

# 머신러닝 호출
@app.route('/machinelearning', methods = ['GET','POST'])
def machinelearning():
	try:
		if request.method == 'POST':
			# 입력변수
			parser = reqparse.RequestParser()
			parser.add_argument('src_id', type=str)
			args = parser.parse_args()			

			# 캠페인 Id
			src_id = args['src_id']

			# 머신러닝 호출
			subprocess.call(['python', 'machinelearning.py', src_id])
			return {'result_cd': '0000',
			        'result_msg': 'Ok.'}
	except Exception as e:
		return {'resutl_cd': '1000',
				'result_msg': str(e)}

# 머신러닝 예측 서비스 호출
@app.route('/predictservice_ml', methods = ['GET','POST'])
def predictservice_ml():
	try:
		if request.method == 'POST':
			# 입력변수
			parser = reqparse.RequestParser()
			parser.add_argument('src_id', type=str)
			args = parser.parse_args()

			# 캠페인 Id
			src_id = args['src_id']

			# 딥러닝 호출
			subprocess.call(['python', 'predictservice_ml.py', src_id])
			return {'result_cd': '0000',
			        'result_msg': 'Ok.'}
	except Exception as e:
		return {'resutl_cd': '1000',
				'result_msg': str(e)}

# 딥러닝 예측 서비스 호출
@app.route('/predictservice_dl', methods = ['GET','POST'])
def predictservice_dl():
	try:
		if request.method == 'POST':
			# 입력변수
			parser = reqparse.RequestParser()
			parser.add_argument('src_id', type=str)
			args = parser.parse_args()

			# 캠페인 Id
			src_id = args['src_id']

			# 딥러닝 호출
			subprocess.call(['python', 'predictservice_dl.py', src_id])
			return {'result_cd': '0000',
			        'result_msg': 'Ok.'}
	except Exception as e:
		return {'resutl_cd': '1000',
				'result_msg': str(e)}

@app.route('/')
def main():
	print('main')
	return 'main'

if __name__ == '__main__':
	# 서버 실행
	app.run(debug = True, host="0.0.0.0", port="5000")
	#app.run(debug=True, processes=2, host="0.0.0.0", port="9900")
