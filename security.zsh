# displays or sets the default file permission mask.
umask
#create files and directories
touch archivo2
mkdir directorio2
# Umask does not seem to be respected-Solution
#If we are on root sudo is not useful
# updates the list of available packages from repositories.
sudo apt-get update
# installs the Access Control Lists (ACL) package.
sudo apt-get install acl
# changes ownership of the current directory recursively to the current user.
sudo chown -R $(whoami) .
# removes all ACL permissions recursively from the current directory.
sudo setfacl -bnR .
#If we create a new file or directory after apllying the solution umask will be applied
#create files and directories now using the umask
touch archivo2
mkdir directorio2
# sets default file permissions to restrict access only to the owner.
umask 077
# creates an empty file named secreto.txt.
touch secreto.txt
# creates a directory named privado.
mkdir privado
# lists files and directories with detailed information.
ls -l
# sets default file permission mask allowing read access for others.
umask 022
# creates a file named mi_archivo and writes "Hola" into it.
echo "Hola" > mi_archivo
# displays detailed information about mi_archivo.
ls -l mi_archivo
# creates a new user named luna with home directory and zsh shell.
useradd -m -s /usr/bin/zsh luna
# changes the owner of mi_archivo to user luna.
chown luna mi_archivo
# displays the groups of the current user.
groups
# creates a new group named grupo_test.
groupadd grupo_test
# shows that the new group may not immediately appear in the current session.
groups
# displays all system groups from the /etc/group file.
cat /etc/group
# creates an empty file named comun.
touch comun
# displays detailed information about the file comun.
ls -l comun
# adds user luna to the group grupo_test without removing other group memberships.
usermod -a -G grupo_test luna
# changes the group ownership of the file comun to grupo_test.
chgrp grupo_test comun
# displays detailed information about comun including updated group ownership.
ls -l comun
# changes the owner of mi_archivo to user luna and the group to grupo_test.
sudo chown luna:grupo_test mi_archivo
# displays detailed information about mi_archivo including updated owner and group.
ls -l mi_archivo
# creates a directory named proyecto and a subdirectory named sub.
mkdir -p proyecto/sub
# creates two empty files: readme in proyecto and datos in proyecto/sub.
touch proyecto/readme proyecto/sub/datos
# changes owner and group recursively for all files and directories inside proyecto.
sudo chown -R luna:grupo_test proyecto
# displays detailed information of all files and directories inside proyecto recursively.
ls -lR proyecto