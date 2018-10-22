#!/bin/bash
SERVICE_NAME=aibatch
CLASSPATH=/home/jji5636/crmAiBatch/lib/ojdbc7-12.1.0.2.jar:/home/jji5636/crmAiBatch/lib/crmaiBatch_v0.1.jar
MAIN_CLASS=com.ktds.crmai.AppMain
emma_check=`ps -ef | grep -v "grep" | grep $SERVICE_NAME | wc -l`
NOW=$(date +"%Y%m%d")
TIMESTAMP=$(date +"%Y-%m-%d_%T")
LOG_PATH=/home/jji5636/crmAiBatch/logs/crmAiBatch_$NOW.log
PID_PATH_NAME=/home/jji5636/crmAiBatch/pid/aibatch.pid
JAVA_OPT="-Xms2048m -Xmx2048m" 
case $1 in
    start)
        echo "Starting $SERVICE_NAME ..."
        if [ "$emma_check" == "0"  ]; then 
	    #nohup java $JAVA_OPT -classpath $CLASSPATH $MAIN_CLASS >> /dev/null &
            echo ==========$TIMESTAMP >> $LOG_PATH 2>&1 &
            nohup java $JAVA_OPT -classpath $CLASSPATH $MAIN_CLASS >> $LOG_PATH 2>&1 &
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
            #nohup java $JAVA_OPT -classpath $CLASSPATH $MAIN_CLASS >> /dev/null &
            nohup java $JAVA_OPT -classpath $CLASSPATH $MAIN_CLASS >> $LOG_PATH 2>&1 &
                        echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac
