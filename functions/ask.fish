function ask
	read -l -p "set_color green; echo '$argv'; set_color normal; echo '> ';" tmp
	echo $tmp
end
