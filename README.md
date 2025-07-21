# Ygor's dotfiles

## Simulate stow


```
stow --adopt -nv .
```

## Link files

>🚨All files will be overwritten

```
stow --adopt -n .
```

## `plist` files

`plist` files are ignored by stow, so you have to copy them to their directory e.g. `/opt/homebrew/Cellar/colima` 
