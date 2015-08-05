set --export SHELL /usr/bin/fish
set --export EDITOR "subl -w"
set -e fish_greeting

if [ -f ~/.autojump/share/autojump/autojump.fish ]
	source ~/.autojump/share/autojump/autojump.fish

source abbreviations.fish
