# Release Notes for OPAL 2.2.0

## [Bugfixes in OPAL 2.2.0](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Bug&label_name[]=OPAL%202.1)

* Fixes for flattop distribution (#371 #372)
* Fixes for output (#355 #382)
* Issue #308 Time structure and time shift after particle-matter interaction
* Fixes for RFCavity element (#267 #356)
* Fixes for cyclotron plugin elements (#206 #243 #246 #247 #253 #293 #313 #375 #382)
* Fixes for optimiser (#230 #233 #235 #257)
* Issue #401 Closed Orbit Finder should not call exit()
* Issue #329 CollimatorPhysics: Error{0}> reduce: mismatched element count in vector reduction
* Issue #120 Particle Termination
* Issue #342 Wrong turn number at restart (_OPAL-Cycl_)
* Fix writing ASCII output of LossDataSink (!161)

## [New features in OPAL 2.2.0](https://gitlab.psi.ch/OPAL/src/issues?scope=all&utf8=%E2%9C%93&state=closed&label_name[]=Feature%20request&label_name[]=OPAL%202.1)

* Track back in time (#353)
* _OPAL-map_
* BeamStripping physics
* Analytical vertical FFA field map (#318)
* Objectives for `SAMPLER` command (#249)
* Pixmap image as `COLLIMATOR` input (#237)
* `CROSSOVER`, `MUTATION`, `STARTPOPULATION` and `BIRTH_CONTROL` attributes for optimiser (#257)
* Optimiser restarting (#228, #251, #278)
* Optimizer: Generalizing objectives with sddsVariableAt (#402)
* `PHIMIN`, `PHIMAX`, `COEFNUMPHI`, `COEFDENOMPHI` attributes for `TRIMCOIL` element (#276)
* Match distribution (#241)
* _OPAL-t_ : Transverse Distribution from Laser Profile (#275)
* _OPAL-Cycl_: Distinguish bunches in probe (#343)
* Many more features, for details see the [Wiki Manual](https://gitlab.psi.ch/OPAL/Manual-2.1/wikis/home)

## Input file related changes

* _OPAL-Cycl_: `LOCAL_CARTESIAN_OFFSET` and `LOCAL_CYLINDRICAL_OFFSET` now uses metres and radians as input instead of mm and degrees.
* The attributes `WIDTH` and `HEIGHT` of the element `VARIABLE_RF_CAVITY` have units [m] instead of [mm].

## Output file related changes

* _OPAL-Cycl_: Halo parameter added to STAT file (#268)

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
 source "$PREFIX/OPAL-2.2.0/etc/profile.d/opal.sh"
 ```
1. Now you are ready to run opal, opal converter tools and the visualization tool [H5root](http://amas.web.psi.ch/tools/H5root/index.html).

> MPI is included in the OPAL package.  If you want to run OPAL with MPI, be sure to use the MPI utilities shipped with OPAL!