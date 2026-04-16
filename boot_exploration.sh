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