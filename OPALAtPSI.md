**Build On PSI Linux Boxes** 

Setup your environment, this you should add to your .bashrc

```
source /afs/psi.ch/sys/psi.x86_64_slp6/config/profile.bash

module use unstable
module load psi-python27/1.0.0
module load cmake/3.6.3
module load gcc/5.4.0
module load boost/1.62.0
module load gsl/2.2.1
module load openmpi/1.10.4
module load trilinos/12.10.1
module load hdf5/1.8.18
module load H5hut/2.0.0rc3
module load cmake
module load gnuplot
module list
```

Clone OPAL repository and build OPAL-1.6:
```
mkdir $HOME/opal
cd $HOME/opal
git clone git@gitlab.psi.ch:OPAL/src.git
git checkout OPAL-1.6
mkdir build
cd build
cmake ..
make -j 5
```
