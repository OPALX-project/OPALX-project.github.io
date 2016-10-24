How to use OPAL on Merlin
======================

Make sure ```source /opt/psi/config/profile.bash ``` is in your ```.bashrc```

Issue the following command to find the available  OPAL versions:

`module search OPAL`

Module               Release    Group        Requires

------------------------------------------------------------

OPAL/1.3.2           stable     MPI          gcc/4.8.3 openmpi/1.8.2

OPAL/1.4.0           unstable   MPI          gcc/4.8.3 openmpi/1.8.2

OPAL/1.4.0rc1        unstable   MPI          gcc/4.8.3 openmpi/1.8.2

OPAL/1.4.0rc2        unstable   MPI          gcc/4.8.3 openmpi/1.8.2

OPAL/1.4.0rc3        unstable   MPI          gcc/4.8.3 openmpi/1.8.2

Use again the `module` command to load the desired OPAL version:

`module load  gcc/4.8.3 openmpi/1.8.2  OPAL/1.4.0rc3 `

A environment variable OPAL_EXE_PATH will point to the directory where the selected version of OPAL will reside. 

# How to compile OPAL on Merlin
Go to the directory where you want to install, for example in '$HOME/git/opal'

1. git clone 
