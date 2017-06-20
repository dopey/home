#! /bin/bash

set -o xtrace

# --- fzf
brew install fzf

# Install shell extensions
/usr/local/opt/fzf/install
# ---

git submodule init;
git submodule update;

cd .files; ./bootstrap.sh; cd ../;
cd .vim; ./bootstrap.sh; cd ../;
