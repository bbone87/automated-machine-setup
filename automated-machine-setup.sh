#!/bin/bash

# colors
red='\033[0;31m'
endColor='\033[0m'

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install homebrew packages
while read line
do
	brew install "$line";
done < "config/brew-packages.txt"

# install homebrew casks (applications)
while read line
do
	brew cask install "$line";
done < "config/brew-casks.txt"

# config config cron jobs
