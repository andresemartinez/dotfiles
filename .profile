#!/bin/bash

# Set PATH so it include my personal bin
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
