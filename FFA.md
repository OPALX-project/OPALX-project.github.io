There are two methods to model FFAs in OPAL, using the OPAL-Cycl routines.

1. Tracking through an analytical field model (OPAL >= 2.0).
2. Tracking through a 3D field map.

The following workflows have been checked with OPAL 2.0.0rc2.

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

# Tracking through an 3D field map

OPAL can be used to track through a 3D field map. By default interpolation is trilinear. A sample lattice file is available in this example:

[example_2.7z](/uploads/4f80d93d4ac111fa4fe30e641bc394ee/example_2.7z)

Due to file size issues this example was compressed using 7za. Uncompress using 7za from p7zip package. Then run in the usual way.

> 7za x example_2.7z

> cd example_2/example_main_ring

> /path/to/bin/opal Kurri_ADS_Ring

> cd ..

Here is an example log file:

[log](/uploads/ab8a09f990b35910776e341220f0ec30/log)


To make plots, again do

> python example_scripts/plot_orbit.py example_main_ring/

Here is an example of the sort of plots you might see:

![closed_orbit_plan_bz](/uploads/874aee8942800805eed33587a909a778/closed_orbit_plan_bz.png)

Three sectors are shown, together with the dipole (bz) field in Tesla and a low energy proton at injection (11 MeV).
