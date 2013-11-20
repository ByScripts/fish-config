function byscripts_decrease_remaining_length
	set -g byscripts_remaining_length (expr $byscripts_remaining_length - $argv)
end

function byscripts_decorate
	
	byscripts_decrease_remaining_length (expr (expr length $argv[1]) + 6)
	echo -n "─┤ "

	if [ (count $argv) -gt 1 ]
		set_color $argv[2..(count $argv)]
	end
	
	echo -n $argv[1]
	set_color $fish_color_normal
	echo -n " ├─"
end

function byscripts_prompt_date
    byscripts_decorate (date +%H:%M:%S) "cc0"
end

function byscripts_prompt_hostname
	set -l whoami (whoami)"@"(hostname)
	if [ (whoami) = 'root' ]
		byscripts_decorate $whoami "red" "--underline"
	else
	    byscripts_decorate $whoami "cyan"
	end
end

function byscripts_prompt_git

	set -g __fish_git_prompt_show_informative_status 1
	set -g __fish_git_prompt_showcolorhints 1
	set -g ___fish_git_prompt_char_stateseparator " "
	
	set -l prompt (__fish_git_prompt "%s")

	if [ -n "$prompt" ]
		byscripts_decrease_remaining_length -18
		byscripts_decorate $prompt
	end
end

function byscripts_prompt_cwd
	byscripts_decorate (prompt_pwd) yellow
end

function byscripts_prompt_fish
	byscripts_decorate '><(((°>' blue
end

function fish_prompt
	set -g byscripts_remaining_length (expr $COLUMNS - 1)

	echo -n "┌"

	byscripts_prompt_cwd
	byscripts_prompt_git
	byscripts_prompt_hostname
	byscripts_prompt_date
	byscripts_prompt_fish

	printf "%"$byscripts_remaining_length"s\n" | sed -e "s| |─|g"
	
    echo "└─▶ "
end
