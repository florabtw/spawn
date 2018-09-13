# Spawn

Some super-specific install scripts for and from Nick Pierson. The goal is to
make all of my (linux) computing environments completely reproducible.

Note that these install scripts will likely only work on Debian-based
distributions.

## Instructions

If you wanted to "spawn" Crostini (Linux in Chrome OS), you would loosely
follow these steps:

```
git clone https://github.com/ncpierson/spawn.git
cd spawn
./crostini/install.sh
```

Each environment has its own set of packages to be installed (to my taste), but
my goal is to have a bunch of top-level package scripts that can be grouped and
pieced together for any particular environment.

## Packages

The following packages are available to install individually. These will likely
only work on a debian-based system, like Ubuntu, Debian itself, or Crostini.

### Personal

* Google Chrome
* Discord
* RuneLite (old school runescape client)
* Slack
* Spotify
* Steam

### Development

* My dotfiles for git, tmux, and vim.
* Firefox Developer Edition
* Java 10
* MongoDB
* nvm, node, npm
* pm2 (and autostart)
* tmux (2.6, from source)
* yarn

Feel free to install the packages individually, as well. You can find most
install scripts in the `packages/` directory. For example, if you just wanted
Discord, try:

```
./packages/discord.sh
```

Feel free to contribute or fork the repo.
