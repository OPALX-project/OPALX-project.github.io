**Build On PSI Linux Boxes** 

Setup your environment, this you should add to your .bashrc

```
source /afs/psi.ch/sys/psi.x86_64_slp6/config/profile.bash

module use unstable
module use /afs/psi.ch/project/amas/modulefiles/
module load opal-toolschain/1.6 
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
```

