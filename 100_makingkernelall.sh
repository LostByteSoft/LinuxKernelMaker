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
	skipinstalcomp=1
	## 03_verifypgp
	skipgpg=1
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
echo 01_install_compilers.sh
	echo
	install=0
	echo "Operation(s) :"
	echo Verify installed requirements.
	echo
	if [ "$skipinstalcomp" -eq 0 ]; then
		if [ $automatic -eq 0 ] ; then
		echo Press ENTER key to continue !
		read name
		fi
	if command -v bison >/dev/null 2>&1
	then
		echo "bison installed continue."
		dpkg -s bison | grep Version
		echo "${green} ████████████████ OK ████████████████ ${reset}"
		echo
	else
		echo "You don't have ' bison ' installed."
		echo
		echo "${red}████████████████ Dependency error ████████████████${reset}"
		install=1
		echo
	fi
	if command -v flex >/dev/null 2>&1
	then
		echo "flex installed continue."
		dpkg -s flex | grep Version
		echo "${green} ████████████████ OK ████████████████ ${reset}"
		echo
	else
		echo "You don't have ' flex ' installed."
		echo
		echo "${red}████████████████ Dependency error ████████████████${reset}"
		install=1
		echo
	fi
	FILE3=/usr/share/doc/libssl-dev
	if test -d $FILE3 ; then
	echo "${green} ████████████ File $FILE3 exists. ████████████ ${reset}"
	else
	echo "${red}████████████ File $FILE3 does not exist ERROR ████████████${reset}"
	install=1
	fi
	echo
	FILE3=/usr/share/doc/build-essential
	if test -d $FILE3 ; then
	echo "${green} ████████████ File $FILE3 exists. ████████████ ${reset}"
	else
	echo "${red}████████████ File $FILE3 does not exist ERROR ████████████${reset}"
	install=1
	fi
	echo
	FILE3=/usr/share/doc/libncurses-dev
	if test -d $FILE3 ; then
	echo "${green} ████████████ File $FILE3 exists. ████████████ ${reset}"
	else
	echo "${red}████████████ File $FILE3 does not exist ERROR ████████████${reset}"
	install=1
	fi
	echo
	FILE3=/usr/share/doc/libelf-dev
	if test -d $FILE3 ; then
	echo "${green} ████████████ File $FILE3 exists. ████████████ ${reset}"
	else
	echo "${red}████████████ File $FILE3 does not exist ERROR ████████████${reset}"
	install=1
	fi
	echo
	if [ "$install" -eq "1" ]; then
		echo "Install the required compilers and other tools"
		echo
		sudo apt-get install bison -y
		sudo apt-get install flex -y
		sudo apt-get install libssl-dev -y
		sudo apt-get install build-essential -y
		sudo apt-get install libncurses-dev -y
		sudo apt-get install libelf-dev -y
		echo
		fi
	else
		echo "Software check/install skip. (All OK or debug mode.)"
	fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo 02_extract.sh
	echo
	echo "https://www.cyberciti.biz/tips/compiling-linux-kernel-26.html"
	echo "Get the latest Linux kernel source code"
	echo "https://www.kernel.org/"
	echo
	echo "File "$var".tar.xz & "$var".tar.sign must be in the"
	echo "same folder of $me"
	echo
	echo "Operation(s) :"
	echo tar vxf "$var".tar.xz
	echo cp "$var".tar.sign TO FOLDER "$var"
	echo
	if [ -f "$FILEtarxz" ]; then
		echo "${green} ████████████████ $FILEtarxz FILE OK ████████████████ ${reset}"
	else
		echo "${red} ████████████████ $FILEtarxz FILE MUST BE IN SAME FOLDER ████████████████ ${reset}"
		echo
		echo "Press ENTER key to continue ! (THIS WILL CAUSE DEBUG MODE)"
		read name
		debug=1
		primeerror=1
	fi
	echo
	if [ -f "$FILEtarsign" ]; then
		echo "${green} ████████████████ $var.tar.sign FILE OK ████████████████ ${reset}"
	else
		echo "${red} ████████████████ $var.tar.sign FILE MUST BE IN SAME FOLDER ████████████████ ${reset}"
		echo
		echo "Press ENTER key to continue ! (THIS WILL CAUSE SKIP CHECK PGP)"
		skipgpg=1
		read name
	fi
	echo
	if [ $automatic -eq 0 ] ; then
		echo "Press ENTER key to continue ! (Silent extract. Approx. 15 sec.)"
		read name
		fi
	if [ "$debug" -eq 0 ]; then
		# tar vxf "$var".tar.xz			## Visual extract
		tar xf "$var".tar.xz			## Silent extract	
	else
		echo DEBUG tar xf "$var".tar.xz		## Silent extract
		echo
	fi
	functiondircheck () {
	if [ -d "$dir"/"$var" ]; then
		echo "${green} ████████████████ $dir"/"$var FOLDER OK ████████████████ ${reset}"
	else
		echo "${red} ████████████████ $dir"/"$var FOLDER ERROR ████████████████ ${reset}"
		echo
		echo "${blue} ██████████████ RENAME correctly $dir"/"$var ██████████████ ${reset}"
		echo
		echo "Press ENTER key to continue ! (No errors if you rename and continue.)"
		read name
		functiondircheck
	fi
	}
	functiondircheck
	echo
	if [ "$debug" -eq 0 ]; then
		cp "$var".tar.sign "$var"
	else
		echo DEBUG cp "$var".tar.sign "$var"
		echo
	fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo 03_verifypgp.sh
	echo
	echo "Verify pgp for signed kernel."
	echo
	echo "Operation(s) :"
	echo "gpg2 --locate-keys torvalds@kernel.org gregkh@kernel.org"
	echo "xz -cd $var.tar.xz | gpg2 --verify $var.tar.sign -"
	echo
	if [ "$skipgpg" -eq 0 ]; then
		if [ $automatic -eq 0 ] ; then
			echo "Press ENTER key to continue !"
			read name
		fi
		if [ -f ""$var.tar.sign"" ]; then
			echo "${green} ████████████████ File "$var".tar.sign exists. Skip download. ████████████████ ${reset}"
		else
			echo "${blue}████████████████ File "$var".tar.sign does not exist DOWNLOAD ████████████████${reset}"
			echo "wget https://cdn.kernel.org/pub/linux/kernel/v$var2.x/"$var".tar.sign"
			wget https://cdn.kernel.org/pub/linux/kernel/v$var2.x/"$var".tar.sign
			## wget https://cdn.kernel.org/pub/linux/kernel/v6.x/"linux-6.12.7.tar.sign
		fi
		echo
		if [ "$debug" -eq 0 ]; then
			gpg2 --locate-keys torvalds@kernel.org gregkh@kernel.org
			echo "xz -cd $var.tar.xz | gpg2 --verify $var.tar.sign -"
			xz -cd $var.tar.xz | gpg2 --verify $var.tar.sign -
			## xz -cd linux-6.12.7.tar.xz | gpg2 --trust-model tofu --verify linux-6.12.7.tar.sign -
		else
			echo "DEBUG gpg2 --locate-keys torvalds@kernel.org gregkh@kernel.org"
			echo 'DEBUG xz -cd $var.tar.xz | gpg2 --verify $var.tar.sign -'
			echo 'DEBUG xz -cd $var.tar.xz | gpg2 --verify $var.tar.sign -'
		fi
	else
		echo "gpg2 verification skip."
	fi
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo 04_configboot.sh
	echo
	echo "Copy the Linux kernel features and modules (From the pre-existing file)"
	echo
	echo "Operation(s) :"
	echo sudo cp -v /boot/config-$(uname -r) "$dir"/"$var"/.config
	echo sudo gedit ""$dir"/"$var"/.config"
	echo
	echo "You need to change this line in the .config file"
	echo "File "$var"/.config will open in sudo"
	echo
	if command -v xsel >/dev/null 2>&1
		then
			echo CONFIG_DEBUG_INFO_BTF=n
			echo
			echo This data is in clipboard.
			printf "CONFIG_DEBUG_INFO_BTF=" | xclip -sel clip
		else
			echo CONFIG_DEBUG_INFO_BTF=n
			echo
		fi
	if [ $automatic -eq 0 ] ; then
		echo "Press ENTER key to continue ! "
		read name
		fi
	if [ "$debug" -eq 0 ]; then
		if [ $sudopasswordvar -eq 0 ] ; then
			sudo cp -v /boot/config-$(uname -r) $dir/$var/.config
			sudo gedit $dir/$var/.config
		else
			cat /home/master/Desktop/kernel-v3/linux-6.12.7/.config | sed -e "s/CONFIG_DEBUG_INFO_BTF=y/CONFIG_DEBUG_INFO_BTF=n/" > /dev/shm/configMOD
			cp -f /dev/shm/configMOD /home/master/Desktop/kernel-v3/linux-6.12.7/.config
#automatic replace			
#Create temporary file with new line in place
#cat /home/master/Desktop/kernel-v3/linux-6.12.7/.config | sed -e "s/CONFIG_DEBUG_INFO_BTF=y/CONFIG_DEBUG_INFO_BTF=n/" > /dev/shm/configMOD
#Copy the new file over the original file
#cp -f /dev/shm/configMOD /home/master/Desktop/kernel-v3/linux-6.12.7/.config
			fi
		else
			echo DEBUG cp -v /boot/config-$(uname -r) "$dir/$var"/.config
			echo DEBUG gedit $dir/$var/.config
		fi
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo 05_makemenuconfig.sh
	echo
	echo "Configuring the new "$var" kernel. (Approx. 10 sec.)"
	echo
	echo "Operation(s) :"
	echo sudo make menuconfig
	echo
	if [ $automatic -eq 0 ] ; then
		echo "Press ENTER key to continue !"
		read name
		fi
	if [ "$debug" -eq 0 ]; then
			if [ $sudopasswordvar -eq 0 ] ; then
					cd $dir/$var
					sudo make menuconfig
					cd ..
				else
					echo "Bypass automatic."
				fi
		else
			echo DEBUG sudo make menuconfig
			echo
		fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo 06_compilekernel.sh
	skipcompilekernel=0
	if [ "$skipcompilekernel" -eq 0 ]; then
	if [ "$debug" -eq 1 ]; then
		debug
		echo "	Cores : $cores"
		echo "	skipcompilekernel=$skipcompilekernel"
		fi
	FILE=$dir/$var/vmlinux
		if [ -f $FILE ]; then
		skipcompilekernel=1
		fi
		echo
	FILE=$dir/$var/vmlinux.a
		if [ -f $FILE ]; then
		skipcompilekernel=1
		fi
		echo
	FILE=$dir/$var/vmlinux.o
		if [ -f $FILE ]; then
		skipcompilekernel=1
		fi
	echo "Compile a Linux Kernel with $cores core. (Approx 60 min.)"
	echo
	echo "Operation(s) :"
	echo sudo make -s -j $cores
	echo
	if [ $automatic -eq 0 ] ; then
		echo "Press ENTER key to continue ! SILENT MODE"
		read name
		fi
	if [ "$debug" -eq 0 ]; then
			if [ $sudopasswordvar -eq 0 ] ; then
				cd $dir/$var
				sudo make -s -j $cores	## Allow N jobs at once, faster than sudo make -s
				#sudo make -s		## infinite jobs with no arg, -s silent
				cd ..
			else
				cd $dir/$var
				#echo $sudopassword | sudo -S make -s -j $cores	## Allow N jobs at once, -s silent
				echo $sudopassword | sudo -S make -s -j $cores	## Allow N jobs at once, faster with -j $cores
				#sudo make -s		## infinite jobs with no arg, -s silent
				cd ..
			fi
		else
			echo DEBUG sudo make -s -j $cores
		fi
	echo
	FILE=$dir/$var/vmlinux
	if [ -f $FILE ]; then
		echo "${green}██ File $FILE exists. OK ██ ${reset}"
	else
		echo "${red}██ File $FILE does not exist ERROR ██${reset}"
		primeerror=1
	fi
	echo
	FILE=$dir/$var/vmlinux.a
	if [ -f $FILE ]; then
		echo "${green}██ File $FILE exists. OK ██ ${reset}"
	else
		echo "${red}██ File $FILE does not exist ERROR ██${reset}"
		primeerror=1
	fi
	echo
	FILE=$dir/$var/vmlinux.o
	if [ -f $FILE ]; then
		echo "${green}██ File $FILE exists. OK ██ ${reset}"
	else
		echo "${red}██ File $FILE does not exist ERROR ██${reset}"
		primeerror=1
	fi
	if [ "$primeerror" -eq 1 ]; then
			echo
			echo "	${red}████████████████████████████████████████████${reset}"
			echo "	${red}██                                        ██${reset}"
			echo "	${red}██       ERROR MODULES NOT COMPILED       ██${reset}"
			echo "	${red}██                                        ██${reset}"
			echo "	${red}████████████████████████████████████████████${reset}"
			echo
			echo "Press ENTER key to continue ! Suggest exit."
			read name
			skipheaders=1
			skipsignkernelmodules=1
			skipmakeinstall=1
			debug=1
		else
			echo
			echo "Everything is green you can continue."
			echo
		fi
	fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo 07_signkernelmodules.sh
	echo
	if [ "$skipsignkernelmodules" -eq 0 ]; then
	echo "Sign the Linux kernel modules. (Approx 3 min.)"
	echo
	echo "Operation(s) :"
	echo sudo make modules_install
	echo
	if [ $automatic -eq 0 ] ; then
		echo "Press ENTER key to continue !"
		read name
		fi
	if [ "$sudopasswordvar" -eq 0 ]; then
			cd $dir/$var
			sudo make modules_install
			cd ..
		else
			cd $dir/$var
			echo $sudopassword | sudo -S make modules_install
			cd ..
		fi
	echo
	fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo 08_makeinstall.sh
	echo
	a=config-$sub
	b=initrd.img-$sub
	c=System.map-$sub
	d=vmlinuz-$sub
	if [ "$debug" -eq 1 ]; then
		debug
		echo "	a = $a"
		echo "	b = $b"
		echo "	c = $c"
		echo "	d = $d"
		echo
		fi
	yes_or_no() {
		while true; do
		echo "Do you want to install kernel in system ?"
		read -p "$* [y/n]: " yn
		case $yn in
		[Yy]*) echo "YES_Install" ; return 0  ;;  
		[Nn]*) echo "NO_Install" ; return  1 ;;
		esac
		done
		}
	if [ "$skipmakeinstall" -eq 0 ]; then
	echo "Make install new kernel. If green you need to reboot. (Approx. 2 min.)"
	echo
	echo "Operation(s) :"
	echo sudo make install
	echo "Kernel to install in system $var"
	echo
	if [ $automatic -eq 0 ] ; then
		echo "Press ENTER key to continue !"
		read name
		fi
	if [ "$automatic" -eq 0 ]; then
		yes_or_no
			if [ "$?" -eq 0 ]; then
				echo INSTALL IN SYSTEM.
				cd $dir/$var
				sudo make install
				cd ..
			else
				echo NOT INSTALLED.
			fi
	else
			if [ "$sudopasswordvar" -eq 0 ]; then
					echo INSTALL IN SYSTEM.
					cd $dir/$var
					echo $sudopassword | sudo -S make install
					cd ..
				else
					echo INSTALL IN SYSTEM.
					cd $dir/$var
					sudo make install
					cd ..
				fi
	fi
	echo
	FILE1=/boot/$a
	if [ -f $FILE ]; then
	echo "${green} ████████████████ File $a exists. OK ████████████████ ${reset}"
	else
	echo "${red}████████████████ File $a does not exist ERROR ████████████████${reset}"
	primeerror=1
	fi
	echo
	FILE2=/boot/$b
	if [ -f $FILE ]; then
	echo "${green} ████████████████ File $b exists. OK ████████████████ ${reset}"
	else
	echo "${red}████████████████ File $b does not exist ERROR ████████████████${reset}"
	primeerror=1
	fi
	echo
	FILE3=/boot/$c
	if [ -f $FILE ]; then
	echo "${green} ████████████████ File $c exists. OK ████████████████ ${reset}"
	else
	echo "${red}████████████████ File $c does not exist ERROR ████████████████${reset}"
	primeerror=1
	fi
	echo
	FILE4=/boot/$d
	if [ -f $FILE ]; then
	echo "${green} ████████████████ File $d exists. OK ████████████████ ${reset}"
	else
	echo "${red}████████████████ File $d does not exist ERROR ████████████████${reset}"
	primeerror=1
	fi
	if [ "$primeerror" -eq 1 ]; then
			echo
			echo "	${red}████████████████████████████████████████████${reset}"
			echo "	${red}██                                        ██${reset}"
			echo "	${red}██       ERROR KERNEL NOT INSTALLED       ██${reset}"
			echo "	${red}██                                        ██${reset}"
			echo "	${red}████████████████████████████████████████████${reset}"
			echo
			echo Press ENTER key to continue !
			read name
			skipheaders=1
		else
			echo
			echo "Everything is green new kernel is installed."
			echo
		fi
	fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo  09-makeheaders.sh
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
	echo sudo make headers_install ARCH=x86_64 INSTALL_HDR_PATH=/usr/src/$linuxheaders
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
		echo "Headers compile skip."
		echo
	fi

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo 10_informations.sh
	echo
	echo "Operation(s) / Informations :"
	echo
	hostnamectl
	echo
	echo "Running kernel :"
	uname -r
	echo
	if [ "$primeerror" -eq "0" ]; then
		echo "	${blue}████████████████████████████████████████████${reset}"
		echo "	${blue}██                                        ██${reset}"
		echo "	${blue}██              NEED REBOOT               ██${reset}"
		echo "	${blue}██                                        ██${reset}"
		echo "	${blue}████████████████████████████████████████████${reset}"
		echo
	else
		echo "	${red}████████████████████████████████████████████${reset}"
		echo "	${red}██                                        ██${reset}"
		echo "	${red}██            ERRORS WAS MADE             ██${reset}"
		echo "	${red}██                                        ██${reset}"
		echo "	${red}████████████████████████████████████████████${reset}"
		echo
	fi
	echo
	if [ $automatic -eq 0 ] ; then
		read -n 1 -s -r -p "Press ENTER key to Continue !"
		echo
		fi

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
