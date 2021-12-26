# Path to your oh-my-zsh installation.
export ZSH="/Users/harlus/.oh-my-zsh"

# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Homebrew options
export HOMEBREW_CASK_OPTS="--no-quarantine"

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Set name of the theme
ZSH_THEME="agnoster"

# ZSH plugins
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# POWERLEVEL9k
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M }"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=237"

# For my custom terminal commands
source ~/.my_custom_commands.sh

# Aliases
# alias ls='ls -lAFh'
alias ls="exa -laFh --git"
alias exa="exa -laFh --git"

# Functions
# VS Code zsh command
code() { 
  VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*;
}

# Switch between different JDK versions
jdk() {
	if [[ ! $1 ]]; then
		/usr/libexec/java_home -V;
		return 0
	fi

  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
}

# Create and enter a new directory
mkcd() {
  mkdir -p "$@" && cd "$_";
}