# Updates the package list from repositories
sudo apt update
# Upgrades installed packages to the latest versions
sudo apt upgrade
# Installs required development tools and dependencies
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86
# Clones the Linux kernel repository (shallow clone)
git clone --depth 1 https://github.com/torvalds/linux.git
# Changes to the linux directory
cd linux
# Opens the kernel configuration menu interface
make menuconfig
#Compile the kernel and adjust -j to the number of available cores
make -j 2
# Creates a directory named /boot-files with root privileges
sudo mkdir /boot-files
# Copies the compiled kernel image to /boot-files directory
sudo cp arch/x86/boot/bzImage /boot-files/
# Moves to the parent directory
cd ..
# Clones the BusyBox repository 
git clone --depth 1 https://git.busybox.net/busybox
# Changes to the busybox directory
cd busybox
# Opens the BusyBox configuration menu (allows selecting features and build options before compiling)
make menuconfig
# Compiles the source code using 2 parallel jobs (faster build)
make -j 2
# Creates the initramfs directory inside /boot-files
sudo mkdir /boot-files/initramfs
# Installs BusyBox files into the specified directory
sudo make CONFIG_PREFIX=/boot-files/initramfs install
# Changes to the initramfs directory
cd /boot-files/initramfs
# Opens (or creates) the file "init" using vi editor and we putin there 
# "#!/bin/sh"
# "/bin/sh"
sudo vi init
# Removes the file "linuxrc"
sudo rm linuxrc
# Gives execute permission to the "init" file
sudo chmod +x init
# Switches to root user (superuser)
sudo su
# Creates an initramfs archive (init.cpio) from the current directory
find . | cpio -o -H newc > ../init.cpio
# Moves to the parent directory
cd ..