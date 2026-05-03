# the ls command lists the files and directories in the current directory.
ls
# lists the contents of the "Documents" directory.
ls Documents
# fun command from aptitude that displays an ASCII cow (Easter egg).
aptitude moo
# lists files and directories with detailed information (long format).
ls -l
# lists files in reverse order.
ls -r
# lists files with details in reverse order.
ls -l -r
ls -rl
ls -lr
# displays the aptitude cow with basic verbosity.
aptitude -v moo # more info 
# increases verbosity level, changing the cow output.
aptitude -vv moo # more verbosity
aptitude -vvv moo # even more verbosity
# enables verbose mode, showing more detailed output.
-v verbosity
# prints the current working directory.
pwd
# changes to the home directory (default behavior when no argument is given).
cd
# changes to the "Documents" directory using a relative path.
cd Documents
# changes to the root directory using an absolute path.
cd /
# changes to the home directory using an absolute path.
cd /home/sysadmin
# prints the current working directory (absolute path).
pwd
# changes to a nested directory using a relative path.
cd School/Art
# moves to the parent directory (one level up).
cd ..
# refers to the current directory (no change in location).
cd .
# returns to the home directory using a shortcut.
cd ~
# lists files in /var/log with detailed information (long format).
ls -l /var/log/
# lists files in /var/log sorted by modification time (most recent first).
ls -lt /var/log
# lists files in /var/log sorted by file size (largest first).
ls -l -S /var/log ls -lS /var/log 
# lists files in /var/log sorted by size in reverse order (smallest first).
ls -lSr /var/log
# lists files in /var/log in reverse alphabetical order.
ls -r /var/log
# switches to the root user without loading the full login environment.
su
# switches to the root user with a login shell.
su -
# switches to the root user using login option (same as su -).
su -l
# switches to the root user using full login option (same as su -).
su --login
# exits the current shell and returns to the previous user.
exit
# runs the sl command (requires administrative privileges).
sl
# allows running commands with administrative (root) privileges.
sudo
# runs the sl command with root privileges using sudo.
sudo sl
# changes to the Documents directory using a relative path with home shortcut.
cd ~/Documents
# lists detailed information of hello.sh including permissions.
ls -l hello.sh
# shows help or requires arguments to change file permissions.
chmod
# syntax reference for symbolic mode.
# chmod [<PERMISSION_SET><ACTION><PERMISSIONS>]... FILE
# changes to the Documents directory using home shortcut.
cd ~/Documents
# lists detailed information of hello.sh including permissions.
ls -l hello.sh
# tries to execute the script from the current directory.
./hello.sh
# adds execute permission to the file for the user (owner).
chmod u+x hello.sh
# lists updated permissions of hello.sh.
ls -l hello.sh
# executes the script successfully after adding permissions.
./hello.sh
# shows help or requires arguments to change file ownership.
chown
# syntax reference for chown.
# chown [OPTIONS] [OWNER] FILE
# changes to the Documents directory.
cd ~/Documents
# lists files with detailed information including owner.
ls -l
# changes the owner of hello.sh to root using administrative privileges.
sudo chown root hello.sh
# lists detailed information of hello.sh to verify new owner.
ls -l hello.sh
# tries to execute the script (will fail due to permissions).
./hello.sh
# executes the script with root privileges.
sudo ./hello.sh
# displays the content of a file.
cat
# syntax reference for cat (not an executable command).
# cat [OPTIONS] [FILE]
# changes to the Documents directory.
cd ~/Documents
# displays the content of animals.txt.
cat animals.txt
# displays file content page by page.
more
# displays file content page by page with more control.
less
# displays the first lines of a file.
head
# syntax reference for head (not an executable command).
# head [OPTIONS] [FILE]
# displays the last lines of a file.
tail
# syntax reference for tail (not an executable command).
# tail [OPTIONS] [FILE]
# displays full content of alpha.txt.
cat alpha.txt
# displays first 10 lines of alpha.txt.
head alpha.txt
# displays last 10 lines of alpha.txt.
tail alpha.txt
# syntax reference for specifying number of lines (not executable).
# head -n number_of_lines file
# displays first 5 lines of alpha.txt.
head -n 5 alpha.txt
# displays last 5 lines of alpha.txt.
tail -n 5 alpha.txt