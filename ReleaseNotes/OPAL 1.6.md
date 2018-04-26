# Release Notes for OPAL 1.6.x

>
**Note:** OPAL 1.6 will be the last minor release of OPAL 1.  New features will *not* be implemented in this major version. Bugs will still be fixed. We are working on OPAL 2 with many new features.

## Installation of the binary package

>
**Note:** The latest version of the binary package is OPAL 1.6.1-1 including OPAL 1.6.1. A new version with OPAL 1.6.2 will be available soon!

1. The package can be installed wherever you want. Let's name this directory `$PREFIX`.
1. change your working directory to `$PREFIX`
1. Un-tar the package
    ```
    tar xf OPAL-1.6.1-1-x86_64-linux.tar.bz2

    ```
1. Source the OPAL shell profile. For the time being only sh-like shells are supported.
 ```
 source $PREFIX/OPAL-1.6.1/etc/profile.d/opal.sh
 ```
1. Now you are ready to run opal, opal converter tools and the visualization tool [H5root](http://amas.web.psi.ch/tools/H5root/index.html).

>
MPI is included in the OPAL package.  If you want to run OPAL with MPI, be sure to use the MPI utilities shipped with OPAL!

## Solved issues concerned by users in 1.6.2

* Issue #213 correct phase output in multiprocessor mode 
* Issue #217 SAAMG solver fixed
 
## Solved issues concerned by users in 1.6.1

* Issue #169 New Material: BoronCarbide
* Issue #106 Segfault in case of Material at beginning of beam line
* Issue #102 PSDUMPFRAME report is wrong in OPTIOn TELL=TRUE
* Issue #105 RectangularDomain::getBoundaryStencil typo
* Correct manual: no particle matter interaction for OPAL-cyc in 1.6.x

## Solved issues concerned by users in 1.6.0

* Issue #7 
* Issue #12
* Issue #14 
* Issue #15
* Issue #25
* Issue #33
* Issue #35
* Issue #41
* Issue #42
* Issue #52
* Issue #55
* Issue #57
* Issue #58
* Issue #64
* Issue #71 
* Issue #77
* Issue #90
* Issue #94
* Issue #125
* Issue #128
* Issue #129
* Issue #138
* Issue #140
* [Regression tests](http://amas.web.psi.ch/opal/regressionTests/1.6/) are all fixed (issue #35 et al.)
* The old behaviour to replace unknown elements with *markers* is now turned into an error.
* Auto phasing reported by John Power.
* Restart with h5 files from OPAL <= 1.4.0 will give *Error{0}> H5 rc= -2 in ...*. This can be ignored.

A full list of (solved) issues can be found in the [issue tracker](https://gitlab.psi.ch/OPAL/src/issues).

## Known Issues 

To date the following issues are not solved and scheduled for OPAL-1.6.1

* Issue #135 **Restart in OPAL-cycl**
* Issue #149 **Degrader related**
* Issue #162 **RBend related**

## Input file related changes in OPAL-1.6

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
