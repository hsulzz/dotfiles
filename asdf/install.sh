#!/bin/sh
#
# asdf
#

# check asdf
if test ! $(which asdf)
then
  echo "  Installing asdf..."
  if test "$(uname)" = "Darwin"
  then
    brew install asdf
  fi
fi

script_dir=$(dirname "$0")
cd "$script_dir"

# install plugin and tools
if [[ -f "tool-versions.symlink" ]]; then
    tools=($(awk '{print $1}' tool-versions.symlink))

    for tool in "${tools[@]}"; do
        if asdf plugin list | grep -q "^${tool}$"; then
            echo "Plugin $tool is already added."
        else
            echo "Adding $tool plugin..."
            asdf plugin add ${tool}
        fi
    done

    asdf install

else
    echo "tool-versions.symlink does not exist!"
    exit 1
fi


exit 0
