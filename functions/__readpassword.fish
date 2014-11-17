function __readpassword
	stty -echo
    head -n 1 | read -l pass
    stty echo

    echo $pass
end
