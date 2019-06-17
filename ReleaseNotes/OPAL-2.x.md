# Release Notes for OPAL 2.x

## [Bugfixes in OPAL 2.x](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Bug&label_name[]=OPAL%202.1)

* Issue #308 Time structure and time shift after particle-matter interaction
* #257 RF Cavity applied twice
* Fixes for cyclotron plugin elements (#206 #243 #246 #247 #253 #293 #313)
* Fixes for optimiser (#230 #233 #235 #257) 

## New features in OPAL 2.x

* _OPAL-map_
* Objectives for `SAMPLER` command
* Pixmap image as `COLLIMATOR` input
* `CROSSOVER`, `MUTATION`, `STARTPOPULATION` and `BIRTH_CONTROL` attributes for optimiser
* Many more features, for details see the [Wiki Manual](https://gitlab.psi.ch/OPAL/Manual-2.1/wikis/home)
* Match distribution (#241)

## Input file related changes

* OPAL-Cycl: `LOCAL_CARTESIAN_OFFSET` and `LOCAL_CYLINDRICAL_OFFSET` now uses metres and radians as input instead of mm and degrees.
* The attributes `WIDTH` and `HEIGHT` of the element `VARIABLE_RF_CAVITY` have units [m] instead of [mm].

## Output file related changes

## Installation of the binary package
