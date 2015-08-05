#doc
# Remove the symlinks and copy `apache2/php.ini` back to `cli/php.ini` and `cgi/php.ini`
#enddoc

function php-symlink-remove --description 'Turn Php5 php.ini syminks to regular files'
    if test -d /etc/php5/cli
        echo "Removing Php5 CLI php.ini symlink"
        sudo rm /etc/php5/cli/php.ini

        echo "Copy Apache2 php.ini to CLI php.ini"
        sudo cp /etc/php5/apache2/php.ini /etc/php5/cli/php.ini
    end

    if test -d /etc/php5/cgi
        echo "Removing Php5 CGI php.ini symlink"
        sudo rm /etc/php5/cgi/php.ini

        echo "Copy Apache2 php.ini to CGI php.ini"
        sudo cp /etc/php5/apache2/php.ini /etc/php5/cgi/php.ini
    end
end
