#  _________             __ _ _      
# |__  /  _ \ _ __ ___  / _(_) | ___ 
#   / /| |_) | '__/ _ \| |_| | |/ _ \
#  / /_|  __/| | | (_) |  _| | |  __/
# /____|_|   |_|  \___/|_| |_|_|\___|
#                                    

source $HOME/.profile

# WHY THIS EXISTS (it is a workaround -- see the TODO in the repo README):
#
# zsh gates .zprofile on the shell being a *login* shell and .zshrc on it being
# *interactive*, and those two flags are independent. So a login non-interactive
# shell (`zsh -lc '...'`) reads this file and never reads .zshrc.
#
# That combination is exactly how VSCode and JetBrains resolve the environment:
# a GUI app launched from the Dock inherits launchd's minimal PATH, so the IDE
# spawns a login shell to find out what your real PATH is. Every version manager
# we use (asdf, rbenv, nvm, sdkman) is set up in .zshrc, so without the line
# below those IDEs come up with no node/java toolchain -- which is the "cannot
# find the node version" bug this was originally added to fix.
#
# The guard matters. For a login *interactive* shell (i.e. any normal terminal
# window) zsh sources .zshrc by itself, so sourcing it unconditionally here ran
# the entire file -- oh-my-zsh, nvm, rbenv -- a second time on every shell start.
[[ -o interactive ]] || source $HOME/.zshrc

