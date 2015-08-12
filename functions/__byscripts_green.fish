#doc
# `__byscripts_green $string`: Echoes `$string` in green color
#
# Arguments passed to `__byscripts_green` are propagated to `echo`
#enddoc

function __byscripts_green -d "Echoes in green"
	set_color -o green; echo $argv; set_color normal
end
