#!/usr/bin/env bash

# Ask for the password upfront
sudo -v

# Update the installed packages
sudo apt-get update
sudo apt-get upgrade

# Install useful packages
sudo apt-get install \
  git \
  build-essential \
  openssh-server \
  xinput-calibrator \
  dig