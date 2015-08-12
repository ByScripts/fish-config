#doc
# `__byscripts_red $string`: Echoes `$string` in red color
#
# Arguments passed to `__byscripts_red` are propagated to `echo`
#enddoc

function __byscripts_red -d "Echoes in red"
	set_color -o red; echo $argv; set_color normal
end
