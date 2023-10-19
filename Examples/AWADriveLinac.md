# Drive linac 
This example describes the AWA drive linac beamline which includes RF photocathode gun and 6 standing wave linac cavities. The model is based on the [paper](https://napac2022.vrws.de/papers/wexd5.pdf) by S.-Y. Kim et al.. 

# Goal
Run the AWA drive linac beamline (OPAL_t), and check the beam parameters obtained from the simulation. 

# Preparation
If you do not have already access to OPAL, you can visit [the download page](home). In
case OPAL is on your cluster please check with the administrator how to use. PSI user please click [here](OPALATPSI).

# Needed Input Files
For the AWA drive linac simulation, we need OPAL input deck, and fieldmaps such as RF gun, drive linac cavity, bucking/focusing solenoid magnet, and matching solenoid magnet.

1. Inputfile [input.in](https://amas.web.psi.ch/wiki/AWADriveLinac/input.in)
2. Bucking/focusing solenoid, and  matching solenoid field maps: [BF550.T7](https://amas.web.psi.ch/wiki/AWADriveLinac/BF550.T7) and [M440.T7](https://amas.web.psi.ch/wiki/AWADriveLinac/M440.T7).
3. RF gun field map [GUN.T7](https://amas.web.psi.ch/wiki/AWADriveLinac/GUN.T7)
4. Drive linac cavity field map [DriveLinac.T7](https://amas.web.psi.ch/wiki/AWADriveLinac/DriveLinac.T7)
5. Drive linac solenoids (disabled in the input file) [DS4.T7](https://amas.web.psi.ch/wiki/AWADriveLinac/DS4.T7]) and [DS5.T7](https://amas.web.psi.ch/wiki/AWADriveLinac/DS5.T7)
# Run the AWA drive linac simulation

Here, grid is set to: MX = 64, MY = 64, MZ = 32

`opal  input.in | tee input.out`

# Results and Postprocessing
[Results](https://amas.web.psi.ch/wiki/AWADriveLinac/OPAL_Drivelinac_Example.pdf)
For general post processing, please visit [here](https://gitlab.psi.ch/OPAL/src/wikis/PostProcessing).
