OPAL writes two kind of data:
* statistical data (.stat) such as rms beam sizes, rms emittances, energy, energy spread and much more, in ASCCI files, following the SDDS convention.
* phase space particle data is saved in the H5Hut (.h5) format which follows the general HDF5 conventions.

For postprocessing we recommend to use the [pyOPALTools](https://gitlab.psi.ch/OPAL/pyOPALTools/wikis/home) Python package which contains many tools for pre- and postprocessing, and analysing and plotting output data.

The statistical data can be conveniently plotted with [gnuplot](http://www.gnuplotting.org), as shown in the example section [Cyclotron](Cyclotron).

For the h5 data we provide a [ROOT](https://root.cern.ch/) based plotting utility [H5root](https://gitlab.psi.ch/OPAL/src/wikis/h5root). H5root is part of the binary package. A phase space density plot is shown below.

![H5rootScreenshot](http://amas.web.psi.ch/tools/H5root/H5root.png)