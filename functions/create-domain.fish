function create-domain -d "Create a new domain configuration"
	set _fqdn $argv[1]
    set _domain (echo $_fqdn | cut -f1 -d.)
    set _tld (echo $_fqdn | cut -f2 -d.)
    set _filename (echo /etc/apache2/sites-available/$_fqdn.conf)
    set _database (echo $_fqdn | sed "s/\\./-/g" | sed "s/[^a-z0-9-]//g")
    set _password (python -c 'import string; import random; print "".join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(20))')
    set _doSomething 0
    set _doApache 0
    set _doDatabase 0
    set _doDatabaseUser 0

    __blue -n "Enter you MySQL root password: "
    stty -echo
    head -n 1 | read -l _rootPassword
    stty echo
    echo

    if test -e $_filename
        echo
        echo (__blue -n "> WARNING")": Apache config file "(__green -n $_filename)" already exists. This step will be skipped."
    else
        echo
        echo "> Apache config file will be created: "(__green -n $_filename)
        set _doApache 1
        set _doSomething 1
    end

    if mysql -uroot -p$_rootPassword -N -B -e "SELECT EXISTS(SELECT 1 FROM mysql.db WHERE Db = '$_database')" | grep -q -E '1'
        echo
        echo (__blue -n "> WARNING")": Database "(__green -n $_database)" already exists. This step will be skipped."
    else
        echo
        echo "> Database will be created: "(__green -n $_database)
        set _doDatabase 1
        set _doSomething 1
    end

    if mysql -uroot -p$_rootPassword -N -B -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$_database')" | grep -q -E '1'
        echo
        echo (__blue -n "> WARNING")": Database user "(__green -n $_database)" already exists. This step will be skipped."
    else
        echo
        echo "> Database user will be created: "(__green -n $_database)
        set _doDatabaseUser 1
        set _doSomething 1
    end

    if test $_doSomething = 0
        echo
        _red "Nothing to do. Abort."
        echo
        return
    end

    echo

    if not __confirm "Continue?"
        echo
        __red "Aborted."
        return
    end

    if test $_doApache = 1
        sudo cp $HOME/.config/fish/apache-skeleton.conf $_filename
        sudo sed -i "s/_DOMAIN_/$_domain/g" $_filename
        sudo sed -i "s/_TLD_/$_tld/g" $_filename
        __green "Apache config file has been created."
    end

    if test $_doDatabaseUser = 1
        mysql -uroot -p$_rootPassword -e "CREATE USER '$_database'@'localhost' IDENTIFIED BY '$_password';"
        __green "Database user has been created with password: "(__blue -n $_password)
    end

    if test $_doDatabase = 1
        mysql -uroot -p$_rootPassword -e "CREATE DATABASE IF NOT EXISTS `$_database`;"
        __green "Database has been created."
    end

    mysql -uroot -p$_rootPassword -e "GRANT ALL ON `$_database`.* TO '$_database'@'localhost';FLUSH PRIVILEGES;"
    __green "User's permissions on database have been updated."

    echo

    if test $_doApache = 1
        if __confirm "Do you want to activate the website (a2ensite)?"
            sudo a2ensite $_fqdn > /dev/null
            __green "Website has been activated."

            if __confirm "Do you want to reload the Apache config (a2reload)?"
                a2reload > /dev/null
                __green "Apache config has been reloaded."
            end
        else
            __red "Website has not been activated."
        end
    end
end
