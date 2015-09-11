function __byscripts_decrease_remaining_length
	set -g _byscripts_remaining_length (expr $_byscripts_remaining_length - $argv)
end

function __byscripts_decorate

	__byscripts_decrease_remaining_length (expr (expr length $argv[1]) + 6)
	echo -n "─┤ "

	if [ (count $argv) -gt 1 ]
		set_color $argv[2..(count $argv)]
	end

	echo -n $argv[1]
	set_color $fish_color_normal
	echo -n " ├─"
end

function __byscripts_prompt_date
    __byscripts_decorate (date +%H:%M:%S) "cc0"
end

function __byscripts_prompt_hostname
	set -l whoami (whoami)"@"(hostname)
	if [ (whoami) = 'root' ]
		__byscripts_decorate $whoami "red" "--underline"
	else
	    __byscripts_decorate $whoami "cyan"
	end
end

function __byscripts_prompt_git

	set -g __fish_git_prompt_show_informative_status 1
	set -g __fish_git_prompt_showcolorhints 1
	set -g __fish_git_prompt_char_stateseparator " "

	set -l prompt (__fish_git_prompt "%s")

	if [ -n "$prompt" ]
		__byscripts_decrease_remaining_length -18
		__byscripts_decorate $prompt
	end
end

function __byscripts_prompt_cwd
	__byscripts_decorate (prompt_pwd) yellow
end

function __byscripts_prompt_fish
	__byscripts_decorate '><(((°>' blue
end

function fish_prompt
	set -g _byscripts_remaining_length (expr $COLUMNS - 1)

	echo -n "┌"

	__byscripts_prompt_cwd
	__byscripts_prompt_git
	__byscripts_prompt_hostname
	__byscripts_prompt_date
	__byscripts_prompt_fish

	printf "%"$_byscripts_remaining_length"s\n" | sed -e "s| |─|g"

    echo "└─▶ "
end
