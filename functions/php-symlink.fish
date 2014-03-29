function php-symlink --description 'Create a symlink from apache2/php.ini to cli/php.ini'
	sudo rm /etc/php5/cli/php.ini 
	sudo ln -s /etc/php5/apache2/php.ini /etc/php5/cli/php.ini
end
