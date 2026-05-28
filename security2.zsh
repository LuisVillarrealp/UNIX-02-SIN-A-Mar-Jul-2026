# displays user and group information including the primary group.
id
# displays only the name of the primary group of the current user.
id -gn
# creates a file and checks inherited group ownership.
touch ~/test_grupo_heredado.txt
ls -la ~/test_grupo_heredado.txt
#the primary group is the default group assigned to files created by the user.
#See the current group
id -gn 
echo "Grupo actual:$(id -gn)"
#Create a file before the newgrp
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt
#Download newgrp
sudo apt install uidmap util-linux-extra
#Create the group 'desarrolladores'
groupadd desarrolladores
#Change the group 'desarrolladores'
newgrp desarrolladores
#Verify that the active group has changed
id -gn
echo "Nuevo grupo acitvo:$(id -gn)"
# Create a file inside the subshell
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
# The group is now 'desarrolladores'
# Create a directory
mkdir -p ~/proyecto_dev/src
ls -la ~/
# proyecto_dev/ has the 'desarrolladores' group
# Exit the newgrp subshell
exit
# Verify that we returned to the original group
id -gn
echo "Grupo Restaurado:$(id -gn)"
# Compare the two files
ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt
# Create a group with a password
sudo groupadd grupo_restringido
sudo gpasswd grupo_restringido
# The system will prompt for a group password
#An user who does not belong to the group, can join temporarly if they know the password
newgrp grupo_restringido
#The system will ask the password of the group
#If the password is correct, it joins temporarly
id -gn
exit #Upon leaving, lossing the temporary membership