#doc
# `gitignore app1 app2 ... >> .gitignore`: Create a .gitignore from www.gitignore.io
# Get a list of applications with `gitignore list` or simply press TAB to get autocompletion
#enddoc

function gitignore --description 'Generate a .gitignore file from gitignore.io'
	if count $argv > /dev/null
		curl -L -s https://www.gitignore.io/api/$argv
	else
		echo "Usage: gi choice1,choice2,choiceN >> .gitignore"
		echo ""
		echo "To get a list of possible choices: gi list"
	end
end
