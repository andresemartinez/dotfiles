#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

# oh-my-zsh config
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="andrescustom"

plugins=(git git-prompt tig npm gradle docker zsh-syntax-highlighting sudo kubectl)

source $ZSH/oh-my-zsh.sh

# default editor
export EDITOR=vim

# exa
alias ll="eza --long -g --git"
alias l="ll -a"
alias tree="eza --tree"

# docker
alias dl="docker ps -l -q"
# Get container process
alias dps="docker ps"
# Get process included stop container
alias dpa="docker ps -a"
# Get images
alias di="docker images"
# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -it"
# Stop container
alias dto="docker stop"
# Stop all containers
alias dtos="docker ps -q | xargs docker stop"

# k8s
alias kq="kubectl -n qa"
alias kqgp="kq get pods"
alias kqlf="kq logs -f"
alias kqex="kq exec -it"

alias ks="kubectl -n staging"
alias ksgp="ks get pods"
alias kslf="ks logs -f"
alias ksex="ks exec -it"

alias kp="kubectl -n production"
alias kpgp="kp get pods"
alias kplf="kp logs -f"
alias kpex="kp exec -it"

# terraform / opentofu
alias tgrap="terragrunt run --all --non-interactive --queue-include-external --provider-cache -- plan"
alias tgraa="terragrunt run --all --non-interactive --queue-include-external --provider-cache -- apply"

# tmux
alias t="tmux new-session -A -s main"

# homebrew
export HOMEBREW_NO_AUTO_UPDATE=1

# qnote config
export QNOTE_READER="glow"

# bat
export BAT_THEME="Catppuccin-macchiato"

# rbenv
command -v rbenv >/dev/null && eval "$(rbenv init - --no-rehash zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# bash autocomplete scripts
# For some reason nvm executes bashcompinit, so completion scripts must be after that
# source $HOME/bin/qnote_completion
