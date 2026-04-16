#lists files in long format (-l), including hidden files (-a), with human-readable sizes (-h)
ls -l -a -h
#list the files the same as ls -l -a -h
ls -lah
#creates a directory literally named "-rf" (the -- prevents it from being treated as an option)
mkdir -- -rf
#removes the directory named "-rf" (again, -- avoids interpreting it as an option)
rmdir -- -rf