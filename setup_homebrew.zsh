#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Currently, you can't do `brew bundle --no-quarantine` as an option.
# Instead, set in zshrc: export HOMEBREW_CASK_OPTS="--no-quarantine".
brew bundle --verbose