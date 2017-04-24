# Build On PSI Linux Boxes

## 1. Check whether Pmodules are available

To check whether Pmodules are available on your system, run `module --version`. The output should look like:

```
$ module --version

Pmodules 0.99.10 using Tcl Environment Modules 3.2.10
Copyright GNU GPL v2

$
```


## 2. If not already done, install Pmodules

If Pmodules are not installed on your system, you (or your system administrator) have to set a symbolic link in the directory `/opt` to the Pmodules installation on AFS:

```
sudo ln -s /afs/psi.ch/sys/psi.x86_64_slp6 /opt/psi
```

Add the following line to your `.bashrc` or `.bash_profile`:
```
source /opt/psi/config/profile.bash
```

**Note**: For the time being Pmodules supports only bash but **not** tcsh.

## 3. Load the OPAL tool-chain

Load the OPAL tool-chain for OPAL 1.{5,6}.x
```
module use /afs/psi.ch/project/amas/modulefiles
module load opal-toolschain/1.6
```

and for OPAL 2.x
```
module use /afs/psi.ch/project/amas/modulefiles
module load opal-toolschain/2.0
```

**Note**: For your convenience you might add the `module use ...` to your `.bashrc` or `.bash_profile`.

## 4. Get a clone of the OPAL repository

Choose a directory where you want to store the OPAL sources. Here we use `$HOME/opal`:

```
mkdir $HOME/opal
cd $HOME/opal
git clone git@gitlab.psi.ch:OPAL/src.git
```

## 5. Select the OPAL branch you want to compile
Example
```
cd $HOME/opal/src
git checkout OPAL-1.6
```
or 
```
cd $HOME/opal/src
git checkout master
```

## 6. Compile OPAL
```
cd $HOME/opal/src
mkdir build
cd build
cmake ..
make -j 5
```
