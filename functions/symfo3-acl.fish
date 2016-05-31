#doc
# Set correct ACL for a Symfony app.
# Create `var/cache` and `var/log` if not exist, then set ACL to `www-data` and current user.
#enddoc

function symfo3-acl --description 'Configure ACL on var/cache and var/logs'
    sudo mkdir -p var/cache var/logs
    sudo setfacl -R -m u:www-data:rwX -m u:(whoami):rwX var/cache var/logs
    sudo setfacl -dR -m u:www-data:rwx -m u:(whoami):rwx var/cache var/logs
end
