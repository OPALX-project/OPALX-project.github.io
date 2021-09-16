This example describes a rf-photo injector, as part of the Argonne Wakefield Accelerator (AWA). The model based on the [paper](http://vrws.de/napac2016/papers/thpoa46.pdf) by N.R. Neveu et al.,  and benchmarks three codes: GPT, ASTRA and OPAL.

# Goal
Here we will run the rf-photo injector (OPAL_t) 

# Preparation
If you do not have already access to OPAL, you can visit [the download page](home). In
case OPAL is on your cluster please check with the administrator how to use. PSI user please click [here](OPALATPSI).

# Needed Input Files
For this project we need input files, that you obtain by clicking on links below:

1. Inputfile [RFphotoinjector.in](https://amas.web.psi.ch/wiki/RFphotoinjector/RFphotoinjector.in) 
2. Two solenoid field maps: [M_440.T7](https://amas.web.psi.ch/wiki/RFphotoinjector/M_440.T7) and [BF_550.T7 ](https://amas.web.psi.ch/wiki/RFphotoinjector/BF_550.T7) 
3. RF gun field map [DriveGun.T7](https://amas.web.psi.ch/wiki/RFphotoinjector/DriveGun.T7)

# Run the Photo Injector Simulation
For this calculation the initial conditions are all set in the input file. Run OPAL with

`opal  RFphotoinjector.in | tee RFphotoinjector.out`

For postprocessing visit [here](https://gitlab.psi.ch/OPAL/src/wikis/PostProcessing).
The results for the case with a 32^3 mesh and 1E5 macro particles are shown in the following figures:

![RFphoto5mNoMinStep](https://amas.web.psi.ch/wiki/RFphotoinjector/figures/wikitest5mNoMinStep.png)

![RFphotoNoMinStep](https://amas.web.psi.ch/wiki/RFphotoinjector/figures/wikitestNoMinStep.png)