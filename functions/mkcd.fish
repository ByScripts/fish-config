#doc
# `mkcd foo/bar/baz`: Runs `mkdir foo/bar/baz` then `cd foo/bar/baz`
#enddoc

function mkcd --description 'Creates a directory then "cd" to it'
    mkdir -p "$argv[1]"
    cd "$argv[1]"
end
