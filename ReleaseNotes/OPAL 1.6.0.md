# Release Notes for OPAL 1.6.0rc1

>
**Note:** This are the release note for the first release candidate of OPAL 1.6.0!
>
**Note:** OPAL 1.6 will be the last minor release of OPAL 1.  New features will be *not* implemented in this major version. Bugs will still be fixed. We are working on OPAL 2 with many new features.

## Solved issues concerned by users 1.6.0rc1

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
* [Regression tests](http://amas.web.psi.ch/opal/regressionTests/1.6/) are all fixed (issue #35 et al.)
* The old behaviour to replace unknown elements with *markers* is now turned into an error.
* Auto phasing reported by John Power.

A full list of (solved) issues can be found in the [issue tracker](https://gitlab.psi.ch/OPAL/src/issues).

## Input file related changes in OPAL-1.6.0

* Input files must have a version tag, for example 
    ```
    OPTION, VERSION=10600
    ```
    indicating version 1.6.x
* OPAL is now fully typed. Each variable has to have a type for example
    ```
    REAL Edes=.072;
    REAL gamma=(Edes+PMASS)/PMASS;
    ```
    Only **REAL, STRING, BOOL** and **ARRAY** are supported


## Known Issues


1.  Degrader with DKS enabled: #106

