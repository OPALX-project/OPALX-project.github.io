[![](https://amas.web.psi.ch/images/logo.png)](/OPAL/wiki/TracIni#header_logo-section)

# Object Oriented Parallel Accelerator Library (_OPAL_)

## Introduction

_OPAL_ is an open source C++ framework for general particle accelerator simulations including 3D space charge, short range wake fields and particle matter interaction. _OPAL_ is based on IPPL (Independent Parallel Particle Layer) which adds parallel capabilities. Main functions inherited from IPPL are: structured rectangular grids, fields, parallel FFT and particles with the respective interpolation operators. Other features are, expression templates and massive parallelism (up to 65000 processors) which makes it possible to tackle the largest problems in the field. A new Trilinos based iterative solver - currently in the commissioning phase - handles arbitrary complex boundary conditions and benefiting from the new geometry class.

Please use the _OPAL_ mailing list opal@ … (opal AT lists.psi.ch) to discuss problems and issues. Subscribe to the [mailing list](https://psilists.ethz.ch/sympa/subscribe/opal)

Please report bugs and feature requests to the [issue tracker](https://gitlab.psi.ch/OPAL/src/issues) or to the mailing list.

## Documentation & Help

* [_OPAL_ Presentations]( OPALPresentations) and papers (ideal for an overview)
* _OPAL_ 1.6 manual [PDF](http://amas.web.psi.ch/docs/opal/opal_user_guide-1.6.0.pdf)
* _OPAL_ 2.0 manual [Wiki](https://gitlab.psi.ch/OPAL/Manual-2.0/wikis/home), [PDF](http://amas.web.psi.ch/docs/opal/opal_user_guide-2.0.0.pdf) not always in sync with Wiki
* [_OPAL_ conversion utilities](OPAL conversion utilities)

## Download

* [_OPAL_ release notes for version 1.6]( ReleaseNotes/OPAL-1.6)
* [_OPAL_ release notes for version 2.0]( ReleaseNotes/OPAL-2.0)
* [Download _OPAL_ binary package](downloads)
* [Download _OPAL_ source](download source)

## Using and Compiling _OPAL_

* [Use _OPAL_ at PSI](OPALAtPSI)
* [Compile _OPAL_](For Developers/Compile OPAL)
* [Compile _OPAL_ at CSCS](For Developers/Compile OPAL at CSCS)

## Start with Examples

1. [Cyclotron](Cyclotron)
1. [RF Photo Injector](RFPhotoInjector)
1. [Examples from regression tests](RegressionTestExamples)
1. [Post Processing](PostProcessing)
1. [FFA](FFA)

## The runOPAL.py Script

The [runOPAL](runOPAL) Python scripts allows you to run, automated, several OPAL jobs and obtain the
data in a conceived way. Scans of multiple dimensions are easy to perform.

## pyOPALTools

The [pyOPALTools](https://gitlab.psi.ch/OPAL/pyOPALTools) Python package contains many tools for pre- and postprocessing, and analysing and plotting output data.

## OPAL for Developers: Coding Style and Conventions

* [Coding Style and Conventions](For Developers/Codingstyle)
* [Git usage](git-usage) and [git workflow](git-workflow)
* [_OPAL_ 2.0 source code documentation](http://amas.web.psi.ch/docs/opal/master-doxygen/)
* [Building, executing and writing unit tests](unit-tests)
* [Adding new Elements to _OPAL_](new-elements)
* [DKS (CUDA) & _OPAL_](opaldks)
* [Technology & Ideas](tech-ideas)
* [File Format for stat Storage](file_format_storage)

## Regression Tests

* [regression tests for current OPAL versions](regression-tests)

# OPAL Physics Resources

1. Trim coil report (PSI Ring):  [PSI Ring](https://gitlab.psi.ch/OPAL/src/uploads/b9b3e4254af29470e2a81bf6e2feb20c/TM-11-13-TrimCoils-Adam_Joho-1974.pdf)

2. Report of Titus-Stefan Dascalu on Multipole, FFA and Synchrotron tracking. This work was 
supervised by Chris Rogers (RAL) and has been integrated in OPAL 2.0.0. [Multipole](/uploads/0d3fc561b57e8962ed79a57cd6115e37/8FBB32A4-7FA1-4084-A4A7-CDDB1F949CD3_psi.ch.pdf)
