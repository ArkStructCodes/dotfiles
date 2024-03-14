# If a command is issued that cannot be executed as a normal command, and the command
# is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Resolve symbolic links to their true values when changing directory.
setopt CHASE_LINKS

# On an ambiguous completion, instead of listing possibilities or beeping, insert the
# first match immediately. Noto Sans Mono Regular
setopt MENU_COMPLETE

# Treat the '#', '~', and '^' characters as part of patterns for filename generation.
setopt EXTENDED_GLOB

# If a new command line being added to the history duplicates an older one, the older
# command is removed from the history list even if its not the previous event.
setopt HIST_IGNORE_ALL_DUPS

# Remove superfluous blanks from each command line being added to the history list.
setopt HIST_REDUCE_BLANKS
