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
# changes to the Documents directory inside the home folder.
cd ~/Documents
# searches for lines containing "sysadmin" in the passwd file.
grep sysadmin passwd
# searches for lines containing the word "root" in the passwd file.
grep 'root' passwd
# searches for lines starting with "root" in the /etc/passwd file.
grep '^root' /etc/passwd
# displays the content of alpha-first.txt.
cat alpha-first.txt
# searches for lines ending with the letter "r" in alpha-first.txt.
grep 'r$' alpha-first.txt
# displays the content of red.txt.
cat red.txt
# searches for patterns starting with r and ending with f with any two characters in between.
grep 'r..f' red.txt
# searches for patterns starting with r and ending with d with any two characters in between.
grep 'r..d' red.txt
# searches for lines containing any four consecutive characters.
grep '....' red.txt
# searches for patterns starting with r and ending with t with any two characters in between inside /etc/passwd.
grep 'r..t' /etc/passwd
# displays the content of profile.txt.
cat profile.txt
# searches for lines containing numbers from 0 to 9.
grep '[0-9]' profile.txt
# searches for lines containing characters that are not numbers.
grep '[^0-9]' profile.txt
# searches for lines containing a literal dot character.
grep '[.]' profile.txt
# displays the content of red.txt.
cat red.txt
# searches for patterns with r followed by zero or more e characters and ending with d.
grep 're*d' red.txt
# searches for patterns with r followed by zero or more o or e characters and ending with d.
grep 'r[oe]*d' red.txt
# searches for zero or more z characters in red.txt.
grep 'z*' red.txt
# searches for zero or more e characters in red.txt.
grep 'e*' red.txt
# searches for patterns with one e followed by zero or more e characters.
grep 'ee*' red.txt
# searches for the word "red" from standard input.
#grep 'red'
# changes back to the home directory.
cd ~
# switches to the root user with a login shell.
su -
# shuts down the system immediately.
shutdown now
# displays the current system date and time.
date
# schedules a system shutdown at 01:51.
shutdown 01:51
# schedules a system shutdown in 1 minute with a custom message.
shutdown +1 "Goodbye World!"