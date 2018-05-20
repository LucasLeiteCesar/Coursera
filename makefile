README : README
	touch README.md
	echo "Project from Coursera - Number of files" > README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md
	date >> README.md
