function confirm
	while true
	    set confirmation (ask $argv "[Yn]")
		switch $confirmation
			case '' y Y
				return 0
			case n N 
				return 1
		end
	end
end