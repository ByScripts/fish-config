set --export SHELL /usr/bin/fish
set -e fish_greeting

if [ -f ~/.autojump/etc/profile.d/autojump.fish ]
	source ~/.autojump/etc/profile.d/autojump.fish
end

# COMPOSER OPTIONS
complete -A -c composer
complete -c composer -s h 	-l help 			--description "Display the help message."
complete -c composer -s q   -l quiet 			--description "Do not output any message."
complete -c composer -s v   -l verbose 			--description "Increase the verbosity of messages: normal output"
complete -c composer -s vv  					--description "Increase the verbosity of messages: more verbose output"
complete -c composer -s vvv 					--description "Increase the verbosity of messages: debug output"
complete -c composer -s V 	-l version        	--description "Display this application version."
complete -c composer 		-l ansi             --description "Force ANSI output."
complete -c composer 		-l no-ansi          --description "Disable ANSI output."
complete -c composer -s n 	-l no-interaction 	--description "Do not ask any interactive question."
complete -c composer 		-l profile 			--description "Display timing and memory usage information."
complete -c composer -s d 	-l working-dir 		--description "If specified, use the given directory as working directory."

# COMPOSER COMMANDS
complete -c composer -f -a about            	--description "Short information about Composer"
complete -c composer -f -a archive          	--description "Create an archive of this composer package"
complete -c composer -f -a config           	--description "Set config options"
complete -c composer -f -a create-project   	--description "Create new project from a package into given directory."
complete -c composer -f -a depends          	--description "Shows which packages depend on the given package"
complete -c composer -f -a diagnose         	--description "Diagnoses the system to identify common errors."
complete -c composer -f -a dump-autoload    	--description "Dumps the autoloader"
complete -c composer -f -a dumpautoload     	--description "Dumps the autoloader"
complete -c composer -f -a global           	--description "Allows running commands in the global composer dir ($COMPOSER_HOME)."
complete -c composer -f -a help             	--description "Displays help for a command"
complete -c composer -f -a init             	--description "Creates a basic composer.json file in current directory."
complete -c composer -f -a install          	--description "Installs the project dependencies from the composer.lock file if present, or falls back on the composer.json."
complete -c composer -f -a licenses         	--description "Show information about licenses of dependencies"
complete -c composer -f -a list             	--description "Lists commands"
complete -c composer -f -a require          	--description "Adds required packages to your composer.json and installs them"
complete -c composer -f -a run-script       	--description "Run the scripts defined in composer.json."
complete -c composer -f -a search           	--description "Search for packages"
complete -c composer -f -a self-update      	--description "Updates composer.phar to the latest version."
complete -c composer -f -a selfupdate       	--description "Updates composer.phar to the latest version."
complete -c composer -f -a show             	--description "Show information about packages"
complete -c composer -f -a status           	--description "Show a list of locally modified packages"
complete -c composer -f -a update           	--description "Updates your dependencies to the latest version according to composer.json, and updates the composer.lock file."
complete -c composer -f -a validate         	--description "Validates a composer.json"

# COMPLETION ALIASES
make_completion i "apt-get install"
make_completion r "apt-get remove"
make_completion u "apt-get update"
make_completion ug "apt-get upgrade"
make_completion dug "apt-get dist-upgrade"
make_completion ar "apt-get autoremove"
make_completion c "composer"