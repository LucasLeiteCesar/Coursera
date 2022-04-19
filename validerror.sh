#!/usr/bin/env bash
# File: arrays.sh
#resp=0
#t=0

cd /bl/PayScheduler
#counterros=$(grep Error nohup.out | wc -l)
#terro=$(grep error nohup.out | wc -l)

#counterros=$((counterros + terro))


#	if [[ $counterros -gt 0 ]]
#		then
#			echo "Number Errors $counterros "
#			
#
#	fi
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
echo $interv
echo $i

i=$((i+1))
echo $temp

str=${temp}*

terro=$(grep "${temp}*" nohup.out | grep Error | wc -l)
yerror=$(grep "${temp}*" nohup.out | grep error | wc -l)

counterros=$((terro + yerror))


echo $counterros

if [[ $counterros -gt 0 ]]
then
errorfile=true
fi


counterros=0

done 

if [[ $errorfile == true ]]
then
emailid="lucas.cesar@paymentology.com"
mail -s "FAILED FILE: $errorfile $curr_date" $emailid < /bl/PayScheduler/nohup.out


fi

echo $errorfile

