#doc
# `phpstorm-update <url>`:
#
#  * Copy the current `~/Applications/PhpStorm` to `~/Applications/PhpStorm-{timestamp}`
#  * Download PhpStorm from `<url>`
#  * Extract archive to `~/Applications/PhpStorm`
#enddoc

function phpstorm-update -a url

    if test -z $url
        __red "Usage: phpstorm-update <url>"
        return
    end

    echo -n "Downloading $url... "
    set -l STORM_FILENAME (basename "$url")

    echo -n "    "
    wget -P "/tmp" --progress=dot $url 2>&1 | grep --line-buffered "%" | sed -u -e "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
    echo -ne "\b\b\b\b"
    __green "OK"

    if test -d "$HOME/Applications/PhpStorm"
        set -l TODAY (date +"%Y-%m-%d-%H-%M")
        mv "$HOME/Applications/PhpStorm" "$HOME/Applications/PhpStorm-$TODAY"
    end

    mkdir -p "$HOME/Applications/PhpStorm"

    echo -n "Extracting $STORM_FILENAME... "
    tar --strip-components=1 -C "$HOME/Applications/PhpStorm" -xzf "/tmp/$STORM_FILENAME"
    __green "OK"
end
