function ug --description 'Alias of apt-get upgrade'
	php-symlink-remove
    sudo apt-get upgrade $argv
    php-symlink
end
