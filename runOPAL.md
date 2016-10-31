# Obtain runOpal.py

Clone runOpal.py  from [here](https://gitlab.psi.ch/OPAL/runOPAL)

# HowTo Use runOpal.py
In order to use *runOpal.py* you have to provide two
files, a template file *foo.tmpl*,  and a data file *foo.data*.
The template file will be stored in the directory *tmpl*.
In the data file, symbols and values will be defined, which will be
replaced in the template file by the *runOPAL.py* script. A symbol in the data file maybe looks like **CHARGE**, the corresponding 
symbol in the template file will look like **\_CHARGE\_**. 

# Recognized Environment Variables by  *runOPAL.py*

There are 5 environment variables recognized by the *runOPAL.py*:
   1. *TEMPLATES*
   2. *FIELDMAPS*
   3. *OPAL_EXE_PATH*
   4. *SGE_QUEUE*
   5. *SGE_RAM*

In Bash parlance:

`export TEMPLATES=$PWD/tmpl/`

`export FIELDMAPS=$PWD/fieldmaps/`
 
`export OPAL_EXE_PATH=/gpfs/home/adelmann/build/opal-1.2.0/src/`

`export SGE_QUEUE=all.q`

 `export SGE_RAM=8`


Make sure the `OPAL_EXE_PATH` is set correctly. This is automatically done when using modules on Merlin, otherwise 
you need to set it accordingly. 

From the TEMPLATES directory the *foo.tmpl* file is taken and the values are replaced. 

The field maps from the *FIELDMAPS* directory are linked to the directory where the simulation is executed. 


*SGE_QUEUE* is the queue used for the simulation. Different queues may have different numbers of nodes and CPU's available as well as different run-time limitations.

*SGE_RAM* contains the number of GB of RAM that each CPU will allocate (if not specified, default is 4). If there is not enough memory available on one node, the node will not  be fully loaded. Instead the number of CPU's will be distributed on as many nodes as needed to fulfil the RAM requirement. Merlin has nodes with 64 and 128 GB of RAM. Each node has 16 CPU's.


# This is a snippet of a data and tmpl file (*foo.data*)

`Q         -1                   # the charge`

`NPART 100000     # the number of simulation particles `
 
 `CORES   2               # how many cores are used by OPAL `

Caution, in the data file, no blank lines are allowed. If you specify negative values, do not put a space between the 
# This is a snippet of a data and tmpl file (*foo.tmpl*)

The corresponding part of the template (*foo.tmpl*) file would look like:

`beam1: BEAM, PARTICLE=ELECTRON, pc=P0, NPART=_NPART_, BFREQ=BFREQ, BCURRENT=BCURRENT, CHARGE=_Q_;`

# Running runOPAL.py
You can run the *runOPAL.py* script without arguments, if the two files (*foo.tmpl* and *foo.data*) are present, a directory *foo* will be
created and all files for the simulation are either copied or linked to that directory. The simulation is then started from this directory
where also all results are stored. The general syntax of runOPAL.py is

`runOPAL.py [--restart-file=FILE [--restart-step=STEPNR | --restart-pos=POS]] [--help] [--test] [--block] [--keep] [--nobatch] [ATTR=SCANVALUE] {[ATTR=VALUE]}`
 * *--help* shows all available parameters with a short description
  * *--test* exercises everything except for the submission of the job.
  * *--restart-pos* specifies the position (in meter) defining the restart of the simulation. If no data has been dumped at that position *runOpal* will use the nearest position stored in the restart file as restart position. 
  * *--restart-step* specifies the restart step of the simulation.
  * *--block* runs opal local not using the batch system and waits until the job is done.
  * *--keep* if same simulation has been run before, keep old data and abort.
  * *--nobatch* uses plain mpirun on the local machine.
  * *ATTR* refers to a name in the data file
  * *SCANVALUE* start\:end\:step, scans a parameter space, e.g., *TFWHM=0.85:0.90:0.01*. 


# Example 1: Regular Run

dude:foo adelmann$ source setup.sh
dude:foo adelmann$ runOPAL.py --test
Simulation directory is foo using OPAL at  /gpfs/home/adelmann/build/opal-1.2.0/src/
Using templatefile at /Users/adelmann/foo/tmpl/ using fieldmaps at /Users/adelmann/foo/fieldmaps/ 

Parameter set in foo.in are:
 :::: NPART= 1000
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
 :::: EDES= 0.250
Done with setup of the OPAL simulation but not submitting the job (--test) 
*
After that you will have a directory foo with this content:
*
dude:foo adelmann$ ls
fieldmaps   foo     foo.data    setup.sh    tmpl

dude:foo adelmann$ ls foo
foo.in run.sge
*

'''Note''': is setup.sh is available and executable you do not have to source it.

# Example 2: 1D Parmeter Scan ==

`runOPAL.py --test EDES=0.050:0.250:0.050`
...
dude:foo adelmann$ ls
fieldmaps           foo.data        foo_EDES=0.05:0.25:0.05      setup.sh       tmpl

dude:foo adelmann$ ls foo_EDES=0.05:0.25:0.05    
fooEDES=0.05    fooEDES=0.1 fooEDES=0.15    fooEDES=0.2 fooEDES=0.25


# Example 3: 2D Parmeter Scan ==

`runOPAL.py --test EDES=0.050:0.250:0.050 POS1=0.4:0.5:0.01`

dude:foo adelmann$ ls
fieldmaps       foo.data           foo_EDES=0.05:0.25:0.05_POS1=0.4:0.5:0.01      setup.sh  tmpl


dude:foo adelmann$ ls foo_EDES=0.05:0.25:0.05_POS1=0.4:0.5:0.01
fooEDES=0.05POS1=0.4    fooEDES=0.05POS1=0.45   fooEDES=0.15POS1=0.4    fooEDES=0.15POS1=0.45   fooEDES=0.1POS1=0.4 fooEDES=0.1POS1=0.45    fooEDES=0.25POS1=0.4    fooEDES=0.25POS1=0.45   fooEDES=0.2POS1=0.4 fooEDES=0.2POS1=0.45
fooEDES=0.05POS1=0.41   fooEDES=0.05POS1=0.46   fooEDES=0.15POS1=0.41   fooEDES=0.15POS1=0.46   fooEDES=0.1POS1=0.41    fooEDES=0.1POS1=0.46    fooEDES=0.25POS1=0.41   fooEDES=0.25POS1=0.46   fooEDES=0.2POS1=0.41    fooEDES=0.2POS1=0.46
fooEDES=0.05POS1=0.42   fooEDES=0.05POS1=0.47   fooEDES=0.15POS1=0.42   fooEDES=0.15POS1=0.47   fooEDES=0.1POS1=0.42    fooEDES=0.1POS1=0.47    fooEDES=0.25POS1=0.42   fooEDES=0.25POS1=0.47   fooEDES=0.2POS1=0.42    fooEDES=0.2POS1=0.47
fooEDES=0.05POS1=0.43   fooEDES=0.05POS1=0.48   fooEDES=0.15POS1=0.43   fooEDES=0.15POS1=0.48   fooEDES=0.1POS1=0.43    fooEDES=0.1POS1=0.48    fooEDES=0.25POS1=0.43   fooEDES=0.25POS1=0.48   fooEDES=0.2POS1=0.43    fooEDES=0.2POS1=0.48
fooEDES=0.05POS1=0.44   fooEDES=0.05POS1=0.49   fooEDES=0.15POS1=0.44   fooEDES=0.15POS1=0.49   fooEDES=0.1POS1=0.44    fooEDES=0.1POS1=0.49    fooEDES=0.25POS1=0.44   fooEDES=0.25POS1=0.49   fooEDES=0.2POS1=0.44    fooEDES=0.2POS1=0.49


*


== Run a Restart ==

In this particular example we assume that a simulation called  ''Phase3'' has successfully been executed. The output of the simulation is located
at */gpfs/homefelsim/adelmann/Phase3/FinPhase3/*.

A restart simulation starting from ''step=10'' until ''ZSTOP=13.1'' m would then look like:

*
  runOPAL.py --restart-file=/gpfs/homefelsim/adelmann/Phase3/FinPhase3/FinPhase3.h5 --restart-step=10 ZSTOP=13.1
*


In this example instead of a restart step, a restart position is specified.

*
  runOPAL.py --restart-file=/gpfs/homefelsim/adelmann/Phase3/FinPhase3/FinPhase3.h5 --restart-pos=10.0 ZSTOP=13.1
*

If there exists no phase space dump at the specified position (10.0 meters here), the nearest position will be located and used.


== CAVE: At the moment restart is only possible from the last step dumped in the .h5 file. Also, be careful to use the number of dumps with --restart-step, not the actual number of steps (i.e. if in the original run you used PSDUMPFREQU = 10, you will get 10 dumps per 100 steps. to restart from STEP 100 you will write --restart-step=10).