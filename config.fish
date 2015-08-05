set --export SHELL /usr/bin/fish
set --export EDITOR "subl -w"
set -e fish_greeting

if [ -f /usr/share/autojump/autojump.fish ]
	source /usr/share/autojump/autojump.fish
end

# ABBREVIATIONS
abbr a php artisan

abbr a2reload sudo service apache2 reload
abbr a2restart sudo service apache2 restart

abbr c composer
abbr ci composer install
abbr cr composer require
abbr csu sudo composer self-update
abbr cu composer update
abbr cv composer validate

abbr ar sudo apt-get autoremove
abbr dug sudo apt-get dist-upgrade
abbr i sudo apt-get install
abbr r sudo apt-get remove
abbr u sudo apt-get update
abbr ug sudo apt-get upgrade

abbr s php app/console

abbr l ls

abbr g git
abbr ga. git add .
abbr ga git add
abbr gcm git commit -m
abbr gco git checkout
abbr gi gitignore
abbr gm git merge
abbr gpl git pull
abbr gps git push
abbr gs git status
abbr gc git clone

abbr psg ps -ef | grep

abbr add_to_path set -U fish_user_paths $fish_user_paths

abbr freebox_mount sudo mount -t cifs //mafreebox.freebox.fr/Disque\ dur /media/freebox -o user=freebox,password=2405,uid=1000,gid=1000,rw

# TODO: review for new config
#abbr mono_screen xrandr --output VGA-0 --off --output HDMI-0 --off
#abbr triple_screen xrandr --output LVDS --pos 597x1024 --output HDMI-0 --pos 1280x0 --output VGA-0 --pos 0x0
