#!/bin/bash
	printf '\033[8;40;99t' 		#Reseize for specific software.
	start=$SECONDS

	cores=$(nproc)
	#cores=$(( cpu / 2 ))	## for real cores only
	echo
	me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
	echo Running "$me"
	echo
	red=`tput setaf 1`
	green=`tput setaf 2`
	reset=`tput sgr0`

echo ---------------------------------------------------------------
	echo
	echo "VirtualBox VMs config."
	echo
	echo "Operation(s) :"
	echo "sudo /sbin/vboxconfig"
	echo
	sudo /sbin/vboxconfig
	echo

echo ---------------------------------------------------------------
	echo Running "$me"
	echo
	echo Finish... This script take $(( SECONDS - start )) seconds to complete
	date -d@$(( SECONDS - start )) -u +%H:%M:%S
	echo Press ENTER key to exit !
	read name
	exit
