function __gitignore_list
	curl -L -s https://www.gitignore.io/api/list | sed "s/,/ /g"
end

complete -f -A -c gitignore -a (__gitignore_list) 
