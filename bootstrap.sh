#! /bin/bash

set -o xtrace

git submodule init;
git submodule update;

cd .files; ./bootstrap.sh; cd ../;
cd .vim; ./bootstrap.sh; cd ../;
