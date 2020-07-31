# Release Notes for [OPAL 2.4.0](https://gitlab.psi.ch/OPAL/src/milestones/27)

## [Bugfixes in OPAL 2.4.0](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Bug&milestone_title=OPAL%202.4.0)

* Fix infinite loop with `DISTRIBUTION, CUTOFFPZ = 0` (#409)
* Fix for segmentation fault in FromFile due to RASTER=TRUE (#465)
* Fix format of _ElementPositions.sdds files (#468)
* Fix closed orbit finder (part of #285)
* Fix for reading fields in H5Block format (#316, #577)
* Fix ascii2h5block (#469)
* Fix for `VALUE` command (#480)
* Fix crash `BEAM` without particles (#490)
* Fix exception for `TRACKBACK = TRUE` with a traveling wave structure (#494)
* Fix for OrbitThreader (#509, #573)
* Fix for pressure data reading (#513)
* SAAMG fixes (#541, #542, #543)
* Fixes for multicharged particle in Opal-T (#544, #545, #569)
* Fix infinite loop when `DESIGNENERGY` not specified in bends (#546)
* Fix for Autophasing (#568)
* Fix for `MINBINEMITTED `and `MINSTEPFORREBIN `options (#571)
* Fix for `SOURCE` element (#572)
* Clang and MacOS compiler issues (#476, #483, #484, #485, #487, #488, #489, #512, #526, #527, #531)
* [Large code cleanup](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Cleanup&milestone_title=OPAL%202.4.0)

## [New features in OPAL 2.4.0](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Feature%20request&milestone_title=OPAL%202.4.0)

* MultiGauss distribution for microbunched beams (#470)
* AMR (Adaptive Mesh Refinement, #496)
* Data file no longer required for `SAMPLER` and `OPTIMIZER` (#239)
* DKS was removed (#523).
* `SOURCE` element can be made `TRANPARENT` for backtracking particles (#579)

## Input file related changes
* The unit of the attributes `FMLOWE` and `FMHIGHE` in the cyclotron command is changed from MeV to GeV (!364)
* The number of particles has to be equal in `BEAM` and `DISTRIBUTION` commands (#558)
* Fix for `DISTRIBUTION` momentum input (`SIGMAPX`, `SIGMAPY`, `SIGMAPZ`) when `INPUTMOUNITS= EV`. Changed from kinetic energy to momentum (as supposed to) (#475)
* Elements positioned with `X`, `Y`, `Z` are now placed relative to the beamline instead of absolute coordinates (#578)

## Output file related changes
