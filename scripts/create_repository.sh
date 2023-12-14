#!bin/bash

if [ -z "$1" ]; then
  echo "Missing name of repository."
  exit 1
fi

echo "Creating Git repo as '/repository/${1}'"
mkdir cd /home/git/repository/$1.git 

echo "Preparing repository"
cd cd /home/git/repository/$1.git && git init --bare
cd /home/git/repository
chown git:git -R /home/git/repository/$1.git

echo "Created succesfully repository."