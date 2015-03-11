#!/bin/bash

# move to project directory and generate list of packages
cd "$( dirname "${BASH_SOURCE[0]}" )"
brew cask list > "../config/brew-casks.txt"