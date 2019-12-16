# Release Notes for OPAL 2.2.0

## Changes in OPAL 2.2.0

* Bugfixes
   * Issue #401 Closed Orbit Finder should not call exit()
   * Issue #329 CollimatorPhysics: Error{0}> reduce: mismatched element count in vector reduction
   * Issue #120 Particle Termination

## New features in OPAL 2.2.0
   * Implement analytical Vertical FFA field map in OPAL (see Issue #402)

## Input file related changes


## Output file related changes


## Input file related changes introduced in [OPAL-2.2.0](OPAL-2.2.0)


## Installation of the binary package

> **Note:** The latest version of the binary package is OPAL 2.2.0.

1. The package can be installed wherever you want. Let's name this directory `$PREFIX`.
1. change your working directory to `$PREFIX`
1. Un-tar the package
    ```
    tar xf OPAL-2.2.0-x86_64-linux.tar.xz

    ```
1. Source the OPAL shell profile. For the time being only sh-like shells are supported.
 ```
 source "$PREFIX/OPAL-2.0.0/etc/profile.d/opal.sh"
 ```
1. Now you are ready to run opal, opal converter tools and the visualization tool [H5root](http://amas.web.psi.ch/tools/H5root/index.html).

> MPI is included in the OPAL package.  If you want to run OPAL with MPI, be sure to use the MPI utilities shipped with OPAL!