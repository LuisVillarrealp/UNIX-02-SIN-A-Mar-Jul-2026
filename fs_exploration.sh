# change current directory to root directory
cd /
# lists files and adds a symbol to show their type.
ls -F
#refreshes the list of available packages
sudo apt update
#installs the latest updates for your system
sudo apt upgrade
#installs the parted tool for managing disks and partitions
sudo apt install parted
#shows detailed disk and partition information, adding separators between each command’s output for clarity.
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e "\n---\n"
#shows all disks and partitions
sudo parted -l
#shows disks with filesystem info
lsblk -f
#runs the next command only if the previous one worked (and gate)
&&
#Prints a separation to make the informartion easy to understand
echo -e "\n---\n"