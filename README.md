fish-config
===========

Fish Shell configuration files

Aliases
-------

| Alias | Command                   |
|------:|---------------------------|
| i     | sudo apt-get install      |
| u     | sudo apt-get update       |
| r     | sudo apt-get remove       |
| ar    | sudo apt-get autoremove   |
| ug    | sudo apt-get upgrade      |
| dug   | sudo apt-get dist-upgrade |
| c     | clear                     |
| l     | ls                        |

Prompt
------

```
       ┌─ The current path, shortened
       │           ┌─ Git commit status ( ✓ nothing to commit / ✕ changes to commit )
       │           │   ┌─ Git current branch
       │           │   │          ┌─ Current system user
       │           │   │          │     ┌─ Current system hostname
       │           │   │          │     │           ┌─ Current time
       │           │   │          │     │           │               ┌─ A fish...
       ▼           ▼   ▼          ▼     ▼           ▼               ▼
┌─┤ ~/.c/fish ├──┤ ✓ master ├──┤ who@hostname ├──┤ 22:18:24 ├──┤ ><(((°> ├───────────
└─▶ _
```