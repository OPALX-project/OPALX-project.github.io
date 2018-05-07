# Release Notes for OPAL 2.0

## New features in OPAL 2.0.0

* OPAL-T: 3D placement of elements
    * Overlapping fringe fields now supported
* Integration of optimizer
* OPAL-Cycl: general trim coils added
* OPAL-T: A flexible collimator with configurable hole placement (e.g. for multi-slit or pepper-pot) added
* Method for scalable generation of particle distribution now provided
* OPAL-T: Normalization of field maps can be switched off
* Scan option is removed
* OPAL mode for highlighting in emacs added
* Many more features

## Input file related changes (partially introduced in OPAL-1.6)

* Input files must have a version tag, for example 
    ```
    OPTION, VERSION=10900;
    ```
    indicating version 1.9.x and newer
* OPAL is now fully typed. Each variable has to have a type for example
    ```
    REAL Edes=.072;
    REAL gamma=(Edes+PMASS)/PMASS;
    ```
    Only **REAL, REAL CONSTANT, REAL VARIABLE, STRING, STRING CONSTANT, BOOL, BOOL CONSTANT** and **REAL VECTOR** are supported
* OPAL-T: Beamlines containing a cathod have to have a `SOURCE` element to indicate this fact.
* OPAL-T: The design energy of dipoles is now expected in MeV instead of eV
* The meaning of `OFFSETZ` of the command `DISTRIBUTION` has changed. It now indicates a shift of the particle bunch relative to the reference particle. Use the `ZSTART` attribute of the `TRACK` command to start the simulation at a position `z > 0`
* The attribute `DISTRIBUTION` of the command `DISTRIBUTION` has been renamed to `TYPE`
* OPAL-T: The attribute `ROTATION` of `RBEND` and `SBEND` has been replaced by `PSI` which now can be applied to all elements to rotate them about the reference trajectory

## Installation of the binary package

>
**Note:** The latest version of the binary package is OPAL 2.0.0rc2-1 including OPAL 2.0.0rc2.

1. The package can be installed wherever you want. Let's name this directory `$PREFIX`.
1. change your working directory to `$PREFIX`
1. Un-tar the package
    ```
    tar xf OPAL-2.0.0-1-x86_64-linux.tar.xz

    ```
1. Source the OPAL shell profile. For the time being only sh-like shells are supported.
 ```
 source "$PREFIX/OPAL-2.0.0rc2/etc/profile.d/opal.sh"
 ```
1. Now you are ready to run opal, opal converter tools and the visualization tool [H5root](http://amas.web.psi.ch/tools/H5root/index.html).

>
MPI is included in the OPAL package.  If you want to run OPAL with MPI, be sure to use the MPI utilities shipped with OPAL!

