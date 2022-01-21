#!/usr/bin/env zsh

# Install the plugin
asdf plugin-add java

# Install versions
# asdf install java latest:adoptopenjdk-8
# asdf install java latest:adoptopenjdk-11
asdf install java latest:temurin-8
asdf install java latest:temurin-11
asdf install java latest:temurin-17

# Set global version
asdf global java latest:temurin-17
