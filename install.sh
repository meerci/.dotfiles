#!/usr/bin/bash
set -e
repo_path=`dirname $0`
repo_path=`cd $repo_path; pwd`

manage() {
  src=$1; link=$2
  [ $link ] || link=`basename $src`
  link=$repo_path/$link

  echo -n "install $src -> $link: "

  # skip if link exists
  if [ -L $src -a `readlink $src`=$link ]
    then
      echo "exists"
      return 
  fi 

  # backup old config
  if [ -e $src ]
  then
    cp -rfH $src $link
    rm -r $src
  fi

  # create link
  if [ -e $link ]
  then
    ln -s $link $src
    echo "success"
  else
    echo "can\'t find both source and target"
    return
  fi
  
}

source $repo_path/links 

