<?php

$content = file_get_contents(__DIR__ . '/abbreviations.fish');

$startTag = '[//] # (aliases)';
$endTag = '[//] # (/aliases)';

$markdownLines = [
    $startTag,
    '',
    '| Alias | Command |',
    '|------:|---------|'
];

function escape($string) {
    return str_replace('|', '\\|', $string);
}

if(preg_match_all('`^abbr\s+(?P<abbreviation>[^\s]+)\s+(?P<command>.*)$`m', $content, $lines, PREG_SET_ORDER)) {
    foreach($lines as $line) {
        $markdownLines[] = sprintf('| %s | %s |', escape($line['abbreviation']), escape($line['command']));
    }
}

$markdownLines[] = '';
$markdownLines[] = $endTag;

$readme = file_get_contents(__DIR__ . '/README.md');

$regex = sprintf('`^%s.*%s$`sm', preg_quote($startTag), preg_quote($endTag));

$markdown = implode("\n", $markdownLines);

preg_match($regex, $readme, $m);

$readme = preg_replace($regex, $markdown, $readme);

file_put_contents(__DIR__ . '/README.md', $readme);
