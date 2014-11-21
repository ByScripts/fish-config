function add_to_path -d 'Append a path to FISH Paths'
	set -U fish_user_paths $fish_user_paths $argv
end
