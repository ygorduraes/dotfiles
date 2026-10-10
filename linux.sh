#!/usr/bin/env bash

# pre-install
mkdir -p ~/.local/bin

# apt packages
sudo apt update
sudo apt install -y stow rsync eza fzf tree btop screenfetch ripgrep build-essential unzip ufw
sudo apt install -y bat && ln -s /usr/bin/batcat ~/.local/bin/bat && batcat cache --build
sudo apt install -y fd-find && ln -s $(which fdfind)

# docker
sudo apt install -y docker.io docker-compose-v2 docker-buildx && sudo usermod -aG docker $(whoami)
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# starship (check FiraCode font version from time to time)
curl -Lo https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.0/FiraCode.zip
mkdir ~/.fonts
unzip FiraCode.zip -d ~/.fonts
fc-cache -fv
rm FiraCode.zip
curl -sS https://starship.rs/install.sh | sh

# zellij
source install-zellij.sh

# basic ufw rules
sudo ufw allow 60000:61000/udp
sudo ufw allow OpenSSH
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow 443/tcp

# Map the host architecture to the release asset names used below
case "$(uname -m)" in
x86_64 | amd64) ARCH=x86_64 ;;
aarch64 | arm64) ARCH=arm64 ;;
*)
  printf 'Unsupported architecture: %s\n' "$(uname -m)" >&2
  exit 1
  ;;
esac

# nvim
curl -L "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${ARCH}.tar.gz" -o nvim.tar.gz
sudo tar -C /opt -xzf nvim.tar.gz
rm nvim.tar.gz

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${ARCH}.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit lazygit.tar.gz
