#!/bin/bash

#  ____             __ _ _
# |  _ \ _ __ ___  / _(_) | ___
# | |_) | '__/ _ \| |_| | |/ _ \
# |  __/| | | (_) |  _| | |  __/
# |_|   |_|  \___/|_| |_|_|\___|
# 

# Set PATH so it includes my user's bin
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# Rust
source "$HOME/.cargo/env"

# Go
export PATH="$PATH:/usr/local/go/bin"

# Android Studio Emulator
export PATH=$HOME/Android/Sdk/emulator:$PATH

# Flutter
export PATH=$HOME/lib/flutter/bin:$PATH

# Toolbox App
export PATH="$PATH:/home/andres/.local/share/JetBrains/Toolbox/scripts"
. "$HOME/.cargo/env"
