#!/usr/bin/env zsh

echo "App Store sign in is required for MAS cli."

while true; do
  read "answer?Open App Store? [y/n]: "
  case ${answer} in
    [Yy]) echo "Sign in and close the app to continue."; open -a "App Store" -W; break;;
    [Nn]) break;;
    *) echo "Incorrect answer.";;
  esac
done
