# Goal
Here we will run the Cyclotron flavour of OPAL (OPAL_cycl) in two distinct modes
1. Tune Calculation
   * Tune Calculation with OPAL's closed orbit finder (only in OPAL 2.2 and higher)
2. Accelerated orbit mode
<!--
3. 3D space charge calculation (under construction)
-->

# Preparation
This example is for OPAL 2.0.x and 1.6.x (see compatible versions in examples).
If you do not have already access to OPAL, you can visit the download page [the download page](home). In
case OPAL is on your cluster please check with the administrator how to use. PSI user please click [here](OPALAtPSI).

# Needed Input Files
For this project we need input files, that you obtain by clicking on links below:

| File | Description |
| ---- |-----|
| [cyclotron1.in](Cyclotron/cyclotron1.in) and [cyclotron2.in](Cyclotron/cyclotron2.in) ([cyclotron1.in](Cyclotron/1.6/cyclotron1.in) and [cyclotron2.in](Cyclotron/1.6/cyclotron2.in) for 1.6.x) | the OPAL input files |
| [bfield.dat](Cyclotron/bfield.dat) | magnetic field map |
| [rffield1.dat](Cyclotron/rffield1.dat) and [rffield2.dat](Cyclotron/rffield2.dat) | rf field maps |
| [dist1.dat](Cyclotron/dist1.dat) [dist2.dat](Cyclotron/dist2.dat) | the input distributions |
| [ic.dat](Cyclotron/ic.dat) | initial conditions for the tune calculation |
| [refsol.dat](Cyclotron/refsol.dat) | the reference solution for the tune calculation |
| [cyclotron1.gpl](Cyclotron/cyclotron1.gpl) and [cyclotron2.gpl](Cyclotron/cyclotron2.gpl) ([cyclotron2.gpl](Cyclotron/1.6/cyclotron2.gpl) for 1.6.x) | plotting scripts for gnuplot |

# Tune Calculation using cyclotron1.in
### Needed files: cyclotron1.{in,bash,gpl}, bfield.dat, dist1.dat, ic.dat & refsol.dat

For the tune calculation we need initial conditions (ic):  energy, radius and radial momenta given to us by an other program in the file  ic.dat.
The Bash script [cyclotron1.bash](Cyclotron/cyclotron1.bash) will run the tune calculation for all energies specified in ic.dat and store the
radial and vertical tune values together with reference data.
Make sure the script has execute permission (`chmod u+x cyclotron1.bash`).
A comparison can be plotted with [gnuplot](http://www.gnuplotting.org), by executing

`gnuplot cyclotron1.gpl`

The result is saved in cyclotron1.pdf and shown below.

![tunesFIXPO](Cyclotron/cyclotron1.png)

### Tune Calculation with OPAL's closed orbit finder (only in OPAL 2.2 and higher)

### Needed files
| File | Description |
| ---- |-------|
| [cyclotronTune-2-1.in](uploads/d608f4e27287cf1a0b9166b50435de23/cyclotronTune-2-1.in) | OPAL input file |
| [bfield.dat](Cyclotron/bfield.dat) | magnetic field map |
| [plotTunes.py](Cyclotron/plotTunes.py) | python (version 3) plotting script for tune calculation |

Since version 2.2 OPAL has a closed orbit finder with tune calculation based on Gordon's algorithm.

The important commands in the input file are:

```
OPTION, CLOTUNEONLY =true;
```

This tells OPAL to only perform the closed orbit finder and tune calculation.

```
Ring: CYCLOTRON, TYPE="RING", CYHARMON=6, PHIINIT=0.0, PRINIT=pr0, RINIT=r0 , SYMMETRY=8.0, RFFREQ=f1, FMAPFN="bfield.dat", FMLOWE=72, FMHIGHE=590;
```

The minimal and maximal energy for the tune calculation (72 and 590 MeV).

```
DistTO: DISTRIBUTION,  TYPE=GAUSSMATCHED, LINE=L1,
        NSTEPS=1440, DENERGY=0.001, MAXSTEPSCO = 100, NSECTORS=8, SECTOR=FALSE;
```

The matched gauss distribution with parameters for the closed orbit finder
(energy steps of 0.001 GeV, average the field over 8 sectors and a maximum of 100 steps for the closed orbit finder to converge).
More information on the matched gauss distribution can be found in the [Manual](http://amas.web.psi.ch/opal/Documentation/2.2/OPAL_Manual.html#sec.distribution.gaussmatchedtype).

Run OPAL with

`opal cyclotronTune-2-1.in`

and plot the result from the output file `data/tunes.dat` with

`python3 plotTunes.py`

The result is saved in `RingTunes.png` and shown below.

![TunesClosedOrbitFinder](Cyclotron/RingTunes.png)

# Accelerated Orbit Calculation using cyclotron2.in
### Needed files: cyclotron2.{in,gpl}, bfield.dat, dist2.dat, rffield1.dat & rffield2.dat
For this calculation the initial conditions are set in the input file. Run OPAL with

`opal cyclotron2.in | tee cyclotron2.out`

where you also save the output in cyclotron2.out. It is always a good idea to check the standard output of OPAL in order to reveal problems.

`gnuplot cyclotron2.gpl`

As in the previous example, the result is saved in cyclotron2.pdf and shown below.

![Orbit](Cyclotron/cyclotron2.png)

<!--
# 3D space charge calculation
### Under construction

In cyclotron2.in, only the distribution and beam command, together with the field solver needs to be adapted.

Dist1 as defined here

**Dist1:DISTRIBUTION, DISTRIBUTION=GAUSS**

**sigmax=3E-3, sigmapx=1E-5,**

**sigmay=3E-3, sigmapy=1E-5,**

**sigmat=3E-3, sigmapt=1E-5,**

**CORRX = 0,  CORRY =0,  CORRT = 0;**

represents a beam with 3 mm rms. The field solver **Fs1** is the standard open domain FFT solver:

**Fs1:FIELDSOLVER, FSTYPE=FFT, MX=64, MY=64, MT=64, PARFFTX=true, PARFFTY=true, PARFFTT=false,  BCFFTX=open, BCFFTY=open, BCFFTT=open;**

and the beam is represented by **1E5** macro particles

**Beam1: BEAM, PARTICLE=PROTON, pc=P0, NPART=1E5, BCURRENT=1.0E-6, CHARGE=1.0, BFREQ= f1;**
-->