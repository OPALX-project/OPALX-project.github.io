# Release Notes for OPAL 2.0

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