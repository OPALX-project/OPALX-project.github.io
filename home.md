[![](https://amas.web.psi.ch/images/logo.png)](/OPAL/wiki/TracIni#header_logo-section)

OPAL Introduction
================
OPAL (Object Oriented Particle Accelerator Library) is an open source C++ framework for general particle accelerator simulations including 3D space charge, short range wake fields and particle matter interaction. OPAL is based on IPPL (Independent Parallel Particle Layer) which adds parallel capabilities. Main functions inherited from IPPL are: structured rectangular grids, fields, parallel FFT and particles with the respective interpolation operators. Other features are, expression templates and massive parallelism (up to 65000 processors) which makes is possible to tackle the largest problems in the field. A new Trilinos based iterative solver - currently in the comissioning phase - handles arbitrary complex boundary conditions and benefiting from the new geometry class. 

# OPAL Regression Test results for

1. the master branch  
       * http://amas.web.psi.ch/opal/regressionTests/master/
1.  branch OPAL-1.4.x  
       * http://amas.web.psi.ch/opal/regressionTests/1.4/

OPAL Documentation & Help
========================

* OPAL Manual:  http://amas.web.psi.ch/docs/opal/opal_user_guide.pdf

* Please use the OPAL mailing list opal@ … (opal AT lists.psi.ch) to discuss problems and issues. Add yourself to the mailing list by visiting  https://psilists.ethz.ch/sympa/subscribe/opal


OPAL Start with Examples
=====================
1.  [Cyclotron](Cyclotron)
2. [FFAG](#FFAG)
3. [RF Photo Injector](#RFPhotoInjector)
4. [Post Processing](#PostProcessing)
5. Old (maybe outdated) [stuff](https://amas.psi.ch/OPAL/wiki/OPAL)

OPAL for Developers: Coding Style and Conventions 
===========================================
1.  [for-developers](for-developers)


