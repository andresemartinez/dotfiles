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

# Mysql Client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Android Studio Emulator
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

# Claude Code
export PATH="$HOME/.local/bin:$PATH"
