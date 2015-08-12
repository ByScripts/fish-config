#doc
# `__byscripts_confirm $string`: Ask the user to confirm (output: `$string [Yn]`)
# Return 0 (Y) or 1 (N) status to use with control structure (if, while...)
#enddoc

function __byscripts_confirm -d "Ask the user a confirmation"
	while true
	    set confirmation (__byscripts_ask "$argv [Yn]")
		switch $confirmation
			case '' y Y
				return 0
			case n N
				return 1
		end
	end
end
