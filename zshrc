# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Disable macOS's Gatekeeper for brew-casks
export HOMEBREW_CASK_OPTS='--no-quarantine'
# Set bat as default package for redirection (instead of cat)
export NULLCMD=bat

# Add locations to $path array and eliminate duplicates
typeset -U path
path=(
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  $path
)

ANTIGEN_PATH=~/.dotfiles
source $ANTIGEN_PATH/antigen/antigen.zsh
source $(brew --prefix asdf)/libexec/asdf.sh

# Load Antigen config
antigen init ~/.antigenrc

# Aliases
alias exa='exa --group-directories-first --icons'
alias exaa='exa --group-directories-first --icons -a'
alias exal='exa --group-directories-first --icons -lh --git'
alias exaal='exa --group-directories-first --icons -lha --git'
alias man='batman'
alias trail='<<<${(F)path}'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
