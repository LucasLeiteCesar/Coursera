#!/usr/bin/env bash
# File: arrays.sh
#resp=0
#t=0

cd /bl/PayRoute_DC_HSM_2BU
#counterros=$(grep Error nohup.out | wc -l)
#terro=$(grep error nohup.out | wc -l)

#counterros=$((counterros + terro))


#       if [[ $counterros -gt 0 ]]
#               then
#                       echo "Number Errors $counterros "
#
#
#       fi
#
#five=5
#data=$(date '+%Y-%m-%d %H:%M:%S')
#dataa=date -d '10 mins'
#echo $(date -d $'2022-04-19 17:15:00' '+%Y-%m-%d %H:%M:%S')
#date: invalid date '$five minutes ago'
#echo $data
#echo $dataa

#sed "/$(date -d "$five minutes ago")/p" nohup.out


curr=$(date +%d/%m/%Y-%H:%M:%S)
#echo $curr
temp=$(date -d "($cur) -15mins" '+%Y-%m-%d %H:%M')
#echo $temp


i=0
interv=15
while [[ $i -lt 16 ]]
do
temp=$((interv-i))


temp=$(date -d "($cur) -$temp mins" '+%Y-%m-%d %H:%M')
#echo $interv
#echo $i

i=$((i+1))
#echo $temp

str=${temp}*

terro=$(grep "${temp}*" nohup.out | grep Error | wc -l)
yerror=$(grep "${temp}*" nohup.out | grep error | wc -l)
zerror=$(grep "${temp}*" nohup.out | grep ERROR | wc -l)
counterros=$((terro + yerror + zerror))


echo "Number errors $counterros at time $temp" >> errorsllc.log


if [[ $counterros -gt 7 ]]
then
errorfile=true
echo " " >> erromessage.log
echo "Check Errors in PayRoute-Mastercard-2BU" >> erromessage.log
message=$(grep "${temp}*" nohup.out | grep ERROR)
echo $message >> erromessage.log
echo " " >> erromessage.log

fi


counterros=0
terro=0
yerror=0
zerror=0

done

if [[ $errorfile == true ]]
then
emailid="teste@teste.com"
mail -s "Please check PayRoute-Mastercard-2BU on priority and engage Pt-SD team $curr" $emailid < /bl/PayRoute_DC_HSM_2BU/erromessage.log

fi

#echo $errorfile
