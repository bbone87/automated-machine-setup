#!/bin/bash

# move to project directory and generate list of packages
cd "$( dirname "${BASH_SOURCE[0]}" )"
brew list > "../config/brew-packages.txt"