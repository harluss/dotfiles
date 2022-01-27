#!/usr/bin/env zsh

browser=$1

if [[ ! ${browser} ]]; then
  exit 0
fi

echo "Default browser will be used to sign in to GitHub."

while true; do
  read "answer?Open ${browser}? If you say no, Safari will remain the default one. [y/n]: "
  case ${answer} in
    [Yy]) echo "Set ${browser} as default, turn on sync and close the window to continue."; open -a ${browser} -W; break;;
    [Nn]) break;;
    *) echo "Incorrect answer.";;
  esac
done
