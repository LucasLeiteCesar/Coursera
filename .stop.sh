JAR_PATH=/bl/PayApi
#JAR_NAME=PayApi-2.8.3-SNAPSHOT.jar


cd $JAR_PATH




JAR_NAME=$(ls -lt |grep Pay*jar |awk '{print $9}')
echo "$JAR_NAME Service we stop"
echo " "
echo " "


TMEP_PATH=/mnt/resource/bluser
TODAY=$(date +%d-%b-%Y-%H-%M)
LOG_PATH=`echo $JAR_PATH | cut -f3 -d"/"`
API_PID=$TMEP_PATH/$LOG_PATH.pid
STOPLOG_NAME=$TMEP_PATH/$LOG_PATH_stop.log

if [ -e $API_PID ]; then
kill -9 `cat "$API_PID"` >/dev/null 2>&1

        rm -rf $TMEP_PATH/$LOG_PATH.pid
        echo "$JAR_PATH $JAR_NAME has been stopped at $TODAY">> $STOPLOG_NAME
echo "    #     ######   ######                                                                                         "
echo "   # #    #     #  #     #                                            "
echo "  #   #   #     #  #     #                                            "
echo " #     #  ######   ######                                             "
echo " #######  #        #                                                  "
echo " #     #  #        #                                                  "
echo " #     #  #        #                                                  "
echo "                                                                      "
echo "                                                                      "
echo " ######   ######   #######   #####   #######   #####    #####         "
echo " #     #  #     #  #     #  #     #  #        #     #  #     #        "
echo " #     #  #     #  #     #  #        #        #        #              "
echo " ######   ######   #     #  #        #####     #####    #####         "
echo " #        #   #    #     #  #        #              #        #        "
echo " #        #    #   #     #  #     #  #        #     #  #     #        "
echo " #        #     #  #######   #####   #######   #####    #####         "
echo "                                                                      "
echo "                                                                      "
echo " #    #  ###  #        #        #######  ######                       "
echo " #   #    #   #        #        #        #     #                      "
echo " #  #     #   #        #        #        #     #                      "
echo " ###      #   #        #        #####    #     #                      "
echo " #  #     #   #        #        #        #     #                      "
echo " #   #    #   #        #        #        #     #                      "
echo " #    #  ###  #######  #######  #######  ######                       "


fi


sleep 5


APIPID=`ps -ef | grep -i java | grep $JAR_NAME | grep -v grep | awk '{print $2}' | xargs pwdx 2> /dev/null`
if [[ "" !=  "$APIPID" ]]; then
  kill -9 $APIPID
        echo "$JAR_PATH $JAR_NAME has been stopped at $TODAY">> $STOPLOG_NAME
else
echo "#     #  #######        ######   ######   #######   #####   #######   #####    #####         ######   #     #  #     #  #     #  ###  #     #   #####    "
echo "##    #  #     #        #     #  #     #  #     #  #     #  #        #     #  #     #        #     #  #     #  ##    #  ##    #   #   ##    #  #     #   "
echo "# #   #  #     #        #     #  #     #  #     #  #        #        #        #              #     #  #     #  # #   #  # #   #   #   # #   #  #         "
echo "#  #  #  #     #        ######   ######   #     #  #        #####     #####    #####         ######   #     #  #  #  #  #  #  #   #   #  #  #  #  ####   "
echo "#   # #  #     #        #        #   #    #     #  #        #              #        #        #   #    #     #  #   # #  #   # #   #   #   # #  #     #   "
echo "#    ##  #     #        #        #    #   #     #  #     #  #        #     #  #     #        #    #   #     #  #    ##  #    ##   #   #    ##  #     #   "
echo "#     #  #######        #        #     #  #######   #####   #######   #####    #####         #     #   #####   #     #  #     #  ###  #     #   #####    "

fi
