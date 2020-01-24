#!/bin/sh
cd /usr/src/
source .env

# Clone the git repository
git clone $git_url app

# Open that folder
cd app

# Check if isset $git_branch
if [ ! -z "${git_branch}" ]
then
    # Checkout to this branch
    git checkout $git_branch
fi

# Check if isset $install_sh
if [ ! -z "${install_sh}" ]
then
    # Execute that file
    sh $install_sh
fi