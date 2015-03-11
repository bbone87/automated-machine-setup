#!/bin/bash

# move to directory where this file is located
cd "$( dirname "${BASH_SOURCE[0]}" )"

# import scripts
. logger.sh
. homebrew-setup.sh

installHomebrew
exit

# config config cron jobs