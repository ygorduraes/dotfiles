# Ygor's dotfiles

## Clone this repository in your user directory

```bash
cd ~
git clone git@github.com:ygorduraes/dotfiles.git
cd dotfiles
```

## Install homebrew packages

Not mandatory, but check if at least stow and other apps that are loaded in your `.zshrc` are installed

E.g. if you're using Linux and don't need to install `colima`, you'd better skip this step

```bash
source brew.sh
```

## Simulate stow

Run this command to first simulate the config files linking *to your git repository* and decide if you want to mass link all the files or manually copy them over to their directories

```bash
stow --adopt -nv .
```

## Link files

This command will effectively link all the files but if you have any existing files already (e.g. `.zshrc`), stow will overwrite it in the repository, so you will have to cherry pick the changes or just reset the repo with `git restore .`

```bash
stow --adopt -n .
```

## `plist` files

`plist` files are ignored by stow, so you have to copy them to their directory e.g. `/opt/homebrew/Cellar/colima`

## Cleaning up symbolic links

```bash
stow -D .
```
