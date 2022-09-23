Examples are provided for tracking FFAs in a number of circumstances:

1. Tracking through an analytical horizontal FFA field model
2. Tracking through a 3D field map.
3. Tracking through an analytical horizontal FFA field model with RF acceleration
4. Tracking through an analytical vertical FFA field model

The following workflows have been checked with OPAL 2.4.0_2. Note that examples checked against OPAL 2.0.0 are given at the bottom of the page, for this very old version of OPAL.

# Tracking through an analytical field model

OPAL can use a fully scaling field model including scaling fringe fields to model FFAs analytically. A sample lattice file is available in this example:

[example_1-OPAL-2021.1.0.tar.gz](uploads/f905dd68fd6aad863db76009dec93a1f/example_1-OPAL-2021.1.0.tar.gz) (Tested on OPAL-2021.1.0)

[example_1-OPAL2.4.0.tar.gz](uploads/5d345b982676863c9ffeac274ae189c2/example_1-OPAL2.4.0.tar.gz) (Tested on OPAL2.4.0_2)

To run the example, download the file example.tar.gz and do

> tar -xzf example_1-OPAL2.4.0.tar.gz

Then change into the working directory and run the code:

> cd example_1/example_sector_ffa

> /path/to/bin/opal SectorFFAGMagnet

> cd ..

If it worked - congratulations, you have run OPAL. You should see a lot of output. There is a sample log file here:

[log](/uploads/00e68ff00bd4309eb8d52f9c061c26af/log)

OPAL parses the input file, then writes out the position of each field element, then tracks the particle with some debugging output. You can then make some plots:

> python example_scripts/plot_orbit.py example_sector_ffa/

For OPAL2.4.0 version, the plotting routines use matplotlib and python3. The OPAL2.0.0 version use python2 and PyRoot, the python API for ROOT plotting library. Here is an example of the sort of plots you might see:

![opal_example_1_x_y_bz](uploads/d61a116b403f8d629befc73a5b815837/opal_example_1_x_y_bz.png)

Three sectors are shown, together with the dipole (bz) field in Tesla and a low energy proton trajectory at injection (3 MeV).

# Tracking through an 3D field map

OPAL can be used to track through a 3D field map. By default interpolation is trilinear. A sample lattice file is available in this example:

[example_2-OPAL-2021.1.0.7z](uploads/acdb7876379a2858a091efa84da4a334/example_2-OPAL-2021.1.0.7z) (Tested on OPAL2021.1.0.7z)

[example_2-OPAL2.4.0.7z](uploads/01aa55a6183fda17f608c44867191b6d/example_2-OPAL2.4.0.7z) (Tested on OPAL2.4.0_2)

Due to the size of the field map this example was compressed using 7za. Uncompress using 7za from p7zip package. Then run in the usual way.

> 7za x example_2-OPAL2.4.0.7z

> cd example_2/example_main_ring

> /path/to/bin/opal KURNS_ADS_Ring

> cd ..

Here is an example log file:

[log](uploads/811a1c51ca9ea0ab08b1e9af59ae0467/log)

To make plots, again do

> python example_scripts/plot_orbit.py example_main_ring/

Here is an example of the sort of plots you might see:

![opal_example_2_x_y_bz](uploads/1bea4bf28bb27b2eb0cf6e3395d2b464/opal_example_2_x_y_bz.png)

Three sectors are shown, together with the dipole (bz) field in Tesla and a low energy proton at injection (11 MeV).

# Tracking through an analytical field map with acceleration

OPAL can also model the full acceleration cycle for an FFA. There is an example FFA with RF active here:

[example_3-OPAL2.4.0.tar.gz](uploads/c1243e5a67b4402c7898c7b18e7b961a/example_3-OPAL2.4.0.tar.gz) (Tested on OPAL2.4.0_2)

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

# Tracking through an analytical vertical FFA field map

OPAL can track through a vertical FFA field, where the orbit moves vertically as the energy increases. This is unlike a conventional hFFA where the orbit moves radially. There is an example of OPAL with a vertical FFA field here (OPAL >2.4.0 only):

[example_4-OPAL2.4.0.tar.gz](uploads/a984d433c09ffe2fc2c7b1c70dc889fe/example_4-OPAL2.4.0.tar.gz)

Run it like

> tar -xzf example_4-OPAL2.4.0.tar.gz

> cd example_3/example_sector_ffa

> /path/to/bin/opal VerticalSectorFFA

> cd ..

Here is an example log file:

[log](uploads/e57751e4b1a5d3850002af26c56321c9/log)

To make plots of the field and orbits

> python example_scripts/plot_orbit.py example_vertical_ffa/

Here is the sort of plot you might see:

![opal_example_4_x_y_bz](uploads/ba134f18f376d84077a69226baad9663/opal_example_4_x_y_bz.png)

This shows the field in the vertical direction with the trajectory of the closed orbit superimposed. The lattice is a 10 cell triplet lattice, as described in https://arxiv.org/abs/2011.10783.  Note that at present (Nov 2020), RF acceleration is not supported in VFFAs.

# Old version of the examples
## OPAL 2.4.0
(Plotting scripts used slightly different paths)

## OPAL 2.0.0
[example_1-OPAL2.0.0rc2.tar.gz](uploads/a8bf57ff99e9e95b7b4bdc99b9c29d9c/example_1-OPAL2.0.0rc2.tar.gz) (Tested on OPAL2.0.0rc2)

[example_2-OPAL2.0.0rc2.7z](uploads/00207f6567b458dcc026db5685fb696e/example_2-OPAL2.0.0rc2.7z) (Tested on OPAL2.0.0rc2)

[example_3-OPAL2.0.0rc2.tar.gz](uploads/ffd9fb7728b367535b92f7b1c5fd0c02/example_3-OPAL2.0.0rc2.tar.gz) (Tested on OPAL2.0.0rc2)