#!/usr/bin/env zsh

echo "\n=== Starting Java Setup ===\n"

asdf plugin-add java
asdf install java latest:temurin-8
asdf install java latest:temurin-11
asdf install java latest:temurin-17
asdf global java latest:temurin-17
