#!/usr/bin/env zsh

yes_no_loop() {
  COMMAND=$1
  MESSAGE_TITLE=$2
  MESSAGE_OPEN=$3
  MESSAGE_YES=$4

  echo ${MESSAGE_TITLE}

  while true; do
    read "ANSWER?${MESSAGE_OPEN} [y/n]: "
    case ${ANSWER} in
      [Yy]) echo ${MESSAGE_YES}; eval ${COMMAND}; break;;
      [Nn]) break;;
      *) echo "Incorrect answer.";;
    esac
  done
}
