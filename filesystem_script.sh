# change directory to /dev directory
cd /dev 
#list files and directories on the /dev directory
ls
#show the last execute commands
history
#change directory to /proc directory
cd /proc
#watch the content in the file cpuinfo
cat cpuinfo
#transform a C code file in a executable binary file
gcc saludo.c -o saludobin
#move the file in binary to /bin
sudo mv saludobin /bin/
#change directory to /etc directory
cd /etc
#change directory to gss/ directory
cd gss/
#Print working directory, shows the current directory
pwd
#change directory to root directory
cd /
#adds a symbol to each filename to indicate whether it is a folder, an executable, or a shortcut.
ls -F
