function __ask --description "Ask the user a question"
	read -l -p "set_color green; echo -n '$argv'; set_color normal; echo '> ';" tmp
	echo $tmp
end
