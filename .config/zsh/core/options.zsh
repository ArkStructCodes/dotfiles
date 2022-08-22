# Changing Directories
# ====================

# If a command is issued that cannot be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Resolve symbolic links to their true values when changing directory. This also
# has the effect of CHASE_DOTS, i.e. a '..' path segment will be treated as
# referring to the physical parent, even if the preceeding path segment is a
# symbolic link.
setopt CHASE_LINKS


# Expansion and Globbing
# ======================

# Treat the '#', '~', and '^' characters as part of patterns for filename
# generation etc. An initial unquouted '~' always produces named directory
# expansion.
setopt EXTENDED_GLOB


# History
# =======

# If a new command line being added to the history already duplicates an older
# one, the older command is removed from the list even if its not the previous
# event.
setopt HIST_IGNORE_ALL_DUPS

# Remove superfluous blanks from each command line being added to the history
# list.
setopt HIST_REDUCE_BLANKS


# Prompting
# =========

# If set, parameter expansion, command substitution and arithmetic expansion
# are performed in prompts. Substitutions within prompts do not affect the
# command status.
setopt PROMPT_SUBST
