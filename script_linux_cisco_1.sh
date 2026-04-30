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