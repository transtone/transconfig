#!/bin/bash

PIDFILE=/home/zhou/public_html/django/stone/django-fcgi.pid
PROJDIR=/home/zhou/public_html/django/stone

startpyfcgi(){
       exec /usr/bin/env - \
           PYTHONPATH="../python:.." \
           python $PROJDIR/manage.py runfcgi host=127.0.0.1 port=9008 pidfile=$PIDFILE
       echo "success start."
}
 
if [ "$1" == "start" ]
then
        if [ ! -f $PIDFILE ]
        then
                startpyfcgi
        else
                pidcount=`ps -ef |grep ${django-fcgi}|wc -l`
                if [ "$pidcount" -gt "1" ]
                then
                        echo "service is already running."
                else
                        rm -f ${PIDFILE}
                        startpyfcgi
                fi
        fi
 
elif [ "$1" == "stop" ]
then
        pid=`cat ${PIDFILE}`
        kill ${pid}
        rm -f ${PIDFILE}
        echo "success stop."
else
        echo "py-fcgi.sh [start|stop]"
        exit
fi



