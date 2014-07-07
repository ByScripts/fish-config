function __bys_already_installed
	set_color blue
	echo -n "$argv"
	set_color normal
	echo " already installed."
end

function __bys_installing
	echo -n "Installing "
	set_color blue
	echo -n "$argv"
	set_color normal
	echo "..."
end

function __bys_installed
	return (which "$argv" > /dev/null)
end

function __bys_confirm_install
	echo -n "Do you want to install "
	set_color blue
	echo -n "$argv"
	set_color normal
	echo -n "? "
	return (confirm)
end

function __bys_check_install
	if __bys_installed "$argv[1]"
		__bys_already_installed "$argv[2..-1]"
		return 1
	else if __bys_confirm_install "$argv[2..-1]"
		__bys_installing "$argv[2..-1]"
		return 0
	else
		return 1
	end
end

function install_web
	if __bys_check_install composer "Composer"
		sudo wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer
		sudo chmod +x /usr/local/bin/composer
	end

	if __bys_check_install laravel "Laravel Installer"
	end

	if __bys_check_install codecept "Codeception"
	end

	if __bys_check_install bower "Bower"
	end

	if __bys_check_install gulp "gulp"

	end
end
