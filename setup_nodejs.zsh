#!/usr/bin/env zsh

echo "\n=== Starting Node Setup ===\n"

asdf plugin-add nodejs
asdf install nodejs lts
asdf global nodejs lts
