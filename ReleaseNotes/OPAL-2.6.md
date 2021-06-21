# Release Notes for [OPAL 2.6](https://gitlab.psi.ch/OPAL/src/milestones/30)

## [Bugfixes in OPAL 2.6.0](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Bug&milestone_title=OPAL%202.6)

* Opal-T writing of LossDataSink if executed in parallel (#585)
* Floating point comparisons in BoundaryGeometry (#611)
* Header of loss output file in ASCII format (#620)
* Fix for `FROMFILE` Distribution (#622)
* Loss files overwritten for collimators (#636)
* Fix for Sampler (#644)
* Fix for normal component formula for `MULTIPOLE` element (#653)
* Fix for element output files (#657)

## [New features in OPAL 2.6.0](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Feature%20request&milestone_title=OPAL%202.6)

* New Undulator element with its own FDTD electromagnetic solver, making use of the [(MITHRA)](https://github.com/aryafallahi/mithra) library (#535)
* `LOWENERGYTHR` attribute (in [MeV]) for energy loss calculation by `PARTICLEMATTERINTERACTION` command (#83, #142)
* Energy loss calculation and beam scattering are available for all light ions (#634)
* Stopping power at low energy region (#634)
* `ALPHA` particles are supported in `BEAM` command (#634)
* `ENABLEVTK` option (default true) to control writing of voxel mesh output (#647)
* `OUTFN` attribute has been added to Cyclotron and Source elements (#650)

## Input file related changes

* `RING` field map has been explicitly added as a cyclotron `TYPE` (#626)
* `COLLIMATOR` and `DEGRADER` `TYPE` of `PARTICLEMATTERINTERACTION` has been renamed as `SCATTERING` (#633)
* `BEAMSTRIPPING` element has been renamed as `VACUUM` (#633)
* Particle masses supported in `BEAM` command are defined as standard constants (#646)
* Since [version 2.4](ReleaseNotes/OPAL-2.4) the `DISTRIBUTION` momentum input is changed to momentum (instead of energy). To avoid confusion, this is also made clear in the `DISTRIBUTION` command, `INPUTMOUNITS = EV` is changed to `INPUTMOUNITS = EVOVERC`  (#649)
* The values of `MB_BINNING` and `AMR_MG_NORM` attributes have been changed (#495, OPAL/documentation/manual#58)

## Output file related changes
* More information has been added to the HDF5 file written by monitors (#503)
* The unit of time in loss output file is changed from [ns] to [s] (#640)
* The header of ASCII loss output has been modified (#650, OPAL/pyOPALTools#99)
* `DumpFields` and `DumpEMFields` print attributes info in stdout (#651)