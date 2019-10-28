# Release Notes for OPAL 2.x

## [Bugfixes in OPAL 2.x](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Bug&label_name[]=OPAL%202.1)

* Fixes for flattop distribution (#371 #372)
* Fixes for output (#355)
* Issue #308 Time structure and time shift after particle-matter interaction
* #257 RF Cavity applied twice
* Fixes for cyclotron plugin elements (#206 #243 #246 #247 #253 #293 #313 #375)
* Fixes for optimiser (#230 #233 #235 #257)

## [New features in OPAL 2.x](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Feature%20request&label_name[]=OPAL%202.1)

* Track back in time (#353)
* _OPAL-map_
* BeamStripping physics
* Objectives for `SAMPLER` command (#249)
* Pixmap image as `COLLIMATOR` input (#237)
* `CROSSOVER`, `MUTATION`, `STARTPOPULATION` and `BIRTH_CONTROL` attributes for optimiser (#257)
* Optimiser restarting (#228, #251, #278)
* `PHIMIN`, `PHIMAX`, `COEFNUMPHI`, `COEFDENOMPHI` attributes for `TRIMCOIL` element (#276)
* Match distribution (#241)
* Many more features, for details see the [Wiki Manual](https://gitlab.psi.ch/OPAL/Manual-2.1/wikis/home)

## Input file related changes

* _OPAL-Cycl_: `LOCAL_CARTESIAN_OFFSET` and `LOCAL_CYLINDRICAL_OFFSET` now uses metres and radians as input instead of mm and degrees.
* The attributes `WIDTH` and `HEIGHT` of the element `VARIABLE_RF_CAVITY` have units [m] instead of [mm].

## Output file related changes

* _OPAL-Cycl_: Halo parameter added to STAT file (#268)

## Installation of the binary package
