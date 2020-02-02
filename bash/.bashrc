export DOTFILES_PATH=$(dirname $(realpath "$HOME/.bashrc"))

# Source the aliases
source $DOTFILES_PATH/.bash_aliases

# Source the functions
source $DOTFILES_PATH/.bash_functions

# Source the exports
source $DOTFILES_PATH/.bash_exports

# Set the history
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# The Shopt Builtin
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s nocaseglob
shopt -s histappend
shopt -s checkwinsize

# Define the default colored prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Add git branch to the prompt
PS1+='$(git_branch)'

# Enable the auto-completion for Git
if [ -f "$DOTFILES_PATH/../git/git-completion.bash" ]; then
	source $DOTFILES_PATH/../git/git-completion.bash
fi