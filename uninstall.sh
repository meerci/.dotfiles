#!/bin/bash
set -e

repo_path=$(dirname $0)
repo_path=$(
	cd $repo_path
	pwd
)

function manage() {
	local src=$1
	if [ $2 ]; then
		local link=$repo_path/$link
	else
		local link=$repo_path/$(basename $src)
	fi

	echo -n "uninstall $src -> $link: "

	# skip if link not exist
	if ! [ -L $src -a $(readlink $src)=$link ]; then
		echo "not exist"
		return
	fi
	# remove link, and copy config back where it is
	[ -e $src ] && rm -r $src
	[ -e $link ] && cp -r $link $src
	echo "success"

}

source $repo_path/links
