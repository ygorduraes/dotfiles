# Starship
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Aliases
alias ls='eza -a --icons -F -H --group-directories-first --git -1'
alias l='ls'
alias ll='ls -alF'
alias bat='bat --theme auto:system --theme-dark bamboo_multiplex --theme-light bamboo_light'

# Config dirs
export XDG_CONFIG_HOME="$HOME/.config"

# Editor
export EDITOR=nvim

# History
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

#Docker/podman
export DOCKER_HOST=unix:///var/run/docker.sock
export KIND_EXPERIMENTAL_PROVIDER=podman
alias docker=podman

# Syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
