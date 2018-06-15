There are two methods to model FFAs in OPAL, using the OPAL-Cycl routines.

1. Tracking through an analytical field model (OPAL >= 2.0).
2. Tracking through a 3D field map.

# Tracking through an analytical field model

OPAL can use a fully scaling field model including scaling fringe fields to model FFAs analytically. A sample lattice file is available in this example:

[example.tar.gz](/uploads/ce9edbd174515324704553df84647864/example.tar.gz)

To run the example, download the file example.tar.gz and do

> tar -xzf example.tar.gz

Then change into the working directory:

> cd example/example_sector_ffa

> /path/to/bin/opal SectorFFAGMagnet

> cd ..

If it worked - congratulations, you have run OPAL. You should see a lot of output. There is a sample log file here:

[log](/uploads/00e68ff00bd4309eb8d52f9c061c26af/log)

OPAL parses the input file, then writes out the position of each field element. You can then make some plots:

> python example_scripts/plot_orbit.py example_sector_ffa/

This relies on a correct installation of PyRoot, the python API for ROOT plotting library - it doesn't always work. Here is an example of the sort of plots you might see:

![closed_orbit_plan_bz](/uploads/a8dd1e2e8c97983e98dee3060f487de7/closed_orbit_plan_bz.png)

Three sectors are shown, together with the dipole (bz) field in Tesla and a low energy proton at injection (3 MeV).