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
gpg --verify msj_my_friend.txt.gpg #verify that the binary signature is correct
gpg --detach-sign msj_my_friend.txt #create a separate signature without modifying the original file
gpg --verify msj_my_friend.txt.sig msj_my_friend.txt #verify that the separate signature is correct
gpg --edit-key jonathanmullo100@gmail.com → trust → 4 #assign a level of trust to someone else's public key
gpg --sign-key jonathanmullo100@gmail.com #sign our friend's public key
gpg --verify msj_my_friend.txt.asc #verify that the file has not been modified
gpg --verify msj_my_friend.txt.sig msj_my_friend.txt #verify that the file has a separate signature
gpg --output doc_final.gpg --encrypt --sign --recipient jonathanmullo100@gmail.com msj_my_friend.txt 
    #Create and encrypt the file with the signature and message only for the recipient.
gpg --decrypt jony_doc_final.gpg #decrypt our friend's file
gpg --output mensaje_descifrado.txt --decrypt jony_doc_final.gpg 
#decrypt and verify your friend's file and save the message in a new file to be able to use cat
cat mensaje_descifrado.txt 
#it displays the decrypted message in the new file, because if the file is .gpg"cat" will display the encrypted message