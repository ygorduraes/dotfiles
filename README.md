# Ygor's dotfiles

## Install homebrew packages

```bash
source brew.sh
```

## Simulate stow

```bash
stow --adopt -nv .
```

## Link files

>🚨All files will be overwritten

```bash
stow --adopt -n .
```

## `plist` files

`plist` files are ignored by stow, so you have to copy them to their directory e.g. `/opt/homebrew/Cellar/colima`
