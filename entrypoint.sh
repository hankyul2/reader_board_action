#!bin/sh -l

set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable

echo "Starts"
echo "$INPUT_PUBLIC_AUTHOR"
echo "$INPUT_PUBLIC_NAME"
echo "$GITHUB_REPOSITORY"

CLONE_DIR=$(mktemp -d)
echo "Cloning public git repository"
git config --global user.email "$INPUT_PUBLIC_AUTHOR"
git config --global user.name "$INPUT_PUBLIC_NAME"
git clone --single-branch --branch main "https://github.com/$GITHUB_REPOSITORY.git" "$CLONE_DIR"

ls -la "$CLONE_DIR"

time=$(date)
if true ; then
  echo "Game over!"
  exit 0
fi
