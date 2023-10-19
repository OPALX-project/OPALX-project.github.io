# EEX beamline
This example describes AWA emittance exchange (EEX) beamline. The model is based on the [paper](https://napac2022.vrws.de/papers/wexd5.pdf) by S.-Y. Kim et al.. For more details on the EEX beamline,
please find the reference papers;
1. M. Cornacchia, P. Emma, Phys. Rev. ST Accel. Beams 5, 084001, 2002 (https://journals.aps.org/prab/abstract/10.1103/PhysRevSTAB.5.084001)
2. P. Piot, Y.-E Sun, J. G. Power, and M. Rihaoui, Phys. Rev. ST Accel. Beams 14, 022801, 2011 (https://journals.aps.org/prab/abstract/10.1103/PhysRevSTAB.14.022801)
3. G. Ha et al., Phys. Rev. Lett. 118, 104801, 2017 (https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.118.104801)

# Goal
Run the EEX linac beamline (OPAL_t), and check the beam parameters obtained from the simulation. 

# Preparation
If you do not have already access to OPAL, you can visit [the download page](home). In
case OPAL is on your cluster please check with the administrator how to use. PSI user please click [here](OPALATPSI).

# Needed Input Files
Since this is separated EEX simulation, you will need 6D phase space information as an input by running the drive linac simulation. Here the initial particle distribution is provided as “partcl.data.” In addition, for this simulation, we need fieldmaps of transverse deflecting cavity (TDC) and dipole magnet.

1. Inputfile [input.in](https://amas.web.psi.ch/wiki/AWAEEXBeamline/input.in)
2. Particle data [partcl.data](https://amas.web.psi.ch/wiki/AWAEEXBeamline/partcl.data)
2. Tranvserse deflecting cavity (TDC) and dipole magnet field maps: [TDC.dat](https://amas.web.psi.ch/wiki/AWAEEXBeamline/TDC.dat) and [EEXDIP30cm.opal](https://amas.web.psi.ch/wiki/AWAEEXBeamline/EEXDIP30cm.opal).
3. Transverse mask: [TriangularDrive_Witness.pbm](https://amas.web.psi.ch/wiki/AWAEEXBeamline/TriangularDrive_Witness.pbm)

# Run the AWA drive linac simulation
Here, space charge and CSR calculations are turned off

`opal  input.in | tee input.out`

# Postprocessing
For postprocessing, please visit [here](https://gitlab.psi.ch/OPAL/src/wikis/PostProcessing).
