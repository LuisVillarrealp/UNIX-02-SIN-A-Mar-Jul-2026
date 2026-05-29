# dd
# syntax reference for dd.
# dd [OPTIONS] OPERAND
# changes to the home directory.
cd ~
# creates a file with zeros using /dev/zero as input.
dd if=/dev/zero of=/tmp/swapex bs=1M count=50
# clones one disk to another (dangerous command).
# dd if=/dev/sda of=/dev/sdb
#mv command
# changes to the Documents directory inside the home folder.
cd ~/Documents
# moves the file people.csv to the Work directory.
mv people.csv Work
# lists the contents of the Work directory.
ls Work
# moves multiple files to the School directory.
mv numbers.txt letters.txt alpha.txt School
# lists the contents of the School directory.
ls School
# lists files in the current directory.
ls
# renames animals.txt to zoo.txt.
mv animals.txt zoo.txt
# lists files in the current directory to confirm the rename.
ls
#rm command
# changes to the Documents directory inside the home folder.
cd ~/Documents
# removes the file linux.txt permanently.
rm linux.txt
# checks if linux.txt still exists.
ls linux.txt
# tries to remove the Work directory without recursive option. (which gives an error)
rm Work
# removes the Work directory and all its contents recursively.
rm -r Work
# checks if the Work directory still exists.
ls Work
#grep command
# changes to the Documents directory inside the home folder.
cd ~/Documents
# copies the /etc/passwd file to the current directory.
cp /etc/passwd .
# searches for lines containing "sysadmin" inside the passwd file.
grep sysadmin passwd
# Section 14.1: Regular Expressions
# Basic Regex characters summary:
# .   : Matches any single character.
# [ ] : Matches any specified character inside the brackets.
# [^] : Matches any character NOT specified inside the brackets.
# *   : Matches zero or more of the previous character.
# ^   : Matches the beginning of the line.
# $   : Matches the end of the line.