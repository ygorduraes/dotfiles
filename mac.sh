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
brew install rg
brew install fzf
brew install imagemagick
brew install nmap
brew install starship
brew install webp
brew install bat && bat cache --build
brew install zsh-syntax-highlighting
brew install tree
brew install dua-cli
brew install btop
brew install screenfetch
brew install exiftool
brew install --cask alt-tab
brew install yt-dlp
brew install tuxedo
brew install ncdu
brew install macos-trash
brew install visidata
brew install zellij

# Docker/Podman
brew install kubectl
brew install docker-credential-helper
brew install colima
brew install docker
brew install docker-compose
brew install docker-buildx
brew install derailed/k9s/k9s
brew install lazydocker

# Development
brew install lazygit
brew install chruby
NVM_VERSION=$(curl -fsSL https://api.github.com/repos/nvm-sh/nvm/releases/latest | sed -n 's/.*"tag_name": "\([^"]*\)".*/\1/p')
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 26
corepack enable pnpm
brew install uv
brew install sqlite
brew install rainfrog
brew install gh && gh extension install github/gh-stack && gh extension install dlvhdr/gh-dash
brew install jiratui
brew install git-standup
brew install anomalyco/tap/opencode
brew install libpq
brew install specify
brew install atac
