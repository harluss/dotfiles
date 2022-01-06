#!/usr/bin/env zsh

asdf plugin-add java

asdf install java latest:temurin-8
asdf install java latest:temurin-11
asdf install java latest:temurin-17

asdf global java latest:temurin-17
