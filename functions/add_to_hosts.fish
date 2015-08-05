#doc
# `add_to_hosts <hostname>`: Ask for an IP address (defaults to 127.0.0.1) and add `hostname` to /etc/hosts file.
#enddoc

function add_to_hosts -d "Add hostname(s) to /etc/hosts"
    set _ip (__ask "Enter IP address [127.0.0.1]")

    if test -n "$argv"
        set _hostnames "$argv"
    else
        set _hostnames (__ask "Enter hostnames")
    end

    if test -z $_ip
        set _ip "127.0.0.1"
    end

    echo -n "Do you confirm adding "(__blue -n "$_ip $_hostnames")" to "(__blue -n "/etc/hosts")"?"

    if __confirm
        echo "$_ip    $_hostnames" | sudo tee -a /etc/hosts
        __green "Hostname has been added to you hosts file."
    else
        __red "Nothing has been added to your hosts file."
    end
end
