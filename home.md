[![](https://amas.web.psi.ch/images/logo.png)](/OPAL/wiki/TracIni#header_logo-section)

OPAL Introduction
================
OPAL (Object Oriented Particle Accelerator Library) is an open source C++ framework for general particle accelerator simulations including 3D space charge, short range wake fields and particle matter interaction. OPAL is based on IPPL (Independent Parallel Particle Layer) which adds parallel capabilities. Main functions inherited from IPPL are: structured rectangular grids, fields, parallel FFT and particles with the respective interpolation operators. Other features are, expression templates and massive parallelism (up to 65000 processors) which makes is possible to tackle the largest problems in the field. A new Trilinos based iterative solver - currently in the comissioning phase - handles arbitrary complex boundary conditions and benefiting from the new geometry class. 

OPAL Documentation & Help
========================

* [OPAL Presentations]( OPALPresentations) and papers (ideal for an overview)

* For the  download of OPAL binaries [visit] (https://amas.psi.ch/OPAL/wiki/Downloads)

* OPAL [Manual](http://amas.web.psi.ch/docs/opal/opal_user_guide.pdf#page=[10])

* Please use the OPAL mailing list opal@ … (opal AT lists.psi.ch) to discuss problems and issues. Add yourself to the [mailing list](https://psilists.ethz.ch/sympa/subscribe/opal)

OPAL Start with Examples
=====================
1.  [Cyclotron](Cyclotron)
2. [FFAG](#FFAG)
3. [RF Photo Injector](RFPhotoInjector)
4. [Post Processing](PostProcessing)
5. Old (maybe outdated) [stuff](https://amas.psi.ch/OPAL/wiki/OPAL)

# OPAL Regression Test results for:

1. the [master branch](http://amas.web.psi.ch/opal/regressionTests/master/)
2. branch [OPAL-1.4.x](http://amas.web.psi.ch/opal/regressionTests/1.4/)

OPAL for Developers: Coding Style and Conventions 
===========================================
1.  [Coding Style and Conventions](for-developers)
2. Download sources [here](https://gitlab.psi.ch/OPAL/src) use `ssh` when having git access or `htm`l for anonymous clone.


