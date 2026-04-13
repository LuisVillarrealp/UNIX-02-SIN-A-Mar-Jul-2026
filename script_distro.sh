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
sudo su
# Creates a 50MB empty file named "boot"
dd if=/dev/zero of=boot bs=1M count=50
# Formats the file "boot" with FAT filesystem
mkfs -t fat boot
# Installs Syslinux bootloader on the "boot" file
syslinux boot
# Creates a directory named "m"
mkdir m
# Mounts the "boot" file into directory "m"
mount boot m
# Copies kernel (bzImage) and initramfs (init.cpio) into "m"
cp bzImage init.cpio m
# Unmounts the directory "m"
umount m
# Runs a virtual machine using QEMU with no graphical output, sets console to ttyS0, uses bzImage as kernel, init.cpio as initramfs, and boot file as disk image
qemu-system-x86_64 -nographic -append "console=ttyS0" -kernel bzImage -initrd init.cpio -drive file=boot,format=raw

#Kernel Panic Solution
# Changes working directory to /boot-files/initramfs where the initramfs content is located
cd /boot-files/initramfs
# Removes linuxrc file created by BusyBox since we use our own init script (-f avoids errors if it doesn't exist)
rm -f linuxrc
# Grants execution permissions to init, required since it's the first program the kernel runs
chmod +x init
# Packages all initramfs content into a cpio archive in newc format, which is what the kernel expects
find . | cpio -o -H newc > /boot-files/init.cpio
# Lists cpio contents and filters lines containing 'init' to verify it was included correctly
cpio -it < /boot-files/init.cpio | grep init
# Returns to initramfs directory to continue working after verifying cpio content
cd /boot-files/initramfs
# Regenerates the initramfs archive from scratch with the correct BusyBox content
find . | cpio -o -H newc > /boot-files/init.cpio
# Counts how many files the initramfs contains (300+ means BusyBox is correctly included)
cpio -it < /boot-files/init.cpio | wc -l
# Lists initramfs directory to visually confirm bin/, sbin/, usr/ folders exist
ls /boot-files/initramfs/
# Searches for the compiled BusyBox binary in the workspace
ls /workspaces/*/busybox/busybox 2>/dev/null || find /workspaces -name 'busybox' -type f 2>/dev/null
# Navigates to the BusyBox source directory inside the project folder to run make commands
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto/busybox
# Installs BusyBox into the initramfs directory, creating bin/, sbin/, usr/ with all Unix command symlinks
make CONFIG_PREFIX=/boot-files/initramfs install
# Disables CONFIG_TC option which causes compilation errors in recent kernel versions
sed -i 's/CONFIG_TC=y/CONFIG_TC=n/' .config
# Compiles BusyBox using 2 CPU cores in parallel, generating the executable with all Unix utilities
make -j2
# Reinstalls BusyBox correctly into the initramfs after fixing the CONFIG_TC compilation error
make CONFIG_PREFIX=/boot-files/initramfs install
# Verifies BusyBox installation was successful by checking bin/, sbin/, usr/ and init exist
ls /boot-files/initramfs/
# Changes to initramfs directory to prepare the final initramfs packaging
cd /boot-files/initramfs
# Removes linuxrc again after BusyBox install so the kernel uses our custom init script instead
rm -f linuxrc
# Generates the final initramfs with all correct content: init script and all BusyBox binaries
find . | cpio -o -H newc > /boot-files/init.cpio
# Returns to the main working directory where bzImage, init.cpio and boot are located
cd /boot-files
# Boots the virtual machine with no graphical output, passes kernel and initramfs directly, mounts boot disk image
qemu-system-x86_64 -nographic -append "console=ttyS0" -kernel bzImage -initrd init.cpio -drive file=boot,format=raw