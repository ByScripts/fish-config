set --export SHELL /usr/bin/fish
set --export EDITOR "subl -w"
set -e fish_greeting

if [ -f ~/.autojump/etc/profile.d/autojump.fish ]
	source ~/.autojump/etc/profile.d/autojump.fish
end

# COMPLETION ALIASES
make_completion i "apt-get install"
make_completion r "apt-get remove"
make_completion u "apt-get update"
make_completion ug "apt-get upgrade"
make_completion dug "apt-get dist-upgrade"
make_completion ar "apt-get autoremove"
make_completion c "composer"
make_completion g "git"
make_completion gco "git checkout"
make_completion ga "git add"
make_completion gm "git merge"
make_completion gps "git push"
make_completion gpl "git pull"
make_completion gi "gitignore"
