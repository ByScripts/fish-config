function php-symlink-remove --description 'Remove cli/php.ini symlink'
	sudo rm /etc/php5/cli/php.ini
	sudo cp /etc/php5/apache2/php.ini /etc/php5/cli/php.ini
end
