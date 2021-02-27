#!bin/sh -l

set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable

echo "Starts"
PUBLIC_REPO = "$1"
PUBLIC_NAME = "$2"
PUBLIC_AUTHOR = "$3"
PRIVATE_REPO = "$4"
PRIVATE_NAME = "$5"
PRIVATE_AUTHOR = "$6"
PAT = "$7"

CLONE_DIR = $(mktemp - d)
echo "Cloning public git repository"
git config --global user.email "$PUBLIC_AUTHOR"
git config --global user.name "$PUBLIC_NAME"
git clone --single-branch --branch main "https://github.com/$PUBLIC_REPO.git" "$CLONE_DIR"

ls -la "$CLONE_DIR"

echo "hello $1"
time=$(date)
if true ; then
  echo "Game over!"
  exit 0
fi
