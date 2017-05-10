**OPAL 1.6.0**
This is a special developer release with binaries, because 1.6.0 will the last public release before starting the 2.0.0 with many new features.

Solved issues concerned by users 1.6.0 are

* Issue #7 
* Issue #14 
* Issue #12
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
* Regression test are all fixed (issue #35 et al.)

* The old behaviour to replace unknown elements with *markers* is now turned in to an error.

* Auto phasing reported by John Power <JP@anl.gov>

A full list of solved issues can be found in the issue tracker on gitlab.psi.ch.

**Input file related changes in OPAL-1.6.0**

* Input files must have a version tag, for example 
`OPTION, VERSION=10500`
indicating version 1.5.x
* OPAL is now fully typed. Each variable has to have a type for example

 `REAL Edes=.072; 
 REAL gamma=(Edes+PMASS)/PMASS;`
Only **REAL,STRING,BOOL** and **ARRAY** are supported
