# "Run commands" aliases
alias bashrc='vi ~/.bashrc'
alias bashrc-aliases='vi $DOTFILES_PATH/bash/.aliases'
alias bashrc-exports='vi $DOTFILES_PATH/bash/.exports'
alias bashrc-functions='vi $DOTFILES_PATH/bash/.functions'
alias vimrc='vi ~/.vimrc'

# Color aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Common aliases
alias l='ls -CF'
alias la='ls -A'
alias open='xdg-open'
alias ps-grep='ps -ely | grep'

# Python aliases
alias python='python3'
alias pip='pip3'
alias virtualenv='virtualenv -v --no-site-packages venv'

# Miscellaneous aliases
alias week='date +%V'

# This should be the last line of the file
# For local changes
# Don't make edits below this
[ -f "$DOTFILES_PATH/bash/.bash_aliases.local" ] && source "$DOTFILES_PATH/bash/.bash_aliases.local"
