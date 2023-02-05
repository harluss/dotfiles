#!/usr/bin/env zsh

# Example usage:
# ask_for_confirmation "JetBrains Toolbox - Open the app, so you can sign in and download apps?" 'open_app "JetBrains Toolbox" && press_enter_to_continue'
ask_for_confirmation() {
  local CONFIRM_MESSAGE=$1
  local COMMAND=$2

  while true; do
    read "ANSWER?${CONFIRM_MESSAGE} [y/n]: "
    case ${ANSWER} in
      [Yy]) eval ${COMMAND}; break;;
      [Nn]) break;;
      *) echo "Incorrect answer.";;
    esac
  done
}

open_app() {
  open -a $1
}

open_app_and_wait() {
  local APP_TO_OPEN=$1
  local WAIT_MESSAGE=${2:-"Quit the app to continue..."}

  echo ${WAIT_MESSAGE} && open -a ${APP_TO_OPEN} -W
}

press_enter_to_continue() {
  read "?Press [Enter] when you're ready to continue..."
}
