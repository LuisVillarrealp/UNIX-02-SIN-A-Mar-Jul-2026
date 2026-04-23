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
# attempts to write "hola" to a protected file (fails because redirection is not run with sudo)
sudo echo "hola" > /etc/archivo_protegido
# writes "hola" to a protected file using sudo correctly (tee runs with root privileges)
echo "hola" | sudo tee /etc/archivo_protegido > /dev/null
# lists files in the /etc directory
ls /etc
# displays the content of the file /etc/archivo_protegido
cat /etc/archivo_protegido
#writes input to a file and also shows it on the screen.
tee
# Sends "hola" through a pipe to tee, which writes it to a protected file with sudo
echo "hola" | sudo tee /etc/archivo_protegido
#writes "chao" in a protected file usign superuser privileges
sudo sh -c 'echo "chao" >> /etc/archivo_protegido'
#shows the content of the protected file
cat /etc/archivo_protegido
#opens a root shell with superuser privileges
sudo -i
#exits the root shell and returns to the previous user session
exit
#switches to the root user shell using sudo
sudo su
#switches to the root user shell with a login environment
sudo su -
#prints the value of the HOME environment variable (user's home directory)
echo "$HOME"
#prints the literal string $HOME without expanding the variable
echo '$HOME'