#!/usr/bin/env zsh

# Note: xcode-select is required for Git and Homebrew

if ! command_exists xcode-select; then
  xcode-select --install
fi
