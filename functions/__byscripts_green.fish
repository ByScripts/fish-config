#doc
# `__byscripts_green $string`: Echoes `$string` in green color
#enddoc

function __byscripts_green -d "Echoes in green"
	set_color -o green; echo $argv; set_color normal
end
