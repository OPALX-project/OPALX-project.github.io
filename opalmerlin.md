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
Go to the directory where you want to clone the source code and build the executable:

0. mkdir -p $HOME/git/opal && cd $HOME/git/opal
1. git clone git@gitlab.psi.ch:OPAL/src.git
2. load the correct modules (put them into the .bashrc or equivalent login-cfg file) :

module purge

module use unstable

module load gcc/4.8.5

module load openmpi/1.10.2

module load hdf5/1.8.17

module load H5hut/2.0.0rc2

module load root/5.34.36

module load gsl/1.15

module load trilinos/11.14.3

module load boost/1.61.0

module load cmake/3.4.1

export OPAL_DIR=$HOME/git/opal

export OPAL_EXE_PATH=$OPAL_DIR/build/src/

3. mkdir $OPAL_EXE_PATH=$OPAL_DIR/build && cd OPAL_EXE_PATH=$OPAL_DIR/build
4. cmake ../src/
5. make

Now you should have OPAL in $OPAL_EXE_PATH and are ready to go