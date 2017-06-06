# OPAL 1.4.0 Release Notes

## News
### Changes from 1.3.2 to 1.4.0
* fixing combination of OFFSET[XYZ] and CZERO,
* output the reference particle trajectory of every dipole,
* adding general multipole field,
* !BoundaryGeometry: Bugfix in computing triangle normals,
* fixing calculation of external fields for output,
* prevent access to memory that isn't allocated,
* properly freeing memory,
* properly initializing member variables,
* fix material definitions,
* change mean excitation energy in collimator material,
* fixing orientation of triangles in boundary geometries,
* fixing insertion of triangle normals into array,
* fixing interpolation of data in CSR wake computation,
* Gaussian distributions:
 * change of shape of cutoff from rectangular to elliptic ,
 * always allow to use SIGMAR and CUTOFFR,
* fixing collection of all sections with surface physics,
* fixing linearization of field map data for type 3DDynamic,
* fixing enlargement of mesh for space charge calculation.
* fixing output of H5Part-file in simulations with follow-up tracks
* fixing number of particles in flat-top part of emitted distributions
* fixing thermal energy for emission model 'None'
* remove delay of emission process (OPAL-T)
* build process adapted to Intel compiler
* allow simulations with multiple !SurfacePhysics processes (OPAL-T)
* kickers implemented in OPAL-T,
* restart from any step and any H5Part file,
* fine-grained control over amount of output in OPAL-T,
* array-type !TrackRun attributes MAXSTEPS, DT and ZSTOP (currently OPAL-T only),
* statistics file now compliant to SDDS format,
* rewrite of autophase algorithm,
* added stand-alone autophase tracker,
* better exception handling,
* follow-up track now working correctly,
* adding !MatchedGauss distribution,
* return type of ElementBase::getType changed to enum which is faster to compare than strings.

----

## Installation

1. The package can be installed wherever you want. Let's name this directory `$PREFIX`.
1. change your working directory to `$PREFIX`
1. Un-tar the package \\
 {{{tar xf OPAL-1.4.0-1-XXX.tar.bz2}}}
1. Source the OPAL shell profile. For the time being only sh-like shells are supported. \\
 {{{source $PREFIX/OPAL-1.4.0-1/etc/profile.d/opal.sh}}}
1. Now you are ready to run opal, opal converter tools and the visualization tool [http://amas.web.psi.ch/tools/H5root/index.html H5root].

>
MPI is included in the OPAL package.  If you want to run OPAL with MPI, be sure to use the MPI utilities shipped with OPAL!

----

## Requirements

### Linux

The OPAL package for Linux has been compiled on !ScientificLinux 6. It should run on almost all current Linux distribution and has been successfully tested on:
* Redhat Enterprise Linux 6, !ScientificLinux 6, CentOS 6
* Redhat Enterprise Linux 7, !ScientificLinux 7, CentOS 7
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

