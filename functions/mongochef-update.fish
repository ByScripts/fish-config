#doc
# `mongochef-update <url>`:
#
#  * Copy the current `~/Applications/MongoChef` to `~/Applications/MongoChef-{timestamp}`
#  * Download MongoChef from `<url>`
#  * Extract archive to `~/Applications/MongoChef`
#enddoc

function mongochef-update -a url

    if test -z $url
        __red "Usage: mongochef-update <url>"
        return
    end

    echo -n "Downloading $url... "
    set -l MONGOCHEF_FILENAME (basename "$url")

    echo -n "    "
    wget -P "/tmp" --progress=dot $url 2>&1 | grep --line-buffered "%" | sed -u -e "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
    echo -ne "\b\b\b\b"
    __green "OK"

    if test -d "$HOME/Applications/MongoChef"
        set -l TODAY (date +"%Y-%m-%d-%H-%M")
        mv "$HOME/Applications/MongoChef" "$HOME/Applications/MongoChef-$TODAY"
    end

    mkdir -p "$HOME/Applications/MongoChef"

    echo -n "Extracting $MONGOCHEF_FILENAME... "
    tar --strip-components=1 -C "$HOME/Applications/MongoChef" -xzf "/tmp/$MONGOCHEF_FILENAME"
    __green "OK"
end
