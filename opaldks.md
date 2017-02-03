**OPAL with DKS enabled**

OPAL compiled with DKS can be used in systems equiped with Nvidia GPU to offload FTPoissonSolver and CollimatorPhysics calculations from CPU to GPU.

To enable GPU usage in OPAL-DKS use --use-dks command line argument when running OPAL.

DKS can be found [here](https://gitlab.psi.ch/uldis_l/DKS)

To compile DKS cuda-7.5 or higher is required, information on how to obtain cuda can be found [here](https://developer.nvidia.com/cuda-toolkit)

**DKS installation**

clone DKS

`git clone git@gitlab.psi.ch:uldis_l/DKS.git DKS`

switch to the latest release branch

`git checkout dks-1.0.0-branch`

configure installation in build directory 

`CXX=mpicxx CC=mpicc -DCMAKE_INSTALL_PREFIX=<DKS install dir> <path to DKS source>`

install DKS

`make`

`make install`

**Install OPAL with DKS**

Set DKS_PREFIX to DKS installation directory

`export DKS_PREFIX=<DKS install dir>`

Pass -DENABLE_DKS=ON flag to cmake when configuring OPAL installation