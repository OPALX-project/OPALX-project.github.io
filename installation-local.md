# Pre-build Binaries and Modules

You need OpenAFS [from]( http://www.openafs.org)

Get the modules and binaries:

For MAC use:

`sudo rsync --verbose --progress --archive --delete /afs/psi.ch/sys/psi.amd64_darwin_130/ /opt/psi.local/"`

For Linux (SL6) use:

`sudo rsync --verbose --progress --archive --delete /afs/psi.ch/sys/psi.x86_64_slp6/ /opt/psi.local/"`

`source /opt/psi/config/profile.bash`

Now all modules should be ready.
