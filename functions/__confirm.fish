function __confirm -d "Ask the user a confirmation"
	while true
	    set confirmation (__ask "$argv [Yn]")
		switch $confirmation
			case '' y Y
				return 0
			case n N
				return 1
		end
	end
end
