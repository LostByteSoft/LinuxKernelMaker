#LinuxKernelMaker
The one step to make compile, install and more.

Linux Kernel Maker
--------------------------------------------------------------------

Download, Compile and Install linux kernel by yourself the easy way.

--------------------------------------------------------------------

Version BETA . THIS IS A WORK IN PROGRESS.
-----------

DOES NOT INSTALL RC VERSIONS.
-----------

!!! MAKE HEADERS DO NOT WORK !!!
-----------

Absolutely NO pre-compiled software or kernel here.

Optimised for 6.X versions of kernels.

Step 1. Get the latest Linux kernel source code
https://www.kernel.org/

Step 2. Struggle a little bit (but it's easier to do)

Be sure files in the same folder.

![Screenshot](tree_1.jpg)


Files and what they do ?
--------------------------------------------------------------------

OPEN EACH FILE BEFORE EXECUTING, SOME VARIABLES NEED TO BE CHANGED.

![Screenshot](var_1.jpg)

-Step BY step compilation and install.

01_install_compilers.sh

	Install tools to make kernel.

02_extract.sh

	Extract archive: tar vxf "$var".tar.xz

03_verifypgp.sh

	Non-mandatory operation.
	verify pgp: xz -cd $var.tar.xz | gpg2 --verify $var.tar.sign -

04_configboot.sh

	Copy your boot options in config: sudo cp -v /boot/config-$(uname -r) "$dir"/"$var"/.config

05_makemenuconfig.sh

	make menuconfig: sudo make menuconfig

06_compilekernel.sh

	Compile linux kernel: sudo make -s -j 8

07_signkernelmodules.sh

	sudo make modules: sudo make modules

08_makeinstall.sh

	Install kernel to system: sudo make install

09-makeheaders.sh

	DOES NOT WORK
	Make headers for your drivers or extra: sudo make headers_install ARCH=x86_64 INSTALL_HDR_PATH=/usr/src/

10_informations.sh

	Check the running kernel: uname -r

11-virtualbox.sh

	Must execute 10-makeheaders.sh before this.
	Execute sudo /sbin/vboxconfig for virtualbox.

-ALL in ONE compilation and install.

100_makingkernelall.sh

	Write kernel version on this file (See picture)
	ALL in one compile and install.
	Will do everything and check for errors.
	automatic=1 is not activated by default.
	Because of it's implication on the host system.
	automatic=0 , change it on line 26 to automatic=1 FOR FULL AUTO.
	FULL Automatic mode (NO input at all)


Create/check entry with grub-customizer and reboot.


Usefull link
-------------------------------------------------------------------

This web site help me alot THANKS !

	https://www.cyberciti.biz/tips/compiling-linux-kernel-26.html
	
Link to The Linux Kernel Archives
	https://kernel.org/

--------------------------------------------------------------------

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                        Version 3.1415926535
                          February 2022

	  As is customary and in compliance with current global and
	interplanetary regulations, the author of these pages disclaims
	all liability for the consequences of the advice given here,
	in particular in the event of partial or total destruction of
	the material, Loss of rights to the manufacturer warranty,
	electrocution, drowning, divorce, civil war, the effects of
	radiation due to atomic fission, unexpected tax recalls or
	    encounters with extraterrestrial beings elsewhere.

      LostByteSoft no copyright or copyleft we are in the center.

# --- End of file ---
