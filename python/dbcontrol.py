#-*- coding: utf-8 -*-
import psycopg2
from io import StringIO

# DNN X & Y shape 정보를 저장합니다.
def learnShapeSave(src_id,train_type,train_method,x_shape,y_shape):
    conn = psycopg2.connect(getConn())
    # 상태 확인
    with conn.cursor() as c:
        # 추후 merge 문으로 변경 해야 함
        # delete
        delete_string = "delete from public.t_learn_hyper_param \
                          where src_id = %s and train_type = %s and train_method = %s "
        c.execute(delete_string, (src_id, train_type, train_method, ))
        conn.commit()
        # insert
        insert_string = "insert into public.t_learn_hyper_param (src_id, train_type, train_method, x_shape, y_shape) \
                         values (%s, %s, %s, %s, %s) "
        c.execute(insert_string, (src_id,train_type,train_method,x_shape,y_shape,))
        conn.commit()
    conn.close()

# DNN X & Y shape 정보를 조회 합니다.
def learnShapeFind(src_id,train_type,train_method):
    conn = psycopg2.connect(getConn())
    # 상태 확인
    with conn.cursor() as c:
        # select
        select_string = "select x_shape, y_shape \
                           from public.t_learn_hyper_param \
                          where src_id = %s and train_type = %s and train_method = %s "
        c.execute(select_string, (src_id, train_type, train_method, ))
        result = c.fetchone()
    conn.close()
    # result
    return result

# Feature 정보를 저장합니다.
def modelFeatureWeight(src_id,train_method,weight_df):
    conn = psycopg2.connect(getConn())

    sio = StringIO()
    sio.write(weight_df.to_csv(index=None, header=None)) # Wtire the Pandas DataFrame as a csv to buffer
    sio.seek(0) # Be sure to reset the position to te start of the stream

    # Copy the string buffer to the datase, as if it were an actual file
    with conn.cursor() as c:
        # Delete
        del_string = "delete from public.t_model_feature where src_id = %s and train_method = %s "
        c.execute(del_string,(src_id,weight_df['train_method'][0],))

        # DaeaFrame Insert
        c.copy_from(sio, "public.t_model_feature", columns=weight_df.columns, sep=',')
        conn.commit()
    conn.close()

# 하습 & 모델 정보를 저장합니다.
def trainModelSave(src_id,train_type, train_df):
    conn = psycopg2.connect(getConn())

    sio = StringIO()
    sio.write(train_df.to_csv(index=None, header=None)) # Wtire the Pandas DataFrame as a csv to buffer
    sio.seek(0) # Be sure to reset the position to te start of the stream

    # Copy the string buffer to the datase, as if it were an actual file
    with conn.cursor() as c:
        # Delete
        del_string = "delete from public.t_train_model where src_id = %s and train_type = %s and train_method = %s "
        c.execute(del_string,(src_id,train_type, train_df['train_method'][0], ))

        # DaeaFrame Insert
        c.copy_from(sio, "public.t_train_model", columns=train_df.columns, sep=',')
        conn.commit()
    conn.close()

# 머신러닝 모델을 선정합니다.
def mlChoiceModel(src_id):
    conn = psycopg2.connect(getConn())
    # 상태 확인
    with conn.cursor() as c:
        # Update
        init_update_string = "update public.t_train_model \
                            set model_flg = 'N' \
                          where src_id = %s \
                            and train_type = 'Machine Learning' "
        c.execute(init_update_string, (src_id,))
        conn.commit()
        # Select
        select_string = "select train_method, original_acc  \
                           from public.t_train_model  \
                          where src_id   = %s \
                            and train_type = 'Machine Learning' \
                          order by original_acc desc"
        c.execute(select_string, (src_id,))
        result = c.fetchone()
        # Update
        choice_update_string = "update public.t_train_model \
                                   set model_flg = 'Y' \
                                 where src_id = %s \
                                   and train_type = 'Machine Learning'  \
                                   and train_method = %s "
        c.execute(choice_update_string, (src_id, result[0],))
        conn.commit()
    conn.close()

# 캠페인 파일 조회 합니다.
def camTargetCol(src_id):
    conn = psycopg2.connect(getConn())
    # 상태 확인
    with conn.cursor() as c:
        # Select
        select_string = "select feature_name  \
                           from public.t_feature  \
                          where src_id   = %s \
                            and target_flg = 'Y' "
        c.execute(select_string, (src_id,))
        result = c.fetchone()
    conn.close()
    # result
    return result

# 캠페인 훈련 파일 조회 합니다.
def camTrainFileFind(src_id):
    conn = psycopg2.connect(getConn())
    # 상태 확인
    with conn.cursor() as c:
        # Select
        select_string = "select file_name, file_dir  \
                           from public.t_src_file  \
                          where src_id   = %s \
                            and active_flg = 'Y' \
                            and file_type = 'TRAIN' "
        c.execute(select_string, (src_id,))
        result = c.fetchone()
    conn.close()
    # result
    return result

# 캠페인 모델 파일 조회 합니다.
def modelFileFind(src_id, train_type):
    conn = psycopg2.connect(getConn())
    # 상태 확인
    with conn.cursor() as c:
        # Select
        select_string = "select model_name, model_dir  \
                           from public.t_train_model  \
                          where src_id   = %s \
                            and train_type = %s \
                            and model_flg = 'Y' "
        c.execute(select_string, (src_id, train_type,))
        result = c.fetchone()
    conn.close()
    # result
    return result

# 캠페인 예측 파일 조회 합니다.
def camPredictFileFind(src_id):
    conn = psycopg2.connect(getConn())
    # 상태 확인
    with conn.cursor() as c:
        # Select
        select_string = "select file_name, file_dir  \
                           from public.t_src_file  \
                          where src_id   = %s \
                            and active_flg = 'Y' \
                            and file_type = 'PREDICT' "
        c.execute(select_string, (src_id,))
        result = c.fetchone()
    conn.close()
    # result
    return result

# 캠페인 상태 변경 합니다.
def camStatusUpdate(src_id, status_cd):
    # statement
    update_statement = "update public.t_src     \
                           set status_cd     = %s \
                         where src_id        = %s "
    # connect
    conn = None
    try:
        conn = psycopg2.connect(getConn())
        cur = conn.cursor()
        # update
        cur.execute(update_statement, (status_cd, src_id,))
        # commit change
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

# 캠페인 상태 확인 합니다.
def camStatusQuery(src_id):
    conn = psycopg2.connect(getConn())
    # 상태 확인
    with conn.cursor() as c:
        # Select
        select_string = "select t1.src_id, t1.src_name, t1.status_cd  \
                           from public.t_src  t1  \
                          where t1.src_id   = %s "
        c.execute(select_string, (src_id,))
        result = c.fetchone()
    conn.close()
    # result
    return result

# 예측 결과 정보를 저장합니다.
def predictSave(src_id, train_type, train_method, predict_df):
    conn = psycopg2.connect(getConn())

    sio = StringIO()
    sio.write(predict_df.to_csv(index=None, header=None)) # Wtire the Pandas DataFrame as a csv to buffer
    sio.seek(0) # Be sure to reset the position to te start of the stream

    # Copy the string buffer to the datase, as if it were an actual file
    with conn.cursor() as c:
        # Delete
        del_string = "delete from public.t_src_predict \
                       where src_id = %s \
                         and train_type = %s \
                         and train_method = %s "
        c.execute(del_string,(src_id, train_type, train_method,))

        # DaeaFrame Insert
        c.copy_from(sio, "public.t_src_predict", columns=predict_df.columns, sep=',')
        conn.commit()
    conn.close()

# Feature 정보를 저장합니다.
def featureSave(src_id,feature_df):
    conn = psycopg2.connect(getConn())

    sio = StringIO()
    sio.write(feature_df.to_csv(index=None, header=None)) # Wtire the Pandas DataFrame as a csv to buffer
    sio.seek(0) # Be sure to reset the position to te start of the stream

    # Copy the string buffer to the datase, as if it were an actual file
    with conn.cursor() as c:
        # Delete
        del_string = "delete from public.t_feature where src_id = %s "
        c.execute(del_string,(src_id,))

        # DaeaFrame Insert
        c.copy_from(sio, "public.t_feature", columns=feature_df.columns, sep=',')
        conn.commit()
    conn.close()

# Predict ML CSV File Save.
def predictMlCsvSave(src_id, file_name, file_path):
    conn = psycopg2.connect(getConn())
    # 상태 확인
    with conn.cursor() as c:
        # Select
        select_string = "update t_src_file  \
                            set pred_ml_file_path = %s  \
                          where src_id   = %s \
                            and active_flg = 'Y' \
                            and file_name = %s "
        c.execute(select_string, (file_path,src_id,file_name,))
        conn.commit()
       # result = c.fetchone()
    conn.close()
    # result
    #return result 
# Predict DL CSV File Save.
def predictDlCsvSave(src_id, file_name, file_path):
    conn = psycopg2.connect(getConn())
    # 상태 확인
    with conn.cursor() as c:
        # Select
        select_string = "update t_src_file  \
                            set pred_dl_file_path = %s  \
                          where src_id   = %s \
                            and active_flg = 'Y' \
                            and file_name = %s "
        c.execute(select_string, (file_path,src_id,file_name,))
        conn.commit()
       # result = c.fetchone()
    conn.close()
    # result
    #return result 
# Postgresql 접속 정보를 저장합니다.
def getConn():
    user = 'postgres'
    password = 'postgres'
    host_product = 'targetai.iptime.org'
    dbname = 'postgres'
    port = '5544'

    conn_string = "dbname={dbname} user={user} host={host} password={password} port={port}"\
                    .format(dbname=dbname, user=user, host=host_product, password=password, port=port)                    
    return conn_string
