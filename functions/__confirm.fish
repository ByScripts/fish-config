function __confirm
	while read -p 'echo "[Y]es or [N]o > "' -l _userChoice
        if echo "$_userChoice" | grep -q -E '^[nN]'
            return 1
        end

        if echo "$_userChoice" | grep -q -E '^[yY]'
            return 0
        end
    end
end
