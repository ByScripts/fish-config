#doc
# `add_to_hosts <hostname>`: Ask for an IP address (defaults to 127.0.0.1) and add `hostname` to /etc/hosts file.
#enddoc

function add_to_hosts -d "Add hostname(s) to /etc/hosts"
    set _ip (__byscripts_ask "Enter IP address [127.0.0.1]")

    if test -n "$argv"
        set _hostnames "$argv"
    else
        set _hostnames (__byscripts_ask "Enter hostnames")
    end

    if test -z $_ip
        set _ip "127.0.0.1"
    end

    echo -n "Do you confirm adding "(__byscripts_blue -n "$_ip $_hostnames")" to "(__byscripts_blue -n "/etc/hosts")"?"

    if __byscripts_confirm
        echo "$_ip    $_hostnames" | sudo tee -a /etc/hosts
        __byscripts_green "Hostname has been added to you hosts file."
    else
        __byscripts_red "Nothing has been added to your hosts file."
    end
end
