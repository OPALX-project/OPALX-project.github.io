# H5root: a ROOT Based Graphical User Interface for H5hut

The purpose of this application is convenient graphical access to the data stored in
[HDF5](https://www.hdfgroup.org/solutions/hdf5/) files written by
[H5hut](https://dav.lbl.gov/archive/Software/H5hut-H5part/) (formerly known as H5Part)
via a graphical user interface based on [ROOT](http://root.cern.ch/).
[H5root](https://accelconf.web.cern.ch/accelconf/ICAP2009/papers/thpsc049.pdf)
is tailored towards data analysis of particle accelerator simulations.

## Installation guide

TODO

<!--- Repository https://gitlab.psi.ch/H5hut/H5root seems not public. -->

### On PSI Cluster

```
module use unstable
module load gcc/7.3.0 H5root/1.3.4
```

## Quick User Guide

There are two ways to use H5root:

1. as a data browser (no knowledge whatsoever about C++ or ROOT is needed)
2. as a shared library loaded into an interactive ROOT session (some knowledge of C++ and ROOT required).
Of course you can also use the H5root shared library in ROOT macros or compiled executables.

### Data Browser

Once you have built the application (with `--enable-static`), just do `./H5root`. The main GUI will appear.
The menus are meant to be self-explaining, for instance,
`File -> Load` pops up a file browser that lets you pick the file(s) you want to load.
Up to four files may be loaded in the same session.

Then you just select variables, time step etc. and push the buttons!
You can select multiple files and multiple variables,
the program is supposed to produce the plot that makes most sense given the input.
(Note, however, that many multi-file and/or multi-variable plots have not yet been implemented. Missing methods issue an error message for the time being and will be implemented later according to demand.)

#### Command line arguments

H5root comes with limited command line functionality:

* File loading: simply write up to four files after H5root, e.g.:

`./H5root file1.h5 file2.h5 file3.h5`

* Subsampling rate: the option `-ss` lets you choose a subsampling rate for the files being loaded, e.g.:

`./H5root -ss 100 file1.h5`

will read in only every 100th particle in the specified file.

#### Canvas editor

`Edit -> Canvas` will pop up ROOT's nifty Canvas editor,
which lets you change the properties of the specific plot you just created.
For instance, you can change the marker size on a line plot.
Initially, the editor is set to the canvas,
you can change its focus by simply clicking on the objects on the plot (graph, histogram, label, etc.)

Note also that you can zoom into plots clicking and dragging along the axes.
This will stretch your plot without adding more information.
For a true rebinning of the plot, use the zoom sliders on the left and at the bottom of the plot
(or change the binning via Options -> Binning and Contours...).

### The Shared Library

You create the shared libary when compiling the application.
Once you have your shared object `libh5root.so`,
you can load it into any interactive ROOT session with the command:

```c++
   if (TString(gSystem->GetBuildArch()) == TString("macosx64"))
     gSystem->Load("libh5root.dylib");
   else
     gSystem->Load("libh5root.so");
```

You can then access all the H5root objects, such as (and most probably) TH5Dataset,
while fully profiting from ROOT's powerful CINT interpreter.
An example session on Linux would look like this:

```c++
gSystem->Load("libh5root.so");                     \\ load the shared library
TH5Style::SetStyle();                              \\ set the H5root plotting style
TH5Dataset data("example.h5");                     \\ load data in example.h5
data.Histo2d("x","y");                             \\ plot x and y (for default step 0, with default ranges from -1 to 1)
data.Histo2d("x","y",100,-0.02,0.02,-0.015,0.015); \\ for step 100, with x-range and y-range specified
data.H<Tab>                                        \\ check what other methods starting with H... are available for this object!
```

The most convenient way to generate a line plot is via the method `GetGraphXY`. Here's an example (see source code for extensive documentation):

```c++
data.SetSlicePosition("mean");                     \\ slice should be centered around mean z of all particles
                                                   \\ (other options are "median", "half" − for the position halfway between zmin and zmax −,
                                                   \\ "start", "end", and "peak".
data.SetSliceLength(0.5,"mm");                     \\ slice length should be 0.5 mm (you can also specify in "ps").
                                                   \\ Alternatively, you can request a slice that contains x percent of the whole bunch, via data.SetSlicePercent(x);!
TGraph* sliceEmittance = data.GetGraphXY("SPOS","emittance(x,px)","slice");
TH1F *frame = myCanv->DrawFrame(0.,0.,1.0,0.00015);
frame->SetXTitle("s [m]");
frame->SetYTitle("#varepsilon_{x} [mm mrad]");
sliceEmittance->Draw("LPsame");
myCanv->Update();
```

For more complex operations you will likely want to write a macro.
The example macro [example.C](H5root/example.C) is enclosed in the package.
It was used to produce this jpeg image:

![TunesClosedOrbitFinder](H5root/H5rootexample.jpg)

## Online Class Documentation

The [online class documentation for version 1.2](http://amas.web.psi.ch/tools/H5root/htmldoc/)
is produced with ROOT's [THtml](http://root.cern.ch/root/html/THtml.html) class.

## Known Bugs / Problems

None yet

## Planned Features

None yet

## Other Comments

H5root follows the ROOT coding conventions, which are themselves based on the Taligent rules.
For instance, (base) classes begin with a capital 'T', data members with a small 'f', etc.
The classes specifically written for H5root begin with 'TH5' to distinguish them from the plain ROOT classes.