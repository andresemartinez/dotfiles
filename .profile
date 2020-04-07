#!/bin/bash

#  ____             __ _ _
# |  _ \ _ __ ___  / _(_) | ___
# | |_) | '__/ _ \| |_| | |/ _ \
# |  __/| | | (_) |  _| | |  __/
# |_|   |_|  \___/|_| |_|_|\___|
# 

# Set PATH so it include my personal bin
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
