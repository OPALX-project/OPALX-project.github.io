# Release Notes for [OPAL 2.4.0](https://gitlab.psi.ch/OPAL/src/milestones/27)

## [Bugfixes in OPAL 2.4.0](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Bug&milestone_title=OPAL%202.4.0)

* Fix infinite loop with `DISTRIBUTION, CUTOFFPZ = 0` (#409)
* Fix for segmentation fault in FromFile due to RASTER=TRUE (#465)
* Fix format of _ElementPositions.sdds files (#468)
* Fix closed orbit finder (part of #285)
* Fixes for multicharged particle in Opal-T (#544, #545)
* Fix exception for `TRACKBACK = TRUE` with a traveling wave structure (#494)
* SAAMG fixes (#541, #543)
* Clang and MacOS compiler issues (#476, #483, #484, #485, #487, #488, #489, #512, #526, #531)
* [Large code cleanup](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Cleanup&milestone_title=OPAL%202.4.0)

## [New features in OPAL 2.4.0](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Feature%20request&milestone_title=OPAL%202.4.0)

* MultiGauss distribution for microbunched beams (#470)
* AMR (Adaptive Mesh Refinement, #496)
* Data file no longer required for `SAMPLER` and `OPTIMIZER` (#239)
* DKS was removed.

## Input file related changes
* The unit of the attributes FMLOWE and FMHIGHE in the cyclotron command is changed from MeV to GeV (!364)

## Output file related changes
