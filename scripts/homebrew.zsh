#!/usr/bin/env zsh

if ! command_exists brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Required by Homebrew on Apple silicon
  if [[ $(sysctl -n machdep.cpu.brand_string) =~ ^Apple ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

brew analytics off

# TODO: Keep an eye out for a different `--no-quarantine` solution.
# It's currently exported in zshrc:
# export HOMEBREW_CASK_OPTS="--no-quarantine"
# https://github.com/Homebrew/homebrew-bundle/issues/474
# TODO: when adding profiles, add additional Brewfile per profile
brew bundle #--verbose
