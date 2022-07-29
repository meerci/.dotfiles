#!/usr/bin/bash
set -e
repo_path=`dirname $0`
repo_path=`cd $repo_path; pwd`

function manage() {
  src=$1; link=$2
  [ $src ] || return
  [ $link ] || link=`basename $src`
  link=$repo_path/$link

  echo -n "uninstall $src -> $link: "

  # skip if link not exist
  if ! [ -L $src -a `readlink $src`=$link ]
    then
      echo "not exist"
      return 0
  fi
  # remove link, and copy config back where it is
  [ -e $src ] && rm -r $src
  [ -e $link ] && cp -r $link $src
  echo "success"

}

source $repo_path/links 

