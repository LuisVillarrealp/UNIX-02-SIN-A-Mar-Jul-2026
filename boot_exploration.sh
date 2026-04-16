#lists files in long format (-l), including hidden files (-a), with human-readable sizes (-h)
ls -l -a -h
#list the files the same as ls -l -a -h
ls -lah
#creates a directory literally named "-rf" (the -- prevents it from being treated as an option)
mkdir -- -rf
#removes the directory named "-rf" (-- avoids interpreting it as an option)
rmdir -- -rf
# Shows a quick help message with options and usage for the ls command
ls --help
# Opens the full manual page for the ls command (detailed documentation)
man ls
# Opens the manual page for git
man git 
# Opens the manual page for git-clone
man git-clone
# In man to search and navigate: use /"word" to search, n for next result, N for previous result
man
--depth
    #Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless
    #--no-single-branch is given to fetch the histories near the tips of all branches. If you want to clone submodules shallowly, also
    #pass --shallow-submodules.
#creates an empty file named script.sh
touch script.sh
#gives execute permission to all users
chmod +x script.sh
#gives execute permission only to the user (owner)
chmod u+x script.sh
#removes read permission from others
chmod o-r secreto.txt 
#gives read and write to user, removes all permissions from group and others
chmod u+rw,go-rwx privado
#lists files in long format we use it to verify the change of permissions
ls -l