#!/bin/sh
#
# Homebrew
#


if test ! $(which brew)
then
  echo "  Installing Homebrew..."
  if test "$(uname)" = "Darwin"
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
fi

exit 0
