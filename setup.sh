#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Check for updates
git pull origin master

# Install the missing packages
source packages.sh

# Create and source the symlinks
source symlink.sh
source .bash_profile

# Sync the files to your home folder
function doIt() {
  rsync --exclude ".git/" \
    --exclude ".gitignore" \
    --exclude ".DS_Store" \
    --exclude "setup.sh" \
    --exclude "packages.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    -avh --no-perms . ~;
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;