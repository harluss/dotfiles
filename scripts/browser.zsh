#!/usr/bin/env zsh

NEW_BROWSER=$1

if [[ ! ${NEW_BROWSER} ]]; then
  exit 0
fi

echo "Default browser will be used to sign in to GitHub."

while true; do
  read "ANSWER?Open ${NEW_BROWSER}? If you say no, Safari will remain the default one. [y/n]: "
  case ${ANSWER} in
    [Yy]) echo "Set ${NEW_BROWSER} as default, turn on sync and close the window to continue."; open -a ${NEW_BROWSER} -W; break;;
    [Nn]) break;;
    *) echo "Incorrect answer.";;
  esac
done
