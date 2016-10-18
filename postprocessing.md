OPAL writes two kind of data:
* statistical data (.stat) such as rms beam sizes, rms emittances, energy, energy spread and much more, in ASCCI files, following the SDDS convention.
* phase space particle data is saved in the H5Hut (.h5) format which follows the general HDF5 conventions.

The statistical data can be conveniently plotted with  [gnuplot](http://www.gnuplotting.org), as shown in the example section  [Cyclotron](Cyclotron). For the
h5 data we provide a [root](https://root.cern.ch/) based plotting utility [H5root](http://amas.web.psi.ch/tools/H5root/index.html). 