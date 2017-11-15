How to use OPAL on PSI (and Merlin)
===================================

Make sure ```source /opt/psi/config/profile.bash ``` is in your ```.bashrc```

Issue the following command to find the available OPAL versions:

`module search OPAL`

```
Module               Release    Group        Requires
------------------------------------------------------------
OPAL/1.3.2           stable     MPI          gcc/4.8.3 openmpi/1.8.2
OPAL/1.4.0           unstable   MPI          gcc/4.8.3 openmpi/1.8.2
OPAL/1.4.0rc1        unstable   MPI          gcc/4.8.3 openmpi/1.8.2
OPAL/1.4.0rc2        unstable   MPI          gcc/4.8.3 openmpi/1.8.2
OPAL/1.4.0rc3        unstable   MPI          gcc/4.8.3 openmpi/1.8.2
OPAL/1.5.0-20161209  unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.5.0-20170126  unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.5.1-20170216  unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.5.1-20170217  unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.5.2           unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.6.0           unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.6.0rc1        unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.6.0rc2        unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.6.0rc3        unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.6.0rc4        unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.6.0rc5        unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.6.0rc6        unstable   MPI          gcc/5.4.0 openmpi/1.10.4
OPAL/1.6.1           unstable   MPI          gcc/5.4.0 openmpi/1.10.4
```

Use again the `module` command to load the desired OPAL version:

```
module purge
module use unstable
module load gcc/5.4.0 openmpi/1.10.4 OPAL/1.6.1
```

An environment variable OPAL_EXE_PATH might point to the directory where the selected version of OPAL will reside.

Some info on using [Merlin5](https://intranet.psi.ch/PSI_HPC/Merlin5)
