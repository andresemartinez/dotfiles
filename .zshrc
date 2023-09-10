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
alias ll="exa --long -g --git"
alias l="ll -a"
alias tree="exa --tree"

# wayland clipboard
alias wcp="wl-copy"

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
alias ka="kubectl -n cl-jumboweb"
alias kagp="ka get pods"
alias kal="ka logs"
alias kalf="kal -f"
alias kaex="ka exec -it"

# tmux
alias t="tmux new-session -A -s main"

# s3-utils aliases
alias s3it="/home/andres/dev/s3-utils/s3-init"
alias s3cb="/home/andres/dev/s3-utils/scripts/s3-create-bucket"
alias s3uf="/home/andres/dev/s3-utils/scripts/s3-upload-file"
alias s3rf="/home/andres/dev/s3-utils/scripts/s3-remove-file"
alias s3rb="/home/andres/dev/s3-utils/scripts/s3-remove-bucket"
alias s3ls="/home/andres/dev/s3-utils/scripts/s3-ls"

# qnote config
export QNOTE_READER="glow"

# bat
export BAT_THEME="Catppuccin-macchiato"

# asdf
export ASDF_DIR="$HOME/.asdf"
[ -s "$ASDF_DIR/asdf.sh" ] && { \. "$ASDF_DIR/asdf.sh"; \. "$ASDF_DIR/completions/asdf.bash"}

# fzf
source "$HOME/.fzf.zsh"

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

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/home/andres/.sdkman/bin/sdkman-init.sh"

# bash autocomplete scripts
# For some reason nvm executes bashcompinit, so completion scripts must be after that
source $HOME/bin/qnote_completion
