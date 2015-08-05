fish-config
===========

Fish Shell configuration files

Aliases
-------

[//] # (aliases)

| Alias | Command |
|------:|---------|
| a | php artisan |
| a2reload | sudo service apache2 reload |
| a2restart | sudo service apache2 restart |
| c | composer |
| ci | composer install |
| cr | composer require |
| csu | sudo composer self-update |
| cu | composer update |
| cv | composer validate |
| ar | sudo apt-get autoremove |
| dug | sudo apt-get dist-upgrade |
| i | sudo apt-get install |
| r | sudo apt-get remove |
| u | sudo apt-get update |
| ug | sudo apt-get upgrade |
| s | php app/console |
| l | ls |
| g | git |
| ga. | git add . |
| ga | git add |
| gcm | git commit -m |
| gco | git checkout |
| gi | gitignore |
| gm | git merge |
| gpl | git pull |
| gps | git push |
| gs | git status |
| gc | git clone |
| psg | ps -ef \| grep |
| add_to_path | set -U fish_user_paths $fish_user_paths |
| freebox_mount | sudo mount -t cifs //mafreebox.freebox.fr/Disque\ dur /media/freebox -o user=freebox,uid=1000,gid=1000,rw,password= |

[//] # (/aliases)

Commands
--------

#### gitignore

`gitignore app1 app2 ... >> .gitignore`: Create a .gitignore from www.gitignore.io
Get a list of applications with `gitignore list` or simply press TAB to get autocompletion

#### php-symlink

Remove `cli/php.ini` and `cgi/php.ini`, and symlink `apache2/php.ini` instead

#### php-symlink-remove

Remove the symlinks and copy `apache2/php.ini` back to `cli/php.ini` and `cgi/php.ini`

#### symfo-acl

Set correct ACL for a Symfony app.
Create `app/cache` and `app/log` if not exist, then set ACL to `www-data` and current user.

#### add_to_path

`add_to_path /foo/bar/bin` : Append the `/foo/bar/bin` path to Fish user PATH

#### create-domain

`create-domain foobar.tld` :

 * Create a `foobar.tld.conf` Apache file pointing to `/var/www/foobar.tld`
 * Create a `foobar-tld` MySQL database
 * Create a `foobar-tld` MySQL user
 * Grant all access on created database to created user

#### delete-domain

`delete-domain foobar.tld` : Reverse the process. Delete MySQL user, database and Apache config.

Prompt
------

```
       ┌─ The current path, shortened
       │             ┌─ Git current branch
       │             │      ┌─ Git status ( ✓ clean / …2 untracked / ●1 staged / ✚1 modified )
       │             │      │           ┌─ Current system user
       │             │      │           │     ┌─ Current system hostname
       │             │      │           │     │             ┌─ Time
       │             │      │           │     │             │             ┌─ A fish...
       ▼             ▼      ▼           ▼     ▼             ▼             ▼
┌─┤ ~/.c/fish ├──┤ master↑1…2●1✚1 ├──┤ who@hostname ├──┤ 22:18:24 ├──┤ ><(((°> ├───────────
└─▶ _
```
