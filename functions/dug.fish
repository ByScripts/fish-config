function dug --description 'Alias of apt-get dist-upgrade'
	php-symlink-remove
	sudo apt-get dist-upgrade $argv
    php-symlink
end
