# zshenv
#
# Read by *every* zsh invocation: login or not, interactive or not. That makes it
# the only startup file a plain script shell (`zsh -c ...`) ever sees -- git
# hooks, Makefile recipes and cron jobs all land here and nowhere else.
#
# Keep it fast and side-effect free, since it runs for every script too. No
# oh-my-zsh, no completions, no prompt.

# Make $path/$PATH self-deduplicating, so a dir prepended twice collapses to a
# single entry instead of stacking up.
typeset -U path PATH

# Rust. Written here by rustup's installer.
# .profile sources this too, for the bash chain. ~/.cargo/env guards itself with
# a case check on $PATH, so having both is idempotent rather than duplicated.
. "$HOME/.cargo/env"
