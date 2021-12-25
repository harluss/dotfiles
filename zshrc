# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/harlus/.oh-my-zsh"

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
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M }'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=237'

# VS Code zsh command
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# For my custom terminal commands
source ~/.my_custom_commands.sh

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

# Aliases
alias ls='ls -lAFh'

# Function to create and enter a new directory
mkcd() {
  mkdir -p "$@" && cd "$_";
}