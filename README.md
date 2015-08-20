fish-config
===========

Fish Shell configuration files

Abbreviations
-------------

[//]: # (abbreviations)

<table>
    <thead><tr><th colspan="2" align="left">Apache</th></tr></thead>
    <tbody>
        <tr><th align="right">a2reload</th><td>sudo service apache2 reload</td></tr>
        <tr><th align="right">a2restart</th><td>sudo service apache2 restart</td></tr>
    </tbody>
    <tr><td colspan="2"></td></tr>
    <thead><tr><th colspan="2" align="left">Artisan</th></tr></thead>
    <tbody>
        <tr><th align="right">a</th><td>php artisan</td></tr>
    </tbody>
    <tr><td colspan="2"></td></tr>
    <thead><tr><th colspan="2" align="left">Apt-Get</th></tr></thead>
    <tbody>
        <tr><th align="right">ar</th><td>sudo apt-get autoremove</td></tr>
        <tr><th align="right">dug</th><td>sudo apt-get dist-upgrade</td></tr>
        <tr><th align="right">i</th><td>sudo apt-get install</td></tr>
        <tr><th align="right">r</th><td>sudo apt-get remove</td></tr>
        <tr><th align="right">u</th><td>sudo apt-get update</td></tr>
        <tr><th align="right">ug</th><td>sudo apt-get upgrade</td></tr>
    </tbody>
    <tr><td colspan="2"></td></tr>
    <thead><tr><th colspan="2" align="left">Composer</th></tr></thead>
    <tbody>
        <tr><th align="right">c</th><td>composer</td></tr>
        <tr><th align="right">ci</th><td>composer install</td></tr>
        <tr><th align="right">cr</th><td>composer require</td></tr>
        <tr><th align="right">csu</th><td>sudo composer self-update</td></tr>
        <tr><th align="right">cu</th><td>composer update</td></tr>
        <tr><th align="right">cv</th><td>composer validate</td></tr>
    </tbody>
    <tr><td colspan="2"></td></tr>
    <thead><tr><th colspan="2" align="left">Git</th></tr></thead>
    <tbody>
        <tr><th align="right">g</th><td>git</td></tr>
        <tr><th align="right">ga.</th><td>git add .</td></tr>
        <tr><th align="right">ga</th><td>git add</td></tr>
        <tr><th align="right">gcm</th><td>git commit -m</td></tr>
        <tr><th align="right">gco</th><td>git checkout</td></tr>
        <tr><th align="right">gi</th><td>gitignore</td></tr>
        <tr><th align="right">gm</th><td>git merge</td></tr>
        <tr><th align="right">gpl</th><td>git pull</td></tr>
        <tr><th align="right">gps</th><td>git push</td></tr>
        <tr><th align="right">gs</th><td>git status</td></tr>
        <tr><th align="right">gc</th><td>git clone</td></tr>
        <tr><th align="right">gd</th><td>git diff</td></tr>
    </tbody>
    <tr><td colspan="2"></td></tr>
    <thead><tr><th colspan="2" align="left">LS</th></tr></thead>
    <tbody>
        <tr><th align="right">l</th><td>ls</td></tr>
    </tbody>
    <tr><td colspan="2"></td></tr>
    <thead><tr><th colspan="2" align="left">NPM</th></tr></thead>
    <tbody>
        <tr><th align="right">ni</th><td>npm install --save-dev</td></tr>
        <tr><th align="right">nig</th><td>npm install -g</td></tr>
        <tr><th align="right">np</th><td>npm prune</td></tr>
        <tr><th align="right">nl</th><td>npm list</td></tr>
        <tr><th align="right">nr</th><td>npm remove</td></tr>
        <tr><th align="right">nu</th><td>npm update</td></tr>
    </tbody>
    <tr><td colspan="2"></td></tr>
    <thead><tr><th colspan="2" align="left">Symfony</th></tr></thead>
    <tbody>
        <tr><th align="right">s</th><td>php app/console</td></tr>
        <tr><th align="right">scc</th><td>php app/console cache:clear</td></tr>
        <tr><th align="right">sgb</th><td>php app/console generate:bundle</td></tr>
        <tr><th align="right">sgc</th><td>php app/console generate:controller</td></tr>
        <tr><th align="right">sdge</th><td>php app/console doctrine:generate:entity</td></tr>
        <tr><th align="right">sdsc</th><td>php app/console doctrine:schema:create</td></tr>
        <tr><th align="right">sdsu</th><td>php app/console doctrine:schema:update</td></tr>
        <tr><th align="right">sdsv</th><td>php app/console doctrine:schema:validate</td></tr>
        <tr><th align="right">sddc</th><td>php app/console doctrine:database:create</td></tr>
    </tbody>
    <tr><td colspan="2"></td></tr>
    <thead><tr><th colspan="2" align="left">Other</th></tr></thead>
    <tbody>
        <tr><th align="right">pg</th><td>pgrep -l</td></tr>
        <tr><th align="right">ccat</th><td>pygmentize -g</td></tr>
        <tr><th align="right">add_to_path</th><td>set -U fish_user_paths $fish_user_paths</td></tr>
        <tr><th align="right">freebox_mount</th><td>sudo mount -t cifs //mafreebox.freebox.fr/Disque\ dur /media/freebox -o user=freebox,uid=1000,gid=1000,rw,password=</td></tr>
    </tbody>
</table>

[//]: # (/abbreviations)

Commands
--------

[//]: # (commands)

#### __byscripts_ask

`__byscripts_ask $question`: Ask the user a `$question` and echoes the answer

#### __byscripts_blue

`__byscripts_blue $string`: Echoes `$string` in blue color

Arguments passed to `__byscripts_blue` are propagated to `echo`

#### __byscripts_confirm

`__byscripts_confirm $string`: Ask the user to confirm (output: `$string [Yn]`)

Return `0` (Y) or `1` (N) status to use with control structure (`if`, `while`...)

#### __byscripts_green

`__byscripts_green $string`: Echoes `$string` in green color

Arguments passed to `__byscripts_green` are propagated to `echo`

#### __byscripts_red

`__byscripts_red $string`: Echoes `$string` in red color

Arguments passed to `__byscripts_red` are propagated to `echo`

#### __byscripts_spinner

`__byscripts_spinner $pid`: Display a spinner while the process with PID `$pid` is running

#### add_to_hosts

`add_to_hosts <hostname>`: Ask for an IP address (defaults to 127.0.0.1) and add `hostname` to /etc/hosts file.

#### create-domain

`create-domain foobar.tld` :

 * Create a `foobar.tld.conf` Apache file pointing to `/var/www/foobar.tld`
 * Create a `foobar-tld` MySQL database
 * Create a `foobar-tld` MySQL user
 * Grant all access on created database to created user

#### delete-domain

`delete-domain foobar.tld` : Reverse the `create-domain` process. Delete MySQL user, database and Apache config.

#### gitignore

`gitignore app1 app2 ... >> .gitignore`: Create a .gitignore from www.gitignore.io
Get a list of applications with `gitignore list` or simply press TAB to get autocompletion

#### mongochef-update

`mongochef-update <url>`:

 * Copy the current `~/Applications/MongoChef` to `~/Applications/MongoChef-{timestamp}`
 * Download MongoChef from `<url>`
 * Extract archive to `~/Applications/MongoChef`

#### php-symlink-remove

Remove the symlinks and copy `apache2/php.ini` back to `cli/php.ini` and `cgi/php.ini`

#### php-symlink

Remove `cli/php.ini` and `cgi/php.ini`, and symlink `apache2/php.ini` instead

#### phpstorm-update

`phpstorm-update <url>`:

 * Copy the current `~/Applications/PhpStorm` to `~/Applications/PhpStorm-{timestamp}`
 * Download PhpStorm from `<url>`
 * Extract archive to `~/Applications/PhpStorm`

#### symfo-acl

Set correct ACL for a Symfony app.
Create `app/cache` and `app/log` if not exist, then set ACL to `www-data` and current user.

[//]: # (/commands)

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
