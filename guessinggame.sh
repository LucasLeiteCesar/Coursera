#!/usr/bin/env bash
# File: arrays.sh
resp=0
t=0
while [[ $t -eq 0 ]]
	do
		echo "Put the number of files in directory"
	read resp
	if [[ $resp -lt 0 ]]
		then
			echo "You put $resp where is negative number"
			t=0

	elif [[ $resp =~ [qwertyuiopasdfghjklzxcvbnm,.ç~] ]]
		then
			echo "You put $resp where is a alpha"
			t=0
	else
			for ARQ in $( ls -lt '.' )
				do
					totl=$(ls -lR | grep '^-' | wc -l)
				done
			if  [[ $resp -eq $totl ]]
				then
					echo "Congratulations you put $resp where is right answer"
					t=1
			elif [[ $resp -lt $totl ]]
				then
					echo "You put $resp and the right is greater your answer"
			elif [[ $resp -gt $totl ]]
				then
					echo "You put $resp and the right is lower your answer"
			fi
	fi
done
