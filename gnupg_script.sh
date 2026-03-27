uname -a #daba informacion del ordenador
which gpg #nos da la ubicacion del binario de gpg
gpg --version #me da la version e informacion adicional 
gpg --full-generate-key #genero la llave publica y privada
gpg --armor --export #exportaba la llave publica a un archivo 
gpg --list-secret-keys --keyid-format=long #helps to get the private key
gpg --armor --export-secret-keys #Helps to export the private key
gpg --armor --export luisvillarrealp125@gmail.com > mi_llave_publica.asc #export my public key 
gpg --import jony_llave_publica.asc #import the public key of my friend
echo "Pero si nos pintamos el pelo" > msj_my_friend.txt #create a file to save the message to my friend
gpg --output doc_cifrado.txt --encrypt --recipient jonathanmullo100@gmail.com msj_my_friend.txt #encrypt my friend's message
gpg --decrypt jony_doc_cifrado.txt #decrypt my friend's hidden message
gpg --clearsign msj_my_friend.txt #puts a signature in the message
gpg --verify msj_my_friend.txt.asc #verify that the signature is correct 
gpg --sign msj_my_friend.txt #creates a binary signature