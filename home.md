[![](https://amas.web.psi.ch/images/logo.png)](/OPAL/wiki/TracIni#header_logo-section)

# Object Oriented Parallel Accelerator Library (_OPAL_)

## Introduction

_OPAL_ (Object Oriented Parallel Accelerator Library) is a parallel open source tool for charged-particle optics in linear accelerators and rings, including 3D space charge.
Using the MAD language with extensions, _OPAL_ can run on a laptop as well as on the largest high performance computing systems.
_OPAL_ is built from the ground up as a parallel application exemplifying the fact that high performance computing is the third leg of science, complementing theory and experiment.

The _OPAL_ framework makes it easy to add new features in the form of new C++ classes.
_OPAL_ comes in the following flavours:

* _OPAL-cycl_:
  tracks particles with 3D space charge including neighbouring turns in
  cyclotrons and FFAs with time as the independent variable.
* _OPAL-t_:
  models beam lines, linacs, rf-photo injectors and
  complete XFELs excluding the undulator.
* _OPAL-map_:
  map tracking (experimental).

The code is managed through the git distributed version control system. A suite of unit tests have been developed for various parts of OPAL, validating each part of the code independently. Unit tests use the google testing framework. System tests validate the overall integration of different elements. Documentation is written in asciidoc. Tools are available to readily convert asciidoc into formats such as pdf and html for display.

Please use the _OPAL_ mailing list opal@ … (opal AT lists.psi.ch) to discuss problems and issues. Subscribe to the [**mailing list**](https://psilists.ethz.ch/sympa/subscribe/opal)

Please report bugs and feature requests to the [issue tracker](https://gitlab.psi.ch/OPAL/src/issues) or to the mailing list.

## Documentation & Help

* [_OPAL_ Presentations, papers and reports](OPALPresentations) (ideal for an overview)
* _OPAL_ 2.3
[manual HTML](http://amas.web.psi.ch/opal/Documentation/master/OPAL_Manual.html)
[manual PDF](http://amas.web.psi.ch/docs/opal/opal_user_guide-2.2.0.pdf) (not always in sync with online manual),
* _OPAL_ 2.2
[manual HTML](http://amas.web.psi.ch/opal/Documentation/2.2/OPAL_Manual.html),
[manual PDF](http://amas.web.psi.ch/docs/opal/opal_user_guide-2.2.0.pdf) (not always in sync with online manual),
[release notes](ReleaseNotes/OPAL-2.2)
* _OPAL_ 2.0
[manual HTML](http://amas.web.psi.ch/opal/Documentation/2.0/OPAL_Manual.html),
[manual PDF](http://amas.web.psi.ch/docs/opal/opal_user_guide-2.0.0.pdf),
[release notes](ReleaseNotes/OPAL-2.0)
* _OPAL_ 1.6
[manual PDF](http://amas.web.psi.ch/docs/opal/opal_user_guide-1.6.0.pdf),
[release notes](ReleaseNotes/OPAL-1.6)
* [_OPAL_ conversion utilities](OPAL-conversion-utilities)

## Download
* [Download _OPAL_ binary package](downloads)
* [Download _OPAL_ source](download-source)

## Using and Compiling _OPAL_

* [Use _OPAL_ at PSI](OPALAtPSI)
* [Compile _OPAL_](For%20Developers/Compile-OPAL)
* [Compile _OPAL_ at CSCS](For%20Developers/Compile-OPAL-at-CSCS)

## Start with Examples

1. [Cyclotron](Cyclotron)
1. [RF Photo Injector](RFPhotoInjector)
1. [Examples from regression tests](RegressionTestExamples)
1. [FFA](FFA)
1. [Tutorial from Manual](http://amas.web.psi.ch/opal/Documentation/2.2/OPAL_Manual.html#chp.tutorial)

## The runOPAL.py Script

The [runOPAL](runOPAL) Python scripts allows you to run, automated, several OPAL jobs and obtain the
data in a conceived way. Scans of multiple dimensions are easy to perform.

## Post Processing and pyOPALTools

The [pyOPALTools](https://gitlab.psi.ch/OPAL/pyOPALTools/wikis/home) Python package contains many tools for pre- and postprocessing, and analysing and plotting output data.
See also [Post Processing](PostProcessing).

## OPAL for Developers: Coding Style and Conventions

* [Coding Style and Conventions](For-Developers/Codingstyle)
* [Development workflow, Git and Gitlab usage](For-Developers/OPAL-Development-Workflow)
* [_OPAL_ source code documentation](http://amas.web.psi.ch/docs/opal/master-doxygen/html/)
* [Building, executing and writing unit tests](For-Developers/unit-tests)
* [DKS (CUDA) & _OPAL_](For-Developers/opaldks)
* [Technology & Ideas](For-Developers/tech-ideas)
* [File Format for stat Storage](For-Developers/File-Format-for-stat-Storage)
* [IPPL Documentation](For-Developers/ippl_user_guide.pdf)
* [Release Procedure](For-Developers/Release-Procedure)
* [Periodic Tele-cons](For-Developers/Periodic-Tele-cons)
* [Most Used Directories in the Code](For-Developers/Most-Used-Directories-in-the-Code)

## Regression Tests

* [regression tests for current OPAL versions](regression-tests)

# [OPAL Physics Resources](OPALPresentations)
