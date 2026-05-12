# displays or sets the default file permission mask.
umask
# updates the list of available packages from repositories.
sudo apt-get update
# installs the Access Control Lists (ACL) package.
sudo apt-get install acl
# changes ownership of the current directory recursively to the current user.
sudo chown -R $(whoami) .
# removes all ACL permissions recursively from the current directory.
sudo setfacl -bnR .