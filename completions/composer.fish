function __fish_print_composer_available_package

    set -l search_string (commandline -tc)

    switch $search_string
        case '-**'
            return
    end

    # List of composer package is slow, so we cache the result

    set cache_file /tmp/composer-packages

    if test -f $cache_file

        set age (math (date +%s) - (stat -c '%Y' $cache_file))
        set max_age 300
        if test $age -gt $max_age
            command composer show -a -N > $cache_file
        end
    else
        command composer show -a -N > $cache_file
    end

    cat $cache_file | grep '^'$search_string
end

function __fish_print_composer_installed_package
    set -l search_string (commandline -tc)

    switch $search_string
        case '-**'
            return
    end

    command composer show -i -N | grep '^'$search_string
end

function __fish_composer_no_subcommand --description 'Test if composer has yet to be given the subcommand'
    for i in (commandline -opc)
        if contains -- $i about archive config create-project depends diagnose dumpautoload global help init install licenses list require run-script search selfupdate show status update validate
            return 1
        end
    end
    return 0
end

function __fish_composer_use_installed_package --description 'Test if composer command should have installed packages as potential completion'
    for i in (commandline -opc)
        if contains -- $i depends update
            return 0
        end
    end
    return 1
end

function __fish_composer_use_package --description 'Test if composer command should have packages as potential completion'

    for i in (commandline -opc)
        if contains -- $i require show create-project
            return 0
        end
    end
    return 1
end

function __fish_composer_json
    __fish_composer_no_subcommand
    and test -f composer.json
end

complete -c composer -n "__fish_composer_use_package" -f -a '(__fish_print_composer_available_package)'
complete -c composer -n "__fish_composer_use_installed_package" -f -a '(__fish_print_composer_installed_package)'

# COMPOSER OPTIONS
complete -c composer -s h    -l help                    --description "Display the help message"
complete -c composer -s q    -l quiet                   --description "Do not output any message"
complete -c composer -s v    -l verbose                 --description "Verbose output"
complete -c composer -o vv                              --description "More verbose output"
complete -c composer -o vvv                             --description "Debug output"
complete -c composer -s V    -l version                 --description "Display this application version"
complete -c composer         -l ansi                    --description "Force ANSI output"
complete -c composer         -l no-ansi                 --description "Disable ANSI output"
complete -c composer -s n    -l no-interaction          --description "Do not ask any interactive question"
complete -c composer         -l profile                 --description "Display timing and memory usage information"
complete -c composer -s d    -l working-dir             --description "If specified, use the given directory as working directory"

# COMPOSER COMMANDS
complete -c composer -f -a about                        -n "__fish_composer_no_subcommand"          --description "Short information about Composer"
complete -c composer -f -a archive                      -n "__fish_composer_json"                   --description "Create an archive of this composer package"
complete -c composer -f -a config                       -n "__fish_composer_json"                   --description "Set config options"
complete -c composer -f -a create-project               -n "__fish_composer_no_subcommand"          --description "Create new project from a package into given directory"
complete -c composer -f -a depends                      -n "__fish_composer_json"                   --description "Shows which packages depend on the given package"
complete -c composer -f -a diagnose                     -n "__fish_composer_no_subcommand"          --description "Diagnoses the system to identify common errors"
complete -c composer -f -a dumpautoload                 -n "__fish_composer_json"                   --description "Dumps the autoloader"
complete -c composer -f -a global                       -n "__fish_composer_no_subcommand"          --description "Allows running commands in the global composer dir (\$COMPOSER_HOME)"
complete -c composer -f -a help                         -n "__fish_composer_no_subcommand"          --description "Displays help for a command"
complete -c composer -f -a init                         -n "__fish_composer_no_subcommand"          --description "Creates a basic composer.json file in current directory"
complete -c composer -f -a install                      -n "__fish_composer_json"                   --description "Installs the project dependencies from composer.lock if exists (else composer.json)"
complete -c composer -f -a licenses                     -n "__fish_composer_json"                   --description "Show information about licenses of dependencies"
complete -c composer -f -a list                         -n "__fish_composer_no_subcommand"          --description "Lists commands"
complete -c composer -f -a require                      -n "__fish_composer_no_subcommand"          --description "Adds required packages to your composer.json and installs them"
complete -c composer -f -a run-script                   -n "__fish_composer_no_subcommand"          --description "Run the scripts defined in composer.json"
complete -c composer -f -a search                       -n "__fish_composer_no_subcommand"          --description "Search for packages"
complete -c composer -f -a selfupdate                   -n "__fish_composer_no_subcommand"          --description "Updates composer.phar to the latest version"
complete -c composer -f -a show                         -n "__fish_composer_no_subcommand"          --description "Show information about packages"
complete -c composer -f -a status                       -n "__fish_composer_json"                   --description "Show a list of locally modified packages"
complete -c composer -f -a update                       -n "__fish_composer_json"                   --description "Updates your dependencies to the latest version and updates the composer.lock file"
complete -c composer -f -a validate                     -n "__fish_composer_json"                   --description "Validates a composer.json"

# COMPOSER INIT COMMAND OPTIONS
complete -c composer        -l name                     -n "__fish_seen_subcommand_from init"       --description "Name of the package"
complete -c composer        -l description              -n "__fish_seen_subcommand_from init"       --description "Description of the package"
complete -c composer        -l author                   -n "__fish_seen_subcommand_from init"       --description "Author name of the package"
complete -c composer        -l homepage                 -n "__fish_seen_subcommand_from init"       --description "Homepage of the package"
complete -c composer        -l require                  -n "__fish_seen_subcommand_from init"       --description "Package to require with a version constraint. Should be in format foo/bar:1.0.0"
complete -c composer        -l require-dev              -n "__fish_seen_subcommand_from init"       --description "Development requirements, see --require"
complete -c composer -s s   -l stability                -n "__fish_seen_subcommand_from init"       --description "Value for the minimum-stability field"

# COMPOSER INSTALL COMMAND OPTIONS
complete -c composer        -l prefer-source            -n "__fish_seen_subcommand_from install"    --description "Install package from source (vcs)"
complete -c composer        -l prefer-dist              -n "__fish_seen_subcommand_from install"    --description "Install package from dist"
complete -c composer        -l dry-run                  -n "__fish_seen_subcommand_from install"    --description "Simulate the install"
complete -c composer        -l dev                      -n "__fish_seen_subcommand_from install"    --description "Install packages listed in require-dev"
complete -c composer        -l no-dev                   -n "__fish_seen_subcommand_from install"    --description "Skip packages listed in require-dev"
complete -c composer        -l no-scripts               -n "__fish_seen_subcommand_from install"    --description "Skips execution of scripts defined in composer.json"
complete -c composer        -l no-plugins               -n "__fish_seen_subcommand_from install"    --description "Disables plugins"
complete -c composer        -l no-progress              -n "__fish_seen_subcommand_from install"    --description "Removes the progress display that can mess with some terminals or scripts"
complete -c composer -s o   -l optimize-autoloader      -n "__fish_seen_subcommand_from install"    --description "Convert PSR-0/4 autoloading to classmap to get a faster autoloader"

# COMPOSER UPDATE COMMAND OPTIONS
complete -c composer        -l prefer-source            -n "__fish_seen_subcommand_from update"     --description "Install package from source (vcs)"
complete -c composer        -l prefer-dist              -n "__fish_seen_subcommand_from update"     --description "Install package from dist"
complete -c composer        -l dry-run                  -n "__fish_seen_subcommand_from update"     --description "Simulate the update"
complete -c composer        -l dev                      -n "__fish_seen_subcommand_from update"     --description "Install packages listed in require-dev"
complete -c composer        -l no-dev                   -n "__fish_seen_subcommand_from update"     --description "Skip packages listed in require-dev"
complete -c composer        -l no-scripts               -n "__fish_seen_subcommand_from update"     --description "Skips execution of scripts defined in composer.json"
complete -c composer        -l no-plugins               -n "__fish_seen_subcommand_from update"     --description "Disables plugins"
complete -c composer        -l no-progress              -n "__fish_seen_subcommand_from update"     --description "Removes the progress display that can mess with some terminals or scripts"
complete -c composer -s o   -l optimize-autoloader      -n "__fish_seen_subcommand_from update"     --description "Convert PSR-0/4 autoloading to classmap to get a faster autoloader"
complete -c composer        -l lock                     -n "__fish_seen_subcommand_from update"     --description "Only updates the lock file hash to suppress warning about the lock file being out of date"
complete -c composer        -l with-dependencies        -n "__fish_seen_subcommand_from update"     --description "Add also all dependencies of whitelisted packages to the whitelist"

# COMPOSER REQUIRE COMMAND OPTIONS
complete -c composer        -l prefer-source            -n "__fish_seen_subcommand_from require"    --description "Install package from source (vcs)"
complete -c composer        -l prefer-dist              -n "__fish_seen_subcommand_from require"    --description "Install package from dist"
complete -c composer        -l dev                      -n "__fish_seen_subcommand_from require"    --description "Add packages to require-dev"
complete -c composer        -l no-updates               -n "__fish_seen_subcommand_from require"    --description "Disables the automatic update of the dependencies"
complete -c composer        -l no-progress              -n "__fish_seen_subcommand_from require"    --description "Removes the progress display that can mess with some terminals or scripts"
complete -c composer        -l update-with-dependencies -n "__fish_seen_subcommand_from require"    --description "Also update dependencies of the newly required packages"

# COMPOSER SEARCH COMMAND OPTIONS
complete -c composer -s N   -l only-name                -n "__fish_seen_subcommand_from search"     --description "Search only in name"

# COMPOSER SHOW COMMAND OPTIONS
complete -c composer -s i   -l installed                -n "__fish_seen_subcommand_from show"       --description "List the packages that are installed"
complete -c composer -s p   -l platform                 -n "__fish_seen_subcommand_from show"       --description "List only platform packages (php & extensions)"
complete -c composer -s s   -l self                     -n "__fish_seen_subcommand_from show"       --description "List the root package info"

# COMPOSER DEPENDS COMMAND OPTIONS
complete -c composer        -l link-type                -n "__fish_seen_subcommand_from depends"    --description "The link types (require, require-dev) to match on, can be specified multiple times"

# COMPOSER VALIDATE COMMAND OPTIONS
complete -c composer        -l no-check-all             -n "__fish_seen_subcommand_from validate"   --description "Wether or not composer do a complete validation"

# COMPOSER SELF UPDATE COMMAND OPTIONS
complete -c composer -s r   -l rollback                 -n "__fish_seen_subcommand_from selfupdate" --description "Rollback to the last version you had installed"
complete -c composer -s r   -l rollback                 -n "__fish_seen_subcommand_from self-update" --description "Rollback to the last version you had installed"
complete -c composer        -l clean-backups            -n "__fish_seen_subcommand_from selfupdate" --description "Delete old backups during an update. This makes the current version of composer the only backup available after the update"
complete -c composer        -l clean-backups            -n "__fish_seen_subcommand_from self-update" --description "Delete old backups during an update. This makes the current version of composer the only backup available after the update"

# COMPOSER CONFIG COMMAND OPTIONS
complete -c composer -s g   -l global                   -n "__fish_seen_subcommand_from config"     --description "Operate on the global config file located at \$COMPOSER_HOME/config.json"
complete -c composer -s e   -l editor                   -n "__fish_seen_subcommand_from config"     --description "Open the local composer.json file using in a text editor as defined by the EDITOR env variable. With the --global option, this opens the global config file."
complete -c composer        -l unset                    -n "__fish_seen_subcommand_from config"     --description "Remove the configuration element named by setting-key"
complete -c composer -s l   -l list                     -n "__fish_seen_subcommand_from config"     --description "how the list of current config variables. With the --global option this lists the global configuration only"
complete -c composer -s f   -l file                     -n "__fish_seen_subcommand_from config"     --description "Operate on a specific file instead of composer.json. Note that this cannot be used in conjunction with the --global option"

# COMPOSER CREATE PROJECT COMMAND OPTIONS
complete -c composer        -l repository-url           -n "__fish_seen_subcommand_from create-project" --description ""
complete -c composer -s s   -l stability                -n "__fish_seen_subcommand_from create-project" --description "Minimum stability package. Defaults to stable"
complete -c composer        -l prefer-source            -n "__fish_seen_subcommand_from create-project" --description "Install package from source (vcs)"
complete -c composer        -l prefer-dist              -n "__fish_seen_subcommand_from create-project" --description "Install package from dist"
complete -c composer        -l dev                      -n "__fish_seen_subcommand_from create-project" --description "Install packages listed in require-dev"
complete -c composer        -l no-install               -n "__fish_seen_subcommand_from create-project" --description "Disables installation of the vendors"
complete -c composer        -l no-scripts               -n "__fish_seen_subcommand_from create-project" --description "Skips execution of scripts defined in the root package"
complete -c composer        -l no-plugins               -n "__fish_seen_subcommand_from create-project" --description "Disables plugins"
complete -c composer        -l no-progress              -n "__fish_seen_subcommand_from create-project" --description "Removes the progress display that can mess with some terminals or scripts"
complete -c composer        -l keep-vcs                 -n "__fish_seen_subcommand_from create-project" --description "Skip the deletion of the VCS metadata for the created project"

# COMPOSER DUMP AUTOLOAD COMMAND OPTIONS
complete -c composer -s o   -l optimize                 -n "__fish_seen_subcommand_from dump-autoload"  --description "Convert PSR-0/4 autoloading to classmap to get a faster autoloader"
complete -c composer        -l no-dev                   -n "__fish_seen_subcommand_from dump-autoload"  --description "Disables the autoload-dev rules"

# COMPOSER ARCHIVE COMMAND OPTIONS
complete -c composer -s f   -l format                   -n "__fish_seen_subcommand_from archive"    --description "Format of the resulting archive: tar or zip"
complete -c composer        -l dir                      -n "__fish_seen_subcommand_from archive"    --description "Write the archive to this directory"
