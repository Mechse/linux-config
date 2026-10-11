# linux-config

My shell shortcuts for fresh Linux machines.

## Setup

```sh
git clone <repo-url> ~/linux-config
~/linux-config/install.sh
source ~/.bashrc
```

`install.sh` adds a line to `~/.bashrc` (and `~/.zshrc` if present) that sources
`aliases.sh` from this folder, and makes sure SSH login shells load `~/.bashrc`.
It is safe to run again.

## Changing shortcuts

Edit `aliases.sh`, then run `reload`. On other machines, `git pull` and `reload`.

Do not move or delete the cloned folder: the shell reads the aliases from it.
