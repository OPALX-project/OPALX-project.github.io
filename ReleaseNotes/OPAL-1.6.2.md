# Release Notes for OPAL 1.6.x

>
**Note:** OPAL 1.6 will be the last minor release of OPAL 1.  New features will be *not* implemented in this major version. Bugs will still be fixed. We are working on OPAL 2 with many new features.

## Installation

1. The package can be installed wherever you want. Let's name this directory `$PREFIX`.
1. change your working directory to `$PREFIX`
1. Un-tar the package
    ```
    tar xf OPAL-1.6.2-1-x86_64-linux.tar.bz2

    ```
1. Source the OPAL shell profile. For the time being only sh-like shells are supported.
 ```
 source $PREFIX/OPAL-1.6.2/etc/profile.d/opal.sh
 ```
1. Now you are ready to run opal, opal converter tools and the visualization tool [H5root](http://amas.web.psi.ch/tools/H5root/index.html).

>
MPI is included in the OPAL package.  If you want to run OPAL with MPI, be sure to use the MPI utilities shipped with OPAL!

## Solved issues concerned by users in 1.6.2

* Issue #213 correct phase output in multiprocessor mode 


## Input file related changes in OPAL-1.6.2

* Input files must have a version tag, for example 
    ```
    OPTION, VERSION=10600;
    ```
    indicating version 1.6.x
* OPAL is now fully typed. Each variable has to have a type for example
    ```
    REAL Edes=.072;
    REAL gamma=(Edes+PMASS)/PMASS;
    ```
    Only **REAL, STRING, BOOL** and **ARRAY** are supported
