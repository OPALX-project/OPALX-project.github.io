**OPAL 1.5.2**
This is a special developer release with binaries, because 1.6.0 will the last public release before starting the 2.0.0 with many new features.

Solved issues in 1.5.2 are

* Issue #33
* Issue #35
* Issue #41
* Issue #52 (check for 1.6)
* Issue #55
* Issue #57
* Issue #58
* Issue #64
* Issue #71 
* Regression test are all fixed (various issues)
* Input files must have a version tag, for example 
`OPTION, VERSION=10500`
indicating version 1.5.x
* OPAL is now fully typed. Each variable has to have a type for example

 `REAL Edes=.072; 
REAL gamma=(Edes+PMASS)/PMASS;`
Only **REAL** is supported

* The old behaviour to replace unknown elements with *markers* is now turned in to an error.

* Auto phasing reported by John Power <JP@anl.gov>