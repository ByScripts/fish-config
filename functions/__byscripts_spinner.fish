#doc
# `__byscripts_spinner $pid`: Display a spinner while the process with PID `$pid` is running
#enddoc

# Inspired by: http://fitnr.com/showing-a-bash-spinner.html

function __byscripts_spinner --description 'Display a spinner while a process is running' --argument pid
    set -l delay 0.5
    set -l spinstr \| \/ \- \\
    set -l index 1

    while ps x | awk '{print $1}' | grep $pid > /dev/null 2>&1

        printf " [%c]  " $spinstr[$index]
        sleep $delay
        printf "\b\b\b\b\b\b"

        set index (expr $index + 1)

        if [ $index -eq 5 ]
            set index 1
        end
    end

    printf "    \b\b\b\b"
end
