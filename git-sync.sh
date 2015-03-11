#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

# fetch from origin
git fetch origin

# get status
git status

echo $?