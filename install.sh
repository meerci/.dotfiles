#!/bin/bash
set -e

repo_path=$(dirname $0)
repo_path=$(
  cd $repo_path
  pwd
)

manage() {
  local src=$1
  local link=$2
  if [ $2 ]; then
    local link=$repo_path/$link
  else
    local link=$repo_path/$(basename $src)
  fi

  echo -n "install $src -> $link: "

  # skip if link exists
  if [ -L $src -a $(readlink $src)=$link ]; then
    echo "exists"
    return
  fi

  # backup old config
  if [ -e $src ]; then
    cp -rfH $src $link
    rm -r $src
  fi

  # create link
  if [ -e $link ]; then
    ln -s $link $src
    echo "success"
  else
    echo "can\'t find both source and target"
    return
  fi

}

source $repo_path/links
