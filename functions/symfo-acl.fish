#doc
# Set correct ACL for a Symfony app.
# Create `app/cache` and `app/log` if not exist, then set ACL to `www-data` and current user.
#enddoc

function symfo-acl --description 'Configure ACL on app/cache and app/logs'
	sudo mkdir -p app/cache app/logs
	sudo setfacl -R -m u:www-data:rwX -m u:(whoami):rwX app/cache app/logs
	sudo setfacl -dR -m u:www-data:rwx -m u:(whoami):rwx app/cache app/logs
end
