# Goal
Here we will run the Cyclotron flavour of OPAL (OPAL_cyc) in three distinct modes
1. tune calculation
2. accelerated orbit mode
3. 3D space charge

# Preparation
If you do not have already access to OPAL, you can visit the download page (https://amas.psi.ch/OPAL/wiki/Downloads) . In
case OPAL is on your cluster please check with the administrator how to use. PSI user please click [here](opalmerlin). 

# Needed Input Files
For this project we need input files, that you obtain by clicking on links below:

1. [cyclotron1.in]( https://amas.web.psi.ch/wiki/cyclotron/cyclotron1.in) (cyclotron2.in, cyclotron3.in) the OPAL input file(s)
2. [bfieldmap.dat]( https://amas.web.psi.ch/wiki/cyclotron/bfieldmap.dat) (magnetic field map)
3. [rffieldmap1.dat]( https://amas.web.psi.ch/wiki/cyclotron/rffieldmap1.dat) and rffieldmap2.dat (rf field maps)
4. [dist1.dat]( https://amas.web.psi.ch/wiki/cyclotron/dist1.dat) (the input distribution)
5. [ic.dat]( https://amas.web.psi.ch/wiki/cyclotron/ic.dat) (initial conditions for the tune calculation)
6. [refsol.dat]( https://amas.web.psi.ch/wiki/cyclotron/refsol.dat) (the reference solution for the tune calculation)

# Tune Calculation using cyclotron1.in
For the tune calculation we need the initial condition (ic):  energy, radius and radial momenta given to us by an other program in the file  ic.dat. The Bash [cyclotron1.bash](https://amas.web.psi.ch/wiki/cyclotron/cyclotron1.bash) will run the tune calculation for all energies specified in ic.dat and store the 
radial and vertical tune values together with reference data.  A comparison can be plotted with [gnuplot](http://www.gnuplotting.org), by executing

`gnuplot cyclotron1.gpl`

The result is shown below and was obtained with [cyclotron1.gpl](https://amas.web.psi.ch/wiki/cyclotron/cyclotron1.gpl).

<center>[![](https://amas.web.psi.ch/wiki/cyclotron/cyclotron1.png)](/OPAL/wiki/TracIni#ctclotron1)</center>
