#!/bin/bash
# see 'man rsync' or https://linux.die.net/man/1/rsync

DEST_USER=dornerworks
DEST_IP=172.27.5.218
DEST_USR_DIR=/opt/mcp/
HOST_USR_DIR=./
SEND_OPTIONS=rtvuz
RECV_OPTIONS=rtvuz
EXCLUDE_FILE='.gitignore'
# options:
#   C: auto ignore files in CVS manner
#   a: archive (-rlptgoD) -- this breaks Windows permissions! At least on the filesystem on the remote machine
#   r: recursive
#   t: preserve times
#   v: verbose
#   u: update (skip newer files on receiver)
#   z: compress

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
	pull)
	    # pull in remote changes -- but keep newer files here
	    rsync -$RECV_OPTIONS --exclude-from=$EXCLUDE_FILE \
		$DEST_USER@$DEST_IP:$DEST_USR_DIR \
		$HOST_USR_DIR
	    echo "pull"
	    shift
	    shift
	    ;;
	push)
	    # push out local changes -- but keep newer files there
	    rsync -$SEND_OPTIONS --exclude-from=$EXCLUDE_FILE \
		$HOST_USR_DIR \
		$DEST_USER@$DEST_IP:$DEST_USR_DIR
	    echo "push"
	    shift
	    shift
	    ;;
	*)
	    echo "Use push or pull."
	    shift
	    shift
	    ;;
    esac
done


