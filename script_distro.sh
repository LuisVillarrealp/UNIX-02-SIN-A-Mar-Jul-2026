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
#Compile the kernel and adjust -j to the number of available cores):
make -j 2