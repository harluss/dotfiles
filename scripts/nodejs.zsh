#!/usr/bin/env zsh

# Install the plugin
asdf plugin-add nodejs
asdf plugin-add yarn

# Install versions
asdf install nodejs lts
asdf install yarn latest

# Set global version
asdf global nodejs lts
asdf global yarn latest