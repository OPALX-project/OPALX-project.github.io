# Obtain runOPAL.py

Clone runOPAL.py  from [here](https://gitlab.psi.ch/OPAL/runOPAL).

# HowTo Use runOPAL.py
In order to use *runOPAL.py* you have to provide two
files, a template file *foo.tmpl*,  and a data file *foo.data*.
The template file will be stored in the directory *tmpl*.
In the data file, symbols and values will be defined, which will be
replaced in the template file by the *runOPAL.py* script. A symbol in the data file maybe looks like **CHARGE**, the corresponding 
symbol in the template file will look like **\_CHARGE\_**. 

![runopal-1](/uploads/65201f411b24ff56fab3384e1368b73e/runopal-1.png)

# Recognized Environment Variables by  *runOPAL.py*

The following environment variables recognized by the *runOPAL.py*:
   1. *DISTRIBUTIONS*
   2. *TEMPLATES*
   3. *FIELDMAPS*
   4. *OPTIMIZER*
   5. *OPAL_EXE_PATH*
   6. *QUEUE*
   7. *RAM*
   8. *TIME*

In Bash parlance:

```bash
#export OPTIMIZER=$PWD/tmpl_opt/
export TEMPLATES=$PWD/tmpl/
export FIELDMAPS=$PWD/fieldmaps/
export OPAL_EXE_PATH=/gpfs/home/adelmann/build/opal-1.2.0/src/
export QUEUE=all.q
export RAM=8
```

Make sure the `OPAL_EXE_PATH` is set correctly. This is automatically done when using modules on Merlin, otherwise you need to set it accordingly. 

If no OPTIMIZER directory is set, then runOPAL runs regular simulation by default: the *foo.tmpl* file is taken from the TEMPLATES directory and the values are replaced using *foo.data* file in the working directory. If OPTIMIZER directory is set in the environment (and no *--noopt*), runOPAL runs optimization job (see Example 4).

The field maps from the *FIELDMAPS* directory and the distributions from the *DISTRIBUTIONS* directory are linked to the directory where the simulation is executed. 

*QUEUE* is the queue used for the simulation. Different queues may have different numbers of nodes and CPU's available as well as different run-time limitations.

*RAM* contains the number of GB of RAM that each CPU will allocate (if not specified, default is 4). If there is not enough memory available on one node, the node will not  be fully loaded. Instead the number of CPU's will be distributed on as many nodes as needed to fulfil the RAM requirement. Merlin has nodes with 64 and 128 GB of RAM. Each node has 16 CPU's.


# Recognized host names

The following clusters and supercomputers are recognised for which batch jobs are setup automatically:

* PSI Merlin cluster
* ANL Theta
* ANL Blues
* ANL Bebop
* NERSC Cori Haswell
* NERSC Edison
* CSCS Piz-Daint
* MIT Engaging cluster

Please open an [issue](https://gitlab.psi.ch/OPAL/runOPAL/issues) for adding additional clusters.

# This is a snippet of a data and tmpl file (*foo.data*)
```
Q      -1       # the charge
NPART  100000   # the number of simulation particles
CORES  2        # how many cores are used by OPAL
```

Caution, in the data file, no blank lines are allowed. If you specify negative values, do not put a space between the 

The corresponding part of the template (*foo.tmpl*) file would look like:

`beam1: BEAM, PARTICLE=ELECTRON, pc=P0, NPART=_NPART_, CHARGE=_Q_ ... ;`

# Running runOPAL.py
You can run the *runOPAL.py* script without arguments, if the two files (*foo.tmpl* and *foo.data*) are present, a directory *foo* will be
created and all files for the simulation are either copied or linked to that directory. The simulation is then started from this directory
where also all results are stored. The general syntax of runOPAL.py is

`runOPAL.py [--help] [--filename=str] [--test] [--quiet] [--info=num] [--test] [--keep] [--queue=qname] [--hypert=num] [--nobatch] [ATTR=SCANVALUE] {[ATTR=VALUE]}`
 * *--help* shows all available parameters with a short description.
 * *--filename=str* (or *-f*) sets base falie name for both *.data and *.tmpl files.
 * *--test* or (*-t*) exercises everything except for the submission of the job.
 * *--keep* if same simulation has been run before, keep old data and abort.
 * *--quiet* suppress debug printout.
 * *--info=num* (or *-i*) steers the std-output of OPAL. The range is 0 < num < 6 (default), from minimal to maximum output.
 * *--nobatch* run opal locally not using the batch system and waits until the job is done.
 * *--noopt* ignore optimization template (if any) and perform regular simulation.
 * *--queue=qname* defines in which queue the job goes. Overwrites QUEUE
 * *--hypert=num* defines the number of Hyper-Threads used. Default 0.
 * *ATTR* refers to a name in the data file
 * *SCANVALUE* `start:end:step`, scans a parameter space, e.g., *TFWHM=0.85:0.90:0.01*. 

# Example 1: Regular Run

```
dude:foo adelmann$ source setup.sh
dude:foo adelmann$ runOPAL.py --test
```

Simulation directory is foo using OPAL at  /gpfs/home/adelmann/build/opal-1.2.0/src/
Using templatefile at /Users/adelmann/foo/tmpl/ using fieldmaps at /Users/adelmann/foo/fieldmaps/ 

Parameter set in foo.in are:

`:::: NPART= 1000
 :::: K3= -17.18
 :::: K2= 15.13
 :::: K1= -15.34
 :::: CORES= 1
 :::: DT= 1.0e-12
 :::: CORRY= 0.0
 :::: CORRX= 0.0
 :::: BL1= 0.20
 :::: BL2= 0.20
 :::: MPOS2= 2.5
 :::: MPOS1= 0.018
 :::: MAXSTEPS= 1000000
 :::: ZSIZE1= 0.1044
 :::: ZSIZE2= 0.06065
 :::: POS2= 1.0404
 :::: POS3= 1.6564
 :::: norm= 1.16
 :::: POS1= 0.4244
 :::: ZSTOP= 3.0
 :::: PSDUMPFREQ= 100
 :::: L2= 0.395
 :::: L3= 0.395
 :::: L1= 0.395
 :::: SIGY= 0.0
 :::: SIGX= 0.0
 :::: SIGPX= 0.0
 :::: SIGPY= 0.0
 :::: DPOS2= 2.32
 :::: DPOS1= 0.02
 :::: EDES= 0.250`

`Done with setup of the OPAL simulation but not submitting the job (--test) `

After that you will have a directory foo with this content:

```
dude:foo adelmann$ ls

fieldmaps   foo     foo.data    setup.sh    tmpl
```

```
dude:foo adelmann$ ls foo

foo.in run.sge
```


# Example 2: 1D Parameter Scan

`runOPAL.py --test EDES=0.050:0.250:0.050`

```
dude:foo adelmann$ ls

fieldmaps           foo.data        **foo_EDES=0.05:0.25:0.05**      setup.sh       tmpl
```

```
dude:foo adelmann$ ls foo_EDES=0.05:0.25:0.05    

fooEDES=0.05    fooEDES=0.1 fooEDES=0.15    fooEDES=0.2 fooEDES=0.25
```

# Example 3: 2D Parameter Scan

`runOPAL.py --test EDES=0.050:0.250:0.050 POS1=0.4:0.5:0.01`

```
dude:foo adelmann$ ls

fieldmaps       foo.data          foo_EDES=0.05:0.25:0.05_POS1=0.4:0.5:0.01      setup.sh  tmpl
```

```
dude:foo adelmann$ ls foo_EDES=0.05:0.25:0.05_POS1=0.4:0.5:0.01

fooEDES=0.05POS1=0.4    fooEDES=0.05POS1=0.45   fooEDES=0.15POS1=0.4    fooEDES=0.15POS1=0.45   fooEDES=0.1POS1=0.4     fooEDES=0.1POS1=0.45    fooEDES=0.25POS1=0.4    fooEDES=0.25POS1=0.45   fooEDES=0.2POS1=0.4 
fooEDES=0.2POS1=0.45
fooEDES=0.05POS1=0.41   fooEDES=0.05POS1=0.46   fooEDES=0.15POS1=0.41   fooEDES=0.15POS1=0.46   fooEDES=0.1POS1=0.41    fooEDES=0.1POS1=0.46    fooEDES=0.25POS1=0.41   fooEDES=0.25POS1=0.46   fooEDES=0.2POS1=0.41    fooEDES=0.2POS1=0.46
fooEDES=0.05POS1=0.42   fooEDES=0.05POS1=0.47   fooEDES=0.15POS1=0.42   fooEDES=0.15POS1=0.47   fooEDES=0.1POS1=0.42    fooEDES=0.1POS1=0.47    fooEDES=0.25POS1=0.42   fooEDES=0.25POS1=0.47   fooEDES=0.2POS1=0.42    fooEDES=0.2POS1=0.47
fooEDES=0.05POS1=0.43   fooEDES=0.05POS1=0.48   fooEDES=0.15POS1=0.43   fooEDES=0.15POS1=0.48   fooEDES=0.1POS1=0.43    fooEDES=0.1POS1=0.48    fooEDES=0.25POS1=0.43   fooEDES=0.25POS1=0.48   fooEDES=0.2POS1=0.43    fooEDES=0.2POS1=0.48
fooEDES=0.05POS1=0.44   fooEDES=0.05POS1=0.49   fooEDES=0.15POS1=0.44   fooEDES=0.15POS1=0.49   fooEDES=0.1POS1=0.44    fooEDES=0.1POS1=0.49    fooEDES=0.25POS1=0.44   fooEDES=0.25POS1=0.49   fooEDES=0.2POS1=0.44    fooEDES=0.2POS1=0.49
```


# Example 4: Optimization Run

Optimizer and template *\*.tmpl* files should be located in OPTIMIZER and TEMPLATES directories,
respectively, while their *\*.data* files should be located in the working directory.
Note that if *--filename* is not specified, runOPAL will try to guess which *.tmpl* file to use as input;
if OPTIMIZER directory is unknown, runOPAL would attempt regular simulation run.
More information on optimizer can be found in the [manual](http://amas.web.psi.ch/opal/Documentation/2.2/OPAL_Manual.html#chp.optimiser).

For instance, optimization for RF cavity phases with respect to maximum energy would be organized as follows.

```
dude:foo nastya$ ls
cyclotron.data      setenv.sh  tmpl_opt
cyclotron_opt.data  tmpl
dude:foo nastya$ ls tmpl/
cyclotron.tmpl
dude:foo nastya$ ls tmpl_opt/
cyclotron_opt.tmpl
```

Where *cyclotron_opt.tmpl* file sets up the optimization run:

```
OPTION, ECHO=FALSE;
OPTION, INFO=TRUE;

phi0:  DVAR, VARIABLE="PHI0",  LOWERBOUND=-180, UPPERBOUND=180; // phase of the first cavity
theta: DVAR, VARIABLE="THETA", LOWERBOUND=0, UPPERBOUND=45; // angle of between cavities

energy: OBJECTIVE, EXPR="-statVariableAt('energy',600.0)";

opt: OPTIMIZE, INPUT=_INPUT_,
        OUTPUT="cyclotron_optimized", OUTDIR="results",
        OBJECTIVES = {energy}, DVARS = {phi0, theta},
        INITIALPOPULATION=10, NUM_MASTERS=1, NUM_COWORKERS=1,
        NUM_IND_GEN=10, MAXGENERATIONS=20,
        SIMTMPDIR="simtmpdir",
        TEMPLATEDIR=_TEMPLATEDIR_,
        FIELDMAPDIR=_FIELDMAPDIR_;

QUIT;
```

And variables set in *cyclotron_opt.data* are:

```
CORES          8
INPUT          "tmpl/cyclotron.tmpl"
FIELDMAPDIR    "."
TEMPLATEDIR    "tmpl"
```