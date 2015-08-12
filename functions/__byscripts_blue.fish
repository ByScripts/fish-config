#doc
# `__byscripts_blue $string`: Echoes $string in blue color
#enddoc

function __byscripts_blue -d "Echoes in blue"
	set_color -o blue; echo $argv; set_color normal
end
