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