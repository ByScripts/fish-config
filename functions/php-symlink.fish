#doc
# Remove `cli/php.ini` and `cgi/php.ini`, and symlink `apache2/php.ini` instead
#enddoc

function php-symlink --description 'Turn Php5 php.ini regular files to symlinks'
    if test -d /etc/php5/cli
        echo "Removing Php5 CLI php.ini"
        sudo rm /etc/php5/cli/php.ini

        echo "Symlink Apache2 php.ini to CLI php.ini"
        sudo ln -s /etc/php5/apache2/php.ini /etc/php5/cli/php.ini
    end

    if test -d /etc/php5/cgi
        echo "Removing Php5 CGI php.ini"
        sudo rm /etc/php5/cgi/php.ini

        echo "Symlink Apache2 php.ini to CGI php.ini"
        sudo ln -s /etc/php5/apache2/php.ini /etc/php5/cgi/php.ini
    end
end
