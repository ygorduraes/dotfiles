#!/usr/bin/env bash

# Prepare homebrew
brew update
brew upgrade

# Essential tools
brew install coreutils
brew install wget
brew install gnupg
brew install neovim
brew install stow
brew install font-symbols-only-nerd-font
brew install --cask ghostty
brew install rsync
brew install eza
brew install fd
brew install fzf
brew install imagemagick
brew install nmap
brew install starship
brew install webp
brew install yazi
brew install bat
brew install zsh-syntax-highlighting
brew install tree
brew install glow
brew install dua-cli
brew install btop
brew install screenfetch
brew install exiftool

# Docker/Podman
brew install kubectl
brew install podman && podman machine init --cpus 4 --memory 4096 && sudo podman-mac-helper install && podman machine stop && podman machine start
brew install podman-compose
brew install derailed/k9s/k9s
brew install lazydocker

# Development
brew instsall pnpm
brew install lazygit
brew install nvm
brew install chruby
brew install uv
brew install http-server
brew install sqlite
brew install rainfrog
brew install gh
brew install git-standup
