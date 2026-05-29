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