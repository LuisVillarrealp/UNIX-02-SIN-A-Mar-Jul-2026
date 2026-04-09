# this command creates a new directory also known as folder.
mkdir
#changes to the directory named "proyecto" using a relative path
cd proyecto/
#changes to the previous (parent) directory 
cd ..
#changes to the directory named "proyecto" using an absolute path
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto
#changes to the home directory
cd
#displays the current working directory (current path)
pwd 
#changes to the home directory using the ~ shortcut
cd ~
#changes to the /home/codespace directory (absolute path)
cd /home/codespace
# shows the value of the HOME environment variable (user's home directory)
echo $HOME
# shows the value of the BASH variable (path to the Bash shell)
echo $BASH
# shows the PATH variable (directories where executables are searched)
echo $PATH
# changes to the home directory using the HOME variable
cd $HOME
#lists files with detailed info (-l), including hidden files (-a), and shows inode numbers (-i)
ls -lai
# the same as -lai, but with options written separately
ls -l -a -i
#opens the manual page for the ls command
man ls
#lists all files in long format, including hidden files
ls --all
#refers to the current (actual) directory
.
#refers to the previous (parent) directory
..
#total disk blocks used by the directory
total 8
# 1572967 = inode; d = directory; rwxrwxrwx+ = permissions
#r = read, w = write, x = execute,it divides in : user / group / other,+ aditional permissions
#; 2 = links;codespace codespace = owner & group; 4096 = size; Apr 9 12:19 = last modified; . = current directory
1572967 drwxrwxrwx+ 2 codespace codespace 4096 Apr  9 12:19 .
# 1572874 = inode; d = directory; rwxrwxrwx+ = permissions; 5 = links; 
#codespace root = owner & group; 4096 = size; Apr 9 12:19 = last modified; .. = parent directory
1572874 drwxrwxrwx+ 5 codespace root      4096 Apr  9 12:19 ..
#shows detailed information about the current directory
stat .
# Device: 7,4 = identifies the physical or virtual device where the file is stored
# 7 = major number → indicates the type of device/driver (e.g., disk type)
# 4 = minor number → identifies the specific device or partition within that type
Device: 7,4
#unique identifier of the file/directory
Inode: 1572967 
#number of hard links (references to this directory)
Links: 2
#shows the current user
whoami
#lists files in long format sorted by modification time (newest first)
ls -lt
#lists files in /etc directory and shows the first 20 results
ls /etc | head -20
## ists files in /dev directory and shows the last 20 results
ls /dev | tail -20