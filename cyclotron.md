# Goal
Here we will run the Cyclotron flavour of OPAL (OPAL_cyc) in three distinct modes
1. tune calculation
2. accelerated orbit mode
3. 3D space charge calculation

# Preparation
If you do not have already access to OPAL, you can visit the download page (https://amas.psi.ch/OPAL/wiki/Downloads) . In
case OPAL is on your cluster please check with the administrator how to use. PSI user please click [here](opalmerlin). 

# Needed Input Files
For this project we need input files, that you obtain by clicking on links below:

1. [cyclotron1.in]( https://amas.web.psi.ch/wiki/cyclotron/cyclotron1.in) ([cyclotron2.in]( https://amas.web.psi.ch/wiki/cyclotron/cyclotron2.in), cyclotron3.in) the OPAL input file(s)
2. [bfield.dat]( https://amas.web.psi.ch/wiki/cyclotron/bfield.dat) (magnetic field map)
3. [rffield1.dat]( https://amas.web.psi.ch/wiki/cyclotron/rffield1.dat) and [rffield2.dat](https://amas.web.psi.ch/wiki/cyclotron/rffield2.dat) (rf field maps)
4. [dist1.dat]( https://amas.web.psi.ch/wiki/cyclotron/dist1.dat) [dist2.dat]( https://amas.web.psi.ch/wiki/cyclotron/dist2.dat) (the input distributions)
5. [ic.dat]( https://amas.web.psi.ch/wiki/cyclotron/ic.dat) (initial conditions for the tune calculation)
6. [refsol.dat]( https://amas.web.psi.ch/wiki/cyclotron/refsol.dat) (the reference solution for the tune calculation)

# Tune Calculation using cyclotron1.in
### Needed files: cyclotron1.{in,bash,gpl}, bfield.dat, dist1.dat, ic.dat & refsol.dat

For the tune calculation we need initial conditions (ic):  energy, radius and radial momenta given to us by an other program in the file  ic.dat. The Bash script [cyclotron1.bash](https://amas.web.psi.ch/wiki/cyclotron/cyclotron1.bash) will run the tune calculation for all energies specified in ic.dat and store the 
radial and vertical tune values together with reference data.  Make sure the script has execute permission (`chmod +x cyclotron1.bash`) A comparison can be plotted with [gnuplot](http://www.gnuplotting.org), by executing

`gnuplot cyclotron1.gpl`

The result is shown below and was obtained with [cyclotron1.gpl](https://amas.web.psi.ch/wiki/cyclotron/cyclotron1.gpl).

<center>[![](https://amas.web.psi.ch/wiki/cyclotron/cyclotron1.png)](/OPAL/wiki/TracIni#ctclotron1)</center>

# Accelerated Orbit Calculation using cyclotron2.in
### Needed files: cyclotron2.{in,gpl}, bfield.dat, dist2.dat, rffield1.dat & rffield2.dat
For this calculation the initial conditions are set in the input file. Run OPAL with

`opal  cyclotron2.in | tee cyclotron2.out`

where you also save the output in cyclotron2.out. It is always a good idea to check the standard output of OPAL in order to reveal problems. 

As in the previous example, the result shown below where obtained with [cyclotron2.gpl](https://amas.web.psi.ch/wiki/cyclotron/cyclotron2.gpl)

`gnuplot cyclotron2.gpl`

<center>[![](https://amas.web.psi.ch/wiki/cyclotron/cyclotron2.png)](/OPAL/wiki/TracIni#ctclotron2)</center>

# 3D space charge calculation

In cyclotron2.in, the distribution and the field solver needs to be changed.

Dist1 as defined here

**Dist1:DISTRIBUTION, DISTRIBUTION=GAUSS**

**sigmax=3E-3, sigmapx=1E-5,**

**sigmay=3E-3, sigmapy=1E-5,**

**sigmat=3E-3, sigmapt=1E-5,**

**CORRX = 0,  CORRY =0,  CORRT = 0;**

represents a beam with 3 mm rms

Fs1:FIELDSOLVER, FSTYPE=FFT, MX=64, MY=64, MT=64, PARFFTX=true, PARFFTY=true, PARFFTT=false, 
BCFFTX=open, BCFFTY=open, BCFFTT=open;

Beam1: BEAM, PARTICLE=PROTON, pc=P0, NPART=1E5, BCURRENT=1.0E-6, CHARGE=1.0, BFREQ= f1;



