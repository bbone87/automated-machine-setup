#!/bin/bash

packagesConfigPath='config/brew-packages.txt'
casksConfigPath='config/brew-casks.txt'

installHomebrew () {
	logInfo 'Attempting to install Homebrew...'

	# only install brew if it's not already installed
	which brew > /dev/null
	if [ $? -ne 0 ]; then
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		logInfo 'Homebrew already installed'
	fi
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

installHomebrewPackages () {
	logInfo "Loading homebrew packages from $(pwd)/${packagesConfigPath}"

	# install packages from config that aren't already installed
	while read package; do
		brew list $package > /dev/null
		if [ $? -ne 0 ]; then
			logInfo "Running brew install ${package}"
			brew install $package
		else
			logInfo "Homebrew package ${package} already installed -- skipping"
		fi
	done < $packagesConfigPath
}