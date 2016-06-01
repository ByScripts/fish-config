#doc
# Set correct ACL for a Symfony 3 app.
# Create `var` if not exist, then set ACL to `www-data` and current user.
#enddoc

function symfo3-acl --description 'Configure ACL on var directory'
	sudo mkdir -p var
	sudo setfacl -R -m u:www-data:rwX -m u:(whoami):rwX var
	sudo setfacl -dR -m u:www-data:rwx -m u:(whoami):rwx var
end
