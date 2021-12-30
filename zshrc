# Path to your oh-my-zsh installation.
export ZSH='/Users/harlus/.oh-my-zsh'
# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_CASK_OPTS='--no-quarantine'
export NULLCMD=bat

# Set name of the theme
ZSH_THEME='agnoster'

# ZSH plugins
plugins=(git zsh-autosuggestions asdf)

source $(brew --prefix asdf)/libexec/asdf.sh
source $ZSH/oh-my-zsh.sh

# POWERLEVEL9k
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M }'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=237'

# Aliases
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'
alias trail='<<<${(F)path}'

# Functions
# VS Code zsh command
code() { 
  VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*;
}

# Create and enter a new directory
mkcd() {
  mkdir -p "$@" && cd "$_";
}
