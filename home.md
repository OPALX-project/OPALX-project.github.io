[![](https://amas.web.psi.ch/images/logo.png)](/OPAL/wiki/TracIni#header_logo-section)

OPAL Introduction
================
OPAL (Object Oriented Particle Accelerator Library) is an open source C++ framework for general particle accelerator simulations including 3D space charge, short range wake fields and particle matter interaction. OPAL is based on IPPL (Independent Parallel Particle Layer) which adds parallel capabilities. Main functions inherited from IPPL are: structured rectangular grids, fields, parallel FFT and particles with the respective interpolation operators. Other features are, expression templates and massive parallelism (up to 65000 processors) which makes is possible to tackle the largest problems in the field. A new Trilinos based iterative solver - currently in the commissioning phase - handles arbitrary complex boundary conditions and benefiting from the new geometry class. 

OPAL Documentation & Help
========================

* [OPAL at PSI]( OPALAtPSI) How to use and install 

* [OPAL Presentations]( OPALPresentations) and papers (ideal for an overview)

* [OPAL  Release Notes]( OPALReleaseNotes) Latest 1.6.0

* [Download page](downloads) with OPAL binaries.

* OPAL [Manual](http://amas.web.psi.ch/docs/opal/opal_user_guide.pdf)

* [OPAL conversion utilities](OPAL conversion utilities) 

* Please use the OPAL mailing list opal@ … (opal AT lists.psi.ch) to discuss problems and issues. Add yourself to the [mailing list](https://psilists.ethz.ch/sympa/subscribe/opal)

* Report bugs to the [issue tracker](https://gitlab.psi.ch/OPAL/src/issues)

OPAL Start with Examples
=====================
1. [Cyclotron](Cyclotron)
2. [FFAG](#FFAG)
3. [RF Photo Injector](RFPhotoInjector)
4. [Post Processing](PostProcessing)
5. Old (maybe outdated) [stuff](https://amas.psi.ch/OPAL/wiki/OPAL)

The runOPAL.py Script
=====================
The Python scripts allows you to run, automated, several OPAL jobs and obtain the
data in a conceived way. Scans of multiple dimensions are easy possible. The user guide
is found [here](runOPAL)

Regression Tests
===============
1. on the [master branch](http://amas.web.psi.ch/opal/regressionTests/master/)
2. on the branch [OPAL-1.6.x](http://amas.web.psi.ch/opal/regressionTests/1.6/)

OPAL for Developers: Coding Style and Conventions 
===========================================

1. [Coding Style and Conventions](For Developers/Codingstyle)
2. [Make a fork of the upstream repository and develop code](git-usage)
3. Install Modules [local](installation-local) on MAC and Linux
4. [Doxygen 1.5.x](http://amas.web.psi.ch/docs/opal/html/)
4. [Doxygen master](http://amas.web.psi.ch/docs/opal/master-doxygen/)
5. [Building, executing and writing unit tests](unit-tests)
6. [DKS & OPAL](https://gitlab.psi.ch/uldis_l/DKS/wikis/home)


OPAL Physics Resources
======================

1. Trim coil report (PSI Ring):  [PSI Ring](https://gitlab.psi.ch/OPAL/src/uploads/b9b3e4254af29470e2a81bf6e2feb20c/TM-11-13-TrimCoils-Adam_Joho-1974.pdf)

2. Report of Titus-Stefan Dascalu on Multipole, FFAG and Synchrotron tracking. This work was 
supervised by Chris Rogers (RAL) and will be integrated in OPAL 2.0.0. [Multipole](/uploads/0d3fc561b57e8962ed79a57cd6115e37/8FBB32A4-7FA1-4084-A4A7-CDDB1F949CD3_psi.ch.pdf)