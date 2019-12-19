# OPAL 1.3.2 Release Notes

## News
### Changes from 1.3.1 to 1.3.2

1. bug (introduced in 1.3.1) that prevented most distributions from being mirrored fixed
1. Linux version only: missing libraries for Infiniband support added

### Changes from 1.3.0 to 1.3.1

1. This releases fixes problems with Autophasing and core dependent results, mainly arising in the BerlinPRO simulations.
1. RADDEG is now fixed 
1. p!=0 message is now translated to a meaningful message
1. Lot of internal restructuring and cleanup
1. The Manual describes Autophasing, Envelope Tracker and the FFT field solver in some detail. 

----

## Installation

1. The package can be installed wherever you want. Let's name this directory `$PREFIX`.
1. change your working directory to `$PREFIX`
1. Un-tar the package
    ```
    tar xf OPAL-1.3.2-1-XXX.tar.bz2
    ```
1. Source the OPAL shell profile. For the time being only sh-like shells are supported.
    ```
    source $PREFIX/etc/profile.d/opal.sh
    ```
1. Now you are ready to run opal, opal converter tools and the visualization tool [H5root](https://gitlab.psi.ch/OPAL/src/wikis/h5root).

>
MPI is included in the OPAL package. If you want to run OPAL with MPI, be sure to use the MPI utilities shipped with OPAL!

----

## Requirements

### Linux

The OPAL package for Linux has been compiled on ScientificLinux 6. It should run on almost all current Linux distribution and has been successfully tested on:
* Redhat Enterprise Linux 6, ScientificLinux 6, CentOS 6
* Redhat Enterprise Linux 7, ScientificLinux 7, CentOS 7
* Ubuntu 12
* Ubuntu 14
* OpenSUSE 12
* OpenSUSE 13

The following libraries (which are usually installed by default, even on very lean systems) are required:
* `glibc 2.12` or newer
* `libncurses 5.7` or newer
* `libz 1.2.3` or newer


### Mac OS X

The OPAL package for Mac OS X has been compiled and tested on Mac OS X 10.9. There are no additional requirements like the accelerator framework. The package has been tested on 
* Mac OS X 10.9
* Mac OS X 10.10
