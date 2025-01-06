#!/bin/bash

	printf '\033[8;40;100t'		# will resize the window.
	start=$SECONDS
	now=$(date +"%Y-%m-%d_%A_%H:%M:%S")
	me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
	echo "Running : $me"

echo -------------------------===== Start of bash ====-------------------------
	
	red=`tput setaf 1`
	green=`tput setaf 2`
	yellow=`tput setaf 11`
	blue=`tput setaf 12`
	orange=`tput setaf sgr9`
	reset=`tput sgr0`

	## General purposes variables. Needed before program to random variables.
	## All variables must be 0
	part=0		## don't change this value. (0)
	debug=0		## test debug. (0 or 1 debug mode)
	error=0		## test error. (0 or 1 make error)
	primeerror=0	## ending error detector
	
	## All variables must be 0 or 1
	automatic=0	## automatic without (at least minimal) dialog box.
	noquit=1	## noquit option. (0 or 1)

	## Auto-generated variables. Do not change
	random=$(shuf -i 100000-999999 -n 1)		## Used for temp folders. A big number hard to guess for security reasons.
	random2=$RANDOM

	echo
	echo "Software lead-in. LostByteSoft ; https://github.com/LostByteSoft"
	echo
	echo "NEVER remove dual ## in front of lines. Theses are code annotations."
	echo "You can test / remove single # for testing purpose."
	echo
	echo "Current time : $now"
	echo
	echo "Common variables, you can changes theses variables as you wish to test."
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 primeerror=$primeerror"
	me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
	echo
	echo "Running job file :"
	echo
	echo $(dirname "$0")/$me
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Software name, what is this, version, informations.
	echo
	echo ALL in one compile and install.
	echo Will do everything and check for errors.
	echo 20 gb of free space is needed.
	echo
	echo Optimised for 6.X versions of kernels.
	echo
	echo "Informations : (EULA at the end of file, open in text.)"
	echo "By LostByteSoft, no copyright or copyleft. https://github.com/LostByteSoft"
	echo
	echo "Don't hack paid software, free software exists and does the job better."
	echo

echo -------------------------========================-------------------------
	echo Version compiled on : Also serves as a version
	echo Monday 2024-12-30-10-10-41
echo -------------------------========================-------------------------
echo "Color codes / Informations."
	echo
	echo  "${green}	████████████████     ALL OK / ACTIVE      ████████████████ ${reset}"
	echo   "${blue}	████████████████      INFORMATION(S)      ████████████████ ${reset}"
	echo "${yellow}	████████████████   ATTENTION / INACTIVE   ████████████████ ${reset}"
	echo    "${red}	████████████████   FATAL ERROR / OFFLINE  ████████████████ ${reset}"
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Functions codes and color"
	echo
	echo 	"Function ${blue}█████${reset} Debug. Activate via source program debug=1."

	debug() {
		echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 automatic=$automatic primeerror=$primeerror"
		echo
		echo "	cd $dir/$var"
		}

	if [ "$debug" -eq "1" ]; then
		echo
		echo "${blue}██████████████████████████████ DEBUG ACTIVATED AT START ███████████████████████████${reset}"
		echo
		fi

	echo 	"Function ${red}█████${reset} Error detector. Errorlevel show error msg."

	error()
	if [ "$?" -ge 1 ]; then
		noquit=1
		primeerror=$((primeerror+1))
		primeerror=1
		echo
		echo "${red}█████████████████████████████████ ERROR $part █████████████████████████████████${reset}"
		echo
		echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 automatic=$automatic primeerror=$primeerror"
		echo
		echo "!!! ERROR was detected !!! Press ANY key to try to CONTINUE !!!"
		echo
		read -n 1 -s -r -p "Press any key to CONTINUE"
		echo
		fi

	if [ "$automatic" -eq "1" ]; then
		echo
		echo "${green}███████████████████████████ AUTOMATIC ACTIVATED ████████████████████████${reset}"
		echo
		fi

## -------------------------========================-------------------------

## Simple function small bar to wait 3 sec.
	## Version 1.03
	## Part of code came from here https://github.com/rabb1t/spinners , Created by Pavel Raykov aka 'rabbit' / 2018-11-08 (c)

	functionsmallbar()
		{
		if [ "$debug" -eq 0 ]; then
			#echo
			width=40
			perc=0
			speed="0.1" # seconds
			inc="$(echo "100/${width}" | bc -ql)"
			#echo -n "	Wake Up.. 0% "
			echo -n "	Wait... "

			while [ $width -ge 0 ]; do
				printf "\e[0;93;103m%s\e[0m %.0f%%" "0" "${perc}"
				sleep $speed
				let width--
				perc="$(echo "${perc}+${inc}" | bc -ql)"
		
				if [ ${perc%%.*} -lt 10 ]; then
					printf "\b\b\b"
				else
					printf "\b\b\b\b"
				fi
			done
			echo
		else
			echo ${blue} ████████████████████ DEBUG skip ALL BARS ████████████████████${reset}
		fi
		}

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "The core/code program. Compile linux kernel."
	echo
	echo "Define general variables: Optimised for 6.X versions of kernels."
	echo

## skip sections
	## 01_install_compilers
	skipinstalcomp=0
	## 03_verifypgp
	skipgpg=0
	## 06_compilekernel
	skipcompilekernel=0
	## 07_signkernelmodules
	skipsignkernelmodules=0
	## 08_makeinstall
	skipmakeinstall=0
	## 09-makeheaders
	skipheaders=0
	
## Define kernel version to compile
	var=linux-6.12.7
	sub=6.12.7
	var2=6
	FILEtarxz="$var".tar.xz
	FILEtarsign="$var".tar.sign
	echo "Version : $var"
	echo "Number : $sub"
	echo "Main Ver : $var2"
	echo
	echo tar.xz FILE = $FILEtarxz
	echo tar.sign FILE = $FILEtarsign
	echo
	
## Define numbers of cpu core to use
	cores=$(nproc)
	#cores=$(( cores / 2 ))		## for real cores only

## Input_Directory_Output
	echo "Input name, directory and output name : (Debug helper)"
	echo

## Set working path.
	BASEDIR=$(dirname "$0")
	dir=$(pwd)

## file or folder selected
	echo "Working dir : "$dir""
	echo "Install path : $dir/$var"
	echo

## For full automatic compile you need to provide sudo password.
	if [ $automatic -eq 1 ] ; then
		debug
		echo
		echo "	Verify if variables are good. For fewer asking questions.."
		echo "	If you don't want this change variable automatic=0 on line 26."
		echo "	Press ENTER key to continue ! (Compile kernel all step.)"
		sudopassword=$(zenity --entry --width 500 --height 100 \
		--title "Make Linux Kernel Automatic"  --text "Enter the SUDO password for full automatic. Enter nothing for normal mode.")
	fi


	if [ -n "$sudopassword" ]; then
		echo "	Not empty full automatic operation."
		sudopasswordvar=1
		#echo $sudopassword
		echo $sudopasswordvar
	else
		echo "	Empty normal mode. Ask for sudo pass."
		sudopasswordvar=0
		#echo $sudopassword
		echo $sudopasswordvar
	fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo  09-makeheaders.sh
	start9=$SECONDS
	echo
	linuxheaders=linux-headers-$sub
	if [ "$skipheaders" -eq 0 ]; then
		if [ "$debug" -eq 1 ]; then
			debug
			echo "	Version : $var"
			echo "	Sub Ver : $sub"
			echo "	tar.xz FILE = $FILEtarxz"
			echo "	tar.sign FILE = $FILEtarsign"
			echo "	Make headers var : $var"
			echo "	Make headers : $linuxheaders"
			echo "	Cores : $cores"
			echo
			fi
	echo "Operation(s) :"
	echo "	sudo make headers_install ARCH=x86_64 INSTALL_HDR_PATH=/usr/src/$linuxheaders"
	## sudo make headers_install ARCH=x86_64 INSTALL_HDR_PATH=/usr/src/linux-headers-6.12.7
	echo
	if [ $automatic -eq 0 ] ; then
		echo Press ENTER key to continue !
		read name
		fi
	if [ "$sudopasswordvar" -eq 0 ]; then
			cd $dir/$var
			sudo make headers_install ARCH=x86_64 INSTALL_HDR_PATH=/usr/src/$linuxheaders
			cd ..
		else
			cd $dir/$var
			echo $sudopassword | sudo -S make headers_install ARCH=x86_64 INSTALL_HDR_PATH=/usr/src/$linuxheaders
			cd ..
		fi
	echo
	FILE3=/usr/src/$linuxheaders
	if test -d $FILE3 ; then
		echo "${green} ████████████████ File $linuxheaders exists. ████████████████ ${reset}"
		copy=1
	else
		echo "${red}████████████████ File $linuxheaders does not exist ERROR ████████████████${reset}"
		primeerror=1
		copy=0
		echo Press ENTER key to continue !
		read name
	fi
	echo
	else
		echo "Make headers compile. Skip."
		echo
	fi
	echo "	Time needed $(( SECONDS - start9 )) seconds to complete operation."
	date9=$(date -d@$(( SECONDS - start9 )) -u +%H:%M:%S)
	echo "	Time needed format H:M:S : $date9"
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Software lead out."
	echo
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 primeerror=$primeerror"
	echo
	echo "Finish... with numbers of actions : $part"
	echo "This script take $(( SECONDS - start )) seconds to complete."
	date=$(date -d@$(( SECONDS - start )) -u +%H:%M:%S)
	echo "Time needed: $date"
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"
	echo
	echo "$now" >>/dev/shm/logs.txt
	echo "	Time needed : $date" >>/dev/shm/logs.txt
	echo "	Debug software : $me" >>/dev/shm/logs.txt
	echo "	Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2 automatic=$automatic primeerror=$primeerror" >>/dev/shm/logs.txt
	echo "	File (If any used) : $file" >>/dev/shm/logs.txt
	echo " " >>/dev/shm/logs.txt

echo -------------------------===== End of Bash ======-------------------------
## Exit, wait or auto-quit.

	if [ "$primeerror" -ge "1" ]; then
		echo
		echo "	${red}████████████████████████████████████████████${reset}"
		echo "	${red}██                                        ██${reset}"
		echo "	${red}██           ERROR ERROR ERROR            ██${reset}"
		echo "	${red}██                                        ██${reset}"
		echo "	${red}████████████████████████████████████████████${reset}"
		echo
		echo "Numbers of error(s) : $primeerror"
		echo
		functionsmallbar
		echo
		read -n 1 -s -r -p "Press ENTER key to Continue !"
		echo
	else
		echo
		echo "	${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo "	${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "	${green}██         NO errors detected.        ██${reset}	${blue}██       Time needed : $date       ██${reset}"
		echo "	${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "	${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo
	fi

	if [ "$noquit" -eq "1" ]; then
		echo
		echo "${blue}	█████████████████ NO exit activated ███████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to exit !"
		echo
		exit
		fi

	if [ "$debug" -eq "1" ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT | Program finish. █████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
		fi

	echo
	echo "${green}	███████████████ Finish, quit in 3 seconds █████████████████${reset}"
	sleep 0.5
	echo
	functionsmallbar
	echo
	sleep 1
	exit

## -----===== Start of eula =====-----

	End-user license agreement (eula)

 	JUST DO WHAT THE F*** YOU WANT WITH THE PUBLIC LICENSE
 	
 	Version 3.1415926532 (January 2022)
 	
 	TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
    	
	Everyone is permitted to copy and distribute verbatim or modified copies of
 	this license document.
 	
 	As is customary and in compliance with current global and interplanetary
 	regulations, the author of these pages disclaims all liability for the
 	consequences of the advice given here, in particular in the event of partial
 	or total destruction of the material, Loss of rights to the manufacturer
 	warranty, electrocution, drowning, divorce, civil war, the effects of radiation
 	due to atomic fission, unexpected tax recalls or encounters with
 	extraterrestrial beings elsewhere.
 	
 	YOU MUST ACCEPT THESES TERMS OR NOTHING WILL HAPPEN.
 	
 	LostByteSoft no copyright or copyleft we are in the center.
 	
 	You can send your request and your Christmas wishes to this address:
 	
 		Père Noël
 		Pôle Nord, Canada
 		H0H 0H0

## -----===== End of file =====-----
