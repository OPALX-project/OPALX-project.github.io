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

### OPAL documentation

| Version | Manual | Source code <br> documentation | Release notes | 
| ------- | ------ | ------------------------- | ------------- |
| _OPAL_ development | [HTML](http://amas.web.psi.ch/opal/Documentation/master/index.html), [PDF](http://amas.web.psi.ch/opal/Documentation/master/Manual.pdf) | [html](http://amas.web.psi.ch/opal/CodeDocumentation/master/index.html) | [html](ReleaseNotes/OPAL-2.6) |
| _OPAL_ 2.4 | [HTML](http://amas.web.psi.ch/opal/Documentation/2.4/index.html), [PDF](http://amas.web.psi.ch/opal/Documentation/2.4/Manual.pdf) | [html](http://amas.web.psi.ch/opal/CodeDocumentation/2.4/index.html) | [html](ReleaseNotes/OPAL-2.4) |
| _OPAL_ 2.2 | [HTML](http://amas.web.psi.ch/opal/Documentation/2.2/index.html), [PDF](http://amas.web.psi.ch/opal/Documentation/2.2/Manual.pdf) | [html](http://amas.web.psi.ch/opal/CodeDocumentation/2.2/index.html) | [html](ReleaseNotes/OPAL-2.2) |
| _OPAL_ 2.0 | [HTML](http://amas.web.psi.ch/opal/Documentation/2.0/index.html), [PDF](http://amas.web.psi.ch/opal/Documentation/2.0/Manual.pdf) | [html](http://amas.web.psi.ch/opal/CodeDocumentation/2.0/index.html) | [html](ReleaseNotes/OPAL-2.0) |


## Download

| Version | Source | Linux <br> binary | macOS <br> binary | Release notes <br> of binary package |
| ------- | ------ | ----------------- | ----------------- | ------------------------------------ |
|         |        |                   |                   |                                      |

<!--

| OPAL 2.4.0 | [tar.xz](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.4.0-1-x86_64-linux.tar.xz), [md5](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.4.0-1-x86_64-linux.tar.xz.md5) | [tar.xz](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.4.0-1-x86_64-macos.tar.xz), [md5](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.4.0-1-x86_64-macos.tar.xz.md5) | [tar.xz](http://amas.web.psi.ch/Downloads/OPAL/src/OPAL-2.4.0.tar.xz), [md5](http://amas.web.psi.ch/Downloads/OPAL/src/OPAL-2.4.0.tar.xz.md5) | n.a. |

| OPAL-2.2.1 |  [tar.xz](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.2.1-1-x86_64-linux.tar.xz), [md5](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.2.1-1-x86_64-linux.tar.xz.md5) | n.a. | [tar.xz](http://amas.web.psi.ch/Downloads/OPAL/src/OPAL-2.4.0.tar.xz), [md5](http://amas.web.psi.ch/Downloads/OPAL/src/OPAL-2.4.0.tar.xz.md5) |
| OPAL-2.2.0 | [tar.xz](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.2.0-1-x86_64-linux.tar.xz), [md5](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.2.0-1-x86_64-linux.tar.xz.md5) | [tar.xz](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.2.0-1-x86_64-macos.tar.xz), [md5](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.2.0-1-x86_64-macos.tar.xz.md5) | [tar.xz](http://amas.web.psi.ch/Downloads/OPAL/src/OPAL-2.2.0.tar.xz), [md5](http://amas.web.psi.ch/Downloads/OPAL/src/OPAL-2.2.0.tar.xz.md5) |
| OPAL-2.0.2 | [tar.xz](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.0.2-1-x86_64-linux.tar.xz), [md5](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.0.2-1-x86_64-linux.tar.xz.md5) | [tar.xz](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.0.2-1-x86_64-macos.tar.xz), [md5](http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.0.2-1-x86_64-macos.tar.xz.md5) | [tar.xz](http://amas.web.psi.ch/Downloads/OPAL/src/OPAL-2.4.0.tar.xz), [md5](http://amas.web.psi.ch/Downloads/OPAL/src/OPAL-2.4.0.tar.xz.md5) |

 
| link:ReleaseNotes/OPAL-2.2[release notes] 
| link:ReleaseNotes/OPAL-2.2[release notes]



| http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.2.0-1-x86_64-macos.tar.xz[OPAL-2.2.0 for macOS]
| http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.2.0-1-x86_64-macos.tar.xz.md5[md5 sum] 
| link:ReleaseNotes/OPAL-2.2[release notes]

| http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.0.2-1-x86_64-macos.tar.xz[OPAL-2.0.2-1 for macOS]
| http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.0.2-1-x86_64-macos.tar.xz.md5[md5 sum] 
| link:ReleaseNotes/OPAL%202.0[release notes]
-->

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

## Tools
### The runOPAL.py Script

The [runOPAL](runOPAL) Python scripts allows you to run, automated, several OPAL jobs and obtain the
data in a conceived way. Scans of multiple dimensions are easy to perform.

### Post Processing and pyOPALTools

The [pyOPALTools](https://gitlab.psi.ch/OPAL/pyOPALTools/wikis/home) Python package contains many tools for pre- and postprocessing, and analysing and plotting output data.
See also [Post Processing](PostProcessing).

### Conversion utilities

* [_OPAL_ conversion utilities](OPAL-conversion-utilities)

## OPAL for Developers

* Development
  * [Coding Style and Conventions](For-Developers/Codingstyle)
  * [Building, executing and writing unit tests](For-Developers/unit-tests)
  * [Development workflow, Git and Gitlab usage](For-Developers/OPAL-Development-Workflow)
  * [Release Procedure](For-Developers/Release-Procedure)
* Documentation
  * [_OPAL_ source code documentation](http://amas.web.psi.ch/opal/CodeDocumentation/master/)
  * [IPPL Documentation](For-Developers/ippl_user_guide.pdf)
  * [Most Used Directories in the Code](For-Developers/Most-Used-Directories-in-the-Code)
* [Technology & Ideas](For-Developers/tech-ideas)
* [Periodic Tele-cons](For-Developers/Periodic-Tele-cons)
* [regression tests for current OPAL versions](regression-tests)

# [OPAL Physics Resources](OPALPresentations)
