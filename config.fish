set --export SHELL /usr/bin/fish
set -e fish_greeting

if [ -f ~/.autojump/etc/profile.d/autojump.fish ]
	source ~/.autojump/etc/profile.d/autojump.fish
end

make_completion i "apt-get install"
make_completion r "apt-get remove"
make_completion u "apt-get update"
make_completion ug "apt-get upgrade"
make_completion dug "apt-get dist-upgrade"
make_completion ar "apt-get autoremove"
