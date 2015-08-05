#doc
# `delete-domain foobar.tld` : Reverse the `create-domain` process. Delete MySQL user, database and Apache config.
#enddoc

function delete-domain --description 'Delete a domain configuration'
	set _fqdn $argv[1]
    set _domain (echo $_fqdn | cut -f1 -d.)
    set _tld (echo $_fqdn | cut -f2 -d.)
    set _filename (echo /etc/apache2/sites-available/$_fqdn.conf)
    set _database (echo $_fqdn | sed "s/\\./-/g" | sed "s/[^a-z0-9-]//g")
    set _doSomething 0
    set _doApache 0
    set _doDatabase 0
    set _doDatabaseUser 0
    set _doMySql 0

    if __confirm "Drop MySQL user/database?"
        set _doMySql 1
        __blue -n "Enter you MySQL root password: "
        stty -echo
        head -n 1 | read -l _tmpPassword
        set _rootPassword $_tmpPassword
        stty echo
        echo
    end

    if test -e $_filename
        echo
        echo "> Apache config file will be deleted: "(__green -n $_filename)
        set _doApache 1
        set _doSomething 1
    else
        echo
        echo (__blue -n "> WARNING")": Apache config file "(__green -n $_filename)" does not exists. This step will be skipped."
    end

    if test $_doMySql = 1
        if mysql -uroot -p$_rootPassword -N -B -e "SELECT EXISTS(SELECT 1 FROM mysql.db WHERE Db = '$_database')" | grep -q -E '1'
            echo
            echo "> Database will be deleted: "(__green -n $_database)
            set _doDatabase 1
            set _doSomething 1
        else
            echo
            echo (__blue -n "> WARNING")": Database "(__green -n $_database)" does not exists. This step will be skipped."
        end

        if mysql -uroot -p$_rootPassword -N -B -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$_database')" | grep -q -E '1'
            echo
            echo "> Database user will be deleted: "(__green -n $_database)
            set _doDatabaseUser 1
            set _doSomething 1
        else
            echo
            echo (__blue -n "> WARNING")": Database user "(__green -n $_database)" does not exists. This step will be skipped."
        end
    end

    if test $_doSomething = 0
        echo
        __red "Nothing to do. Abort."
        echo
        return
    end

    echo

    if not __confirm "Continue?"
        echo
        __green "Aborted."
        return
    end

    if test $_doApache = 1
        sudo a2dissite $_fqdn > /dev/null
        __green "Website has been deactivated"
        sudo rm $_filename
        __green "Apache config file has been deleted."
    end

    if test $_doMySql = 1
        if test $_doDatabaseUser = 1
            mysql -uroot -p$_rootPassword -e "DROP USER '$_database'@'localhost';"
            __green "Database user has been deleted."
        end

        if test $_doDatabase = 1
            mysql -uroot -p$_rootPassword -e "DROP DATABASE IF EXISTS `$_database`;"
            __green "Database has been deleted."
        end

        mysql -uroot -p$_rootPassword -e "FLUSH PRIVILEGES;"
        __green "MySQL permissions have been updated."
    end

    if test $_doApache = 1
        if __confirm "Do you want to reload Apache config (a2reload)?"
            a2reload > /dev/null
            __green "Apache config has been reloaded"
        end
    end
end
