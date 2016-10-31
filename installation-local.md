You need OpenAFS [from]( http://www.openafs.org)

Get the modules and binaries:

`sudo rsync --verbose --progress --archive --delete /afs/psi.ch/sys/psi.amd64_darwin_130/ /opt/psi.local/"`

`source /opt/psi/config/profile.bash`

Now all modules should be ready. In the .bashrc (or similar) put

