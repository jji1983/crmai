#!/bin/bash
SERVICE_NAME=aicap_train
emma_check=`ps -ef | grep -v "grep" | grep $SERVICE_NAME | wc -l`
NOW=$(date +"%Y%m%d")
TIMESTAMP=$(date +"%Y-%m-%d_%T")
LOG_PATH=/home/jji5636/crmAiBatch/logs/runTrain_$NOW.log
PID_PATH_NAME=/home/jji5636/crmAiBatch/pid/runtrain.pid
case $1 in
    start)
        echo "Starting $SERVICE_NAME ..."
        if [ "$emma_check" == "0"  ]; then 
            echo ==========$TIMESTAMP >> $LOG_PATH 2>&1 &
	    /usr/bin/docker exec -i python3 /usr/bin/python3 /notebooks/aicap/aicap_train.py >> $LOG_PATH 2>&1 &           
                        echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is already running ..."
        fi
    ;;
    stop)
        if [ "$emma_check" == "0"  ]; then 
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stoping ..."
            kill $PID;
            echo "$SERVICE_NAME stopped ..."
            rm $PID_PATH_NAME
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
    restart)
        if [ "$emma_check" == "0"  ]; then 
	    PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stopping ...";
            kill $PID;
            echo "$SERVICE_NAME stopped ...";
            rm $PID_PATH_NAME
            echo "$SERVICE_NAME starting ..."
	    /usr/bin/docker exec -i python3 /usr/bin/python3 /notebooks/aicap/aicap_train.py >> $LOG_PATH 2>&1 &            
                        echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac
