**OPAL with DKS enabled**

OPAL compiled with DKS can be used in systems equiped with Nvidia GPU to offload FTPoissonSolver and CollimatorPhysics calculations from CPU to GPU.

To enable GPU usage in OPAL-DKS use --use-dks command line argument when running OPAL.

DKS can be found [here](https://gitlab.psi.ch/uldis_l/DKS)

To compile DKS cuda-7.5 or higher is required, information on how to obtain cuda can be found [here](https://developer.nvidia.com/cuda-toolkit)

**DKS installation**

To install OPAL-1.6 with DKS, version 1.1.X is required. Installation instructions for this version can be found here [DKS 1.1.X](https://gitlab.psi.ch/uldis_l/DKS/wikis/build-dks/dks-1.1.2)

To install OPAL-2.0 with DKS, version 1.1.X is required. Installation instructions for this version can be found here [DKS 1.1.X](https://gitlab.psi.ch/uldis_l/DKS/wikis/build-dks/dks-1.1.2)

**Install OPAL with DKS**

Set DKS_PREFIX to DKS installation directory

`export DKS_PREFIX=<DKS install dir>`

Pass -DENABLE_DKS=ON flag to cmake when configuring OPAL installation