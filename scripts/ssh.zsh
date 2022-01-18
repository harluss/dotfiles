#!/usr/bin/env zsh

SSH_KEY_FILE=~/.ssh/github_ed25519

if [[ -f ${SSH_KEY_FILE} ]]; then
  echo "Github SSH key ${SSH_KEY_FILE} already exists."
  exit 0
fi

# Generate new SSH key
GITHUB_USER_EMAIL=$(git config --get user.email)
ssh-keygen -t ed25519 -C ${GITHUB_USER_EMAIL} -f ${SSH_KEY_FILE} && echo "Generated new SSH key: ${SSH_KEY_FILE}"

# Start the ssh-agent
eval "$(ssh-agent -s)"

# Add generated SSH private key to ssh-agent
ssh-add -K ${SSH_KEY_FILE}

# Copy the SSH public key to clipboard
pbcopy < ${SSH_KEY_FILE}.pub

# Add the SSH key to GitHub account
echo "Add the SSH key to GitHub account (CMD+V) and quit the browser (CMD+Q)"
open -a firefox -W https://github.com/settings/keys

# Switch remote URL from HTTPS to SSH
REMOTE_URL=$(git config --get remote.origin.url)
if [[ ${REMOTE_URL} == http* ]]; then
  git remote set-url origin "git@github.com:${REMOTE_URL#*github.com/}"
fi