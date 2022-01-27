#!/usr/bin/env zsh

echo "App Store signin is required for MAS cli."

while true; do
  read "answer?Open App Store? [y/n]: "
  case ${answer} in
    [Yy]) echo "Sign in and close App Store to continue."; open -a "App Store" -W; break;;
    [Nn]) break;;
    *) echo "Incorrect answer.";;
  esac
done
