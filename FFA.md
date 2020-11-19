There are two methods to model FFAs in OPAL, using the OPAL-Cycl routines.

1. Tracking through an analytical field model (OPAL >= 2.0).
2. Tracking through a 3D field map.

The following workflows have been checked with OPAL 2.0.0rc2.

# Tracking through an analytical field model

OPAL can use a fully scaling field model including scaling fringe fields to model FFAs analytically. A sample lattice file is available in this example:

[example_1-OPAL2.0.0rc2.tar.gz](uploads/a8bf57ff99e9e95b7b4bdc99b9c29d9c/example_1-OPAL2.0.0rc2.tar.gz) (Tested on OPAL2.0rc2)

[example_1-OPAL2.4.0.tar.gz](uploads/af56754c46f353a211575184a9ae0737/example_1-OPAL2.4.0.tar.gz) (Tested on OPAL2.4.0_2)

To run the example, download the file example.tar.gz and do

> tar -xzf example_1-OPAL2.4.0.tar.gz

Then change into the working directory and run the code:

> cd example_1/example_sector_ffa

> /path/to/bin/opal SectorFFAGMagnet

> cd ..

If it worked - congratulations, you have run OPAL. You should see a lot of output. There is a sample log file here:

[log](/uploads/00e68ff00bd4309eb8d52f9c061c26af/log)

*Note that in recent versions, the FFA magnet name has changed from SECTORFFA**G**MAGNET to SECTORFFAMAGNET and the lattice will need to be updated. This is in line with the FFA accelerator community recommendation.*

OPAL parses the input file, then writes out the position of each field element, then tracks the particle with some debugging output. You can then make some plots:

> python example_scripts/plot_orbit.py example_sector_ffa/

This relies on a correct installation of PyRoot, the python API for ROOT plotting library - it doesn't always work. Here is an example of the sort of plots you might see:

![opal_example_1_x_y_bz](uploads/d61a116b403f8d629befc73a5b815837/opal_example_1_x_y_bz.png)

Three sectors are shown, together with the dipole (bz) field in Tesla and a low energy proton trajectory at injection (3 MeV).

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

# Tracking through an analytical field map with acceleration

OPAL can also model the full acceleration cycle for an FFA. There is an example FFA with RF active here:

[example_3.tar.gz](/uploads/cf31e0359a4d191fda22455e88483d21/example_3.tar.gz)

Unpack it and run it like:

> tar -xzf example_3.tar.gz

> cd example_3/example_sector_ffa

> /path/to/bin/opal SectorFFAMagnet

> cd ..

Here is an example log file:

[log](/uploads/5487034fc64072c77d123983df75ccaa/log)

To make plots of the RF field do

> python example_scripts/plot_dump_fields.py example_sector_ffa/

and to plot the particle energy with time, do

> python example_scripts/plot_output_planes.py example_sector_ffa/

Here are a couple of examples of the sort of plots you might see:

![cavity_time_dependence_0](/uploads/6d5528136cfc3f4227ea7c4e916e7bcd/cavity_time_dependence_0.png)
![cavity_time_dependence_5](/uploads/9d85e281cc0b787565cbce5b94c21670/cavity_time_dependence_5.png)

These two plots show the RF cavity oscillations at injection and after 500 microseconds. Note how the frequency of the RF cavity has increased - this is to match the increased particle revolution frequency (as the particles have accelerated so much).

The particle energy increases with time to match the RF frequency, like:

![t_vs_energy](/uploads/8bc6376cb3e365ae2c161480aa1f43b3/t_vs_energy.png)

It looks like the acceleration worked! There are actually two particle trajectories shown: the black points show a particle tuned to match the RF reference trajectory, while the blue points show a particle that is offset longitudinally and oscillating around the reference trajectory.