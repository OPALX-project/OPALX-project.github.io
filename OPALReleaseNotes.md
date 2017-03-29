**OPAL 1.5.2**
This is a special developer release with binaries, because 1.6.0 will the last public release before starting the 2.0.0 with many new features.

Solved issues by 1.5.2

* Issue #33
* Issue #35
* Issue #71
* Input files must have a version tag, for example 
`OPTION, VERSION=10500`
indicating version 1.5.x
* OPAL is now fully typed. Each variable has to have a type for example
 
`REAL Edes=.072;

REAL gamma=(Edes+PMASS)/PMASS;`