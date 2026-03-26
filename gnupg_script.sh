uname -a #daba informacion del ordenador
which gpg #nos da la ubicacion del binario de gpg
gpg --version #me da la version e informacion adicional 
gpg --full-generate-key #genero la llave publica y privada
gpg --armor --export #exportaba la llave publica a un archivo 
gpg --list-secret-keys --keyid-format=long #helps to get the private key
gpg --armor --export-secret-keys #Helps to export the private key
gpg --armor --export luisvillarrealp125@gmail.com > mi_llave_publica.asc #export my public key 
gpg --import jony_llave_publica.asc #import the public key of my friend