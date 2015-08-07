set --export SHELL /usr/bin/fish
set --export EDITOR "subl -w"
set -e fish_greeting

if [ -f /usr/share/autojump/autojump.fish ]
	source /usr/share/autojump/autojump.fish
end

source abbreviations.fish
