#!/bin/bash

installHomebrew () {
	logInfo 'Attempting to install Homebrew...'

	# only install brew if it's not already installed
	which brew > /dev/null
	if [ $? -ne 0 ]; then
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		logInfo 'Homebrew already installed'
	fi

	verifyHomebrewConfig
}

verifyHomebrewConfig () {
	logInfo 'Verifying Homebrew configuration'

	brew doctor
	if [ $? -ne 0 ]; then
		logError 'Looks like your Homebrew configuration needs some tending to. Please address the issues listed above before proceeding'
		exit
	fi

	logSuccess 'Homebrew installed and configured successfully!'
}