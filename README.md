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

Run this command to first simulate the config files linking and decide if you want to mass link all the files or manually copy them over to their directories

```bash
stow --adopt -nv .
```

## Link files

>🚨All your config files will be overwritten with the ones from this repository

```bash
stow --adopt -n .
```

## `plist` files

`plist` files are ignored by stow, so you have to copy them to their directory e.g. `/opt/homebrew/Cellar/colima`

## Cleaning up symbolic links

```bash
stow -D .
```
