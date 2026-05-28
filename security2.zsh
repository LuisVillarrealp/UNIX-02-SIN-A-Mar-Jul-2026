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