**Build On PSI Linux Boxes** 

Setup your environment, this you should add to your .bashrc

`module use unstable

module use /afs/psi.ch/project/amas/modulefiles/

module load opal-toolschain/1.6 

module list`

Clone OPAL repository and build:
```
mkdir $HOME/opal
cd $HOME/opal
git clone git@gitlab.psi.ch:OPAL/src.git
git checkout OPAL-1.6
mkdir build
cd build
```

