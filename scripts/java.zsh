#!/usr/bin/env zsh

_install_java() {
  asdf plugin-add java
  # asdf install java latest:temurin-8
  # asdf install java latest:temurin-11
  asdf install java latest:temurin-17
  asdf global java latest:temurin-17
}

_install_maven() {
  asdf plugin-add maven
  asdf install maven latest
  asdf global maven latest
}

_install_java

# TODO: when adding profiles, add optional installation based on profile