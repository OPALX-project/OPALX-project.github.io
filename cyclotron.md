# Goal
Here we will run the Cyclotron flavour of OPAL (OPAL_cyc) in three distinct modes
1. tune calculation
2. accelerated orbit mode
3. 3D space charge

# Preparation
If you do not have already access to OPAL, you can visit the download page (https://amas.psi.ch/OPAL/wiki/Downloads) . In
case OPAL is on your cluster please check with the administrator how to use. PSI user please click [here](opalmerlin). 

# Needed Input Files
For this project we need 4 types of input files:

1. cyclotron1.in (cyclotron2.in, cyclotron3.in) the OPAL input file(s)
2. bfieldmap.dat (magnetic field map)
3. rffieldmap1.dat and rffieldmap2.dat (rf field maps)
4. dist1.dat (the input distribution)
5. ic.dat (initial conditions for the tune calculation)
6. refsol.dat (the reference solution for the tune calculation)

# Tune Calculation
For the tune calculation we need the initial condition:  energy, radius and radial momenta given to us by an other program.
These data are in ic.dat. The Bash cyclotron1.bash will not run the tune calculation for all energies specified in ic.dat.

The results can be plotted with `gnuplot` by exectting

`gnuplot cyclotron1.gpl`

The resulting `cyclotron.pdf` is shown below.

[cyclotron1.pdf](/uploads/b0abbfd4ff5636cd05503382f3d4f2f0/cyclotron1.pdf)

