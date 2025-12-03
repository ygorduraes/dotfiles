#!/usr/bin/env bash

# pre-install
mkdir -p ~/.local/bin

# apt packages
sudo apt update
sudo apt install stow rsync eza fzf tree btop screenfetch ripgrep build-essential unzip
sudo apt install bat && ln -s /usr/bin/batcat ~/.local/bin/bat && batcat cache --build
sudo apt install fd-find && ln -s $(which fdfind)

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# starship (check FiraCode font version from time to time)
curl -L0 https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
mkdir ~/.fonts
unzip FiraCode.zip -d ~/.fonts
fc-cache -fv
curl -sS https://starship.rs/install.sh | sh

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
