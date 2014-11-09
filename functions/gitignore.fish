function gitignore --description 'Generate a .gitignore file from gitignore.io'
	if count $argv > /dev/null
		curl -L -s https://www.gitignore.io/api/$argv
	else
		echo "Usage: gi choice1,choice2,choiceN >> .gitignore"
		echo ""
		echo "To get a list of possible choices: gi list"
	end
end
