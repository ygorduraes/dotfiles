# Ygor's dotfiles

## Clone this repository in your user directory (`~`)

```bash
cd ~
git clone git@github.com:ygorduraes/dotfiles.git
cd dotfiles
```

## Install homebrew packages

Not mandatory, but check if at least stow and apps that are loaded in your `.zshrc` are installed

E.g. if you're using Linux and don't need to install `colima`, you'd better skip this step

```bash
source brew.sh
```

## Simulate stow first (recommended)

Run this command to simulate the config files linking first (`-n` will just simulate the linking)

The `--adopt` option means that if there are existing files, stow will link them *to your git repository* instead of copying from the git repo to the actual config location

```bash
stow --adopt -nv .
```

## Link files

This command will effectively link all the files but if you have any existing files already (e.g. `.zshrc`), stow will overwrite it in the repository, so you will have to cherry pick the changes or just reset the repo with `git restore .`

New files will be linked normally to your user directory

```bash
stow --adopt -n .
```

## Dealing with the `plist` files

`plist` files are ignored through `.stow-local-ignore` because of how homebrew deals with service configurations (there's a fixed version in the path), so you have to copy them to their directory e.g. `/opt/homebrew/Cellar/colima`

## Cleaning up all symbolic links

```bash
stow -D .
```
