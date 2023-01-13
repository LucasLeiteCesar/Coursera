if [ -f /opt/scripts/.Log_Rotation/appstart.sh ]; then
rm -rf /opt/scripts/.Log_Rotation/appstart.sh
fi

for i in `ps -ef| grep java | egrep -v 'grep|dd-java-agent' | awk '{print $2}'`
do
A=`pwdx $i| cut -f2 -d":"`
echo "cd $A" >> /opt/scripts/.Log_Rotation/appstart.sh
ps -ef | grep -w $i | grep -v grep | awk '{print "nohup " $8 " -javaagent:/etc/datadog-agent/dd-java-agent.jar -Ddd.service= -Ddd.version= -Ddd.logs.injection=true -Ddd.profiling.enabled=true -Ddd.profiling.allocation.enabled=true -Ddd.jmxfetch.enabled=true -Ddd.trace.enabled=true -Ddatadog.slf4j.simpleLogger.logFile=/tmp/payapi.log -Ddd.trace.debug=false -Ddd.env=uat -jar -XX:FlightRecorderOptions=stackdepth=256 -XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints -XX:MaxRAMPercentage=70.0 -XX:GCTimeLimit=90 -XX:HeapDumpPath=/mnt/resource/bluser/heapdump.pof -XX:+HeapDumpOnOutOfMemoryError " $9 " " $10 " " $11 " " $12 " " $13 " " $14 " " $15 " " $16 " " $17 " " $18 " " $19 " " $20 " " $21 " " $22 " " $23 " " $24 " " $25 " " $26 " " $27 " " $28  "&"}' >> /opt/scripts/.Log_Rotation/appstart.sh
echo " " >> /opt/scripts/.Log_Rotation/appstart.sh
done


for i in `ps -ef| grep java | grep dd-java-agent | awk '{print $2}'`

do
A=`pwdx $i| cut -f2 -d":"`
echo "cd $A" >> /opt/scripts/.Log_Rotation/appstart.sh
ps -ef | grep -w $i | grep -v grep | awk '{print  "nohup " $8 " " $9 " " $10 " " $11 " " $12 " " $13 " " $14 " " $15 " " $16 " " $17 " " $18 " " $19 " " $20 " " $21 " " $22 " " $23 " " $24 " " $25 " " $26 " " $27 " " $28  "&"}' >> /opt/scripts/.Log_Rotation/appstart.sh
echo " " >> /opt/scripts/.Log_Rotation/appstart.sh
done
