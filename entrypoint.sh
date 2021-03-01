#!bin/sh -l

set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable

echo "Starts"
PUBLIC_REPO="$1"
PUBLIC_NAME="$2"
PUBLIC_AUTHOR="$3"
PRIVATE_REPO="$4"
PRIVATE_NAME="$5"
PRIVATE_AUTHOR="$6"

PUBLIC_DIR=$(mktemp -d)
echo "Cloning public git repository"
git clone --single-branch --branch main "https://$API_TOKEN_GITHUB@github.com/$PUBLIC_NAME/$PUBLIC_REPO.git" "$PUBLIC_DIR"

PRIVATE_DIR=$(mktemp -d)
echo "Cloning private git repository"
git clone --single-branch --branch main "https://$API_TOKEN_GITHUB@github.com/$PRIVATE_NAME/$PRIVATE_REPO.git" "$PRIVATE_DIR"

cp -r "$PUBLIC_DIR"/submission/* "$PRIVATE_DIR"/submission/
cp "$PUBLIC_DIR"/README.md "$PRIVATE_DIR"/README.md
cd "$PRIVATE_DIR"/
python -m pip install --upgrade pip
pip install -r "$PRIVATE_DIR"/requirements.txt
python ReaderBoard/main.py
cp -r "$PRIVATE_DIR"/submission/* "$PUBLIC_DIR"/submission/
cp -r "$PRIVATE_DIR"/Log/* "$PUBLIC_DIR"/Log/
cp "$PRIVATE_DIR"/README.md "$PUBLIC_DIR"/README.md

echo "Commit to Private Repo"
git config --global user.email "$PRIVATE_AUTHOR"
git config --global user.name "$PRIVATE_NAME"
git add .
git diff-index --quiet HEAD || git commit --message "This commit from public repository. Private log is updated"
git push origin --set-upstream main
rm -rf "$PRIVATE_DIR"
cd "$PUBLIC_DIR"

echo "Commit to Public Repo"
git config --global user.email "$PUBLIC_AUTHOR"
git config --global user.name "$PUBLIC_NAME"
git add .
git diff-index --quiet HEAD || git commit --message "This commit from private repository. Public ReaderBoard is updated"
git push origin --set-upstream main
rm -rf "$PUBLIC_DIR"


time=$(date)
if true ; then
  echo "Public Score Board is updated at $time"
  exit 0
fi
