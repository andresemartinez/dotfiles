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

# kuberentes
alias klive="k --context live"
alias klgp="klive get pods"
alias kllf="klive logs -f"
alias kleti="klive exec -ti"

# Minecraft server
alias sshm="ssh root@198.12.73.14"

# Android Studio Emulator
export PATH=$HOME/Android/Sdk/emulator:$PATH

# Flutter
export PATH=$HOME/lib/flutter/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/home/andres/.sdkman/bin/sdkman-init.sh"

