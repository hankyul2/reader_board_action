#!bin/sh -l

echo "hello $1"
time=$(date)
if true ; then
  echo "Game over!"
  exit 1
fi
