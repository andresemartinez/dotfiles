#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
# 

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="andrescustom"

plugins=(git git-prompt tig npm ng gradle docker zsh-syntax-highlighting sudo kubectl)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim

# rip zoom
alias kz='ps -fe | rg zoom | rg -v rg | awk '\''{print $2}'\'' | xargs kill'

# fd
alias fd="fdfind"

# exa
alias ll="exa --long -g --git"
alias l="ll -a"

# clipboard
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
# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"
# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"
# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"
# Stop container
alias dto="docker stop"
# Stop all containers
alias dtos="docker ps -q | xargs docker stop"

# k8s
alias ka="kubectl -n application"
alias kagp="ka get pods"
alias kal="ka logs"
alias kalf="kal -f"
alias kaex="ka exec -it"

# s3-utils aliases
alias s3it="/home/andres/dev/salud-prevent/s3-utils/s3-init"
alias s3cb="/home/andres/dev/salud-prevent/s3-utils/scripts/s3-create-bucket"
alias s3uf="/home/andres/dev/salud-prevent/s3-utils/scripts/s3-upload-file"
alias s3rf="/home/andres/dev/salud-prevent/s3-utils/scripts/s3-remove-file"
alias s3rb="/home/andres/dev/salud-prevent/s3-utils/scripts/s3-remove-bucket"
alias s3ls="/home/andres/dev/salud-prevent/s3-utils/scripts/s3-ls"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/home/andres/.sdkman/bin/sdkman-init.sh"

# bash autocomplete scripts
# For some reason nvm executes de bashcompinit, so completion scripts must be before that
source $HOME/bin/qnote_completion

# [ -x "$(command -v tmux)" ] \
#   && [ -z "${TMUX}" ] \
#   && (tmux attach || tmux) >/dev/null 2>&1
