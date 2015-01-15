function __ask --description "Ask the user a question"
    set -q argv[1]; and set -l question $argv[1]
    set -q argv[2]; and set -l default_value $argv[2]
	read -l -c "$default_value" -p "set_color green; echo -n '$question'; set_color normal; echo '> ';" tmp
	echo $tmp
end
