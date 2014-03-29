function symfo-acl --description 'Configure ACL on app/cache and app/logs'
	sudo mkdir app/cache app/logs 2>/dev/null
	sudo setfacl -R -m u:www-data:rwX -m u:(whoami):rwX app/cache app/logs
	sudo setfacl -dR -m u:www-data:rwx -m u:(whoami):rwx app/cache app/logs
end
