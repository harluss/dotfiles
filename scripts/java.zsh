#!/usr/bin/env zsh

# Install the plugin
asdf plugin-add java
# asdf plugin-add maven

# Install versions
asdf install java latest:temurin-8
asdf install java latest:temurin-11
asdf install java latest:temurin-17
# asdf install maven latest

# Set global version
asdf global java latest:temurin-17
# asdf global maven latest
