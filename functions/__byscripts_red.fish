#doc
# `__byscripts_red $string`: Echoes `$string` in red color
#enddoc

function __byscripts_red -d "Echoes in red"
	set_color -o red; echo $argv; set_color normal
end
