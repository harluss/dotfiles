#!/usr/bin/env zsh

SSH_KEY_FILE=~/.ssh/github_ed25519

if [[ ! -f ${SSH_KEY_FILE} ]]; then
  # Generate new SSH key
  GITHUB_USER_EMAIL=$(git config --get user.email)
  ssh-keygen -t ed25519 -C ${GITHUB_USER_EMAIL} -f ${SSH_KEY_FILE} && echo "Generated new SSH key: ${SSH_KEY_FILE}"

  # Start the ssh-agent
  eval "$(ssh-agent -s)"

  # Add generated SSH private key to ssh-agent
  ssh-add -K ${SSH_KEY_FILE} && echo "Added SSH private key to ssh-agent"
fi

# Login using GitHub CLI
echo "Select ${SSH_KEY_FILE#*.ssh/} when asked to Upload your SSH public key."
gh auth login

# Set GitHub CLI editor
gh config set editor "code --wait"

# Switch remote URL from HTTPS to SSH
REMOTE_URL=$(git config --get remote.origin.url)
if [[ ${REMOTE_URL} == http* ]]; then
  git remote set-url origin "git@github.com:${REMOTE_URL#*github.com/}"
  git remote -v
fi

# Test ssh
ssh -T git@github.com