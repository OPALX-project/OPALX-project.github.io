HEADER 'Linear Compton 90 degree weak-field benchmark';
!!
!! CAIN reference deck for the OPALX fixed-geometry linear Compton benchmark.
!! Final weak-field settings:
!!   - electron total energy: 1 GeV
!!   - laser wavelength: 1030 nm
!!   - crossing angle: 90 degree
!!   - Xi = 0.2955 (< 0.3)
!!   - single-electron geometry: zero emittance and zero bunch length
!!   - about 1.17e4 photons in the CAIN reference run
!!
ALLOCATE MP=1350000;

SET photon=1, electron=2, positron=3,
    mm=1e-3, micron=1e-6, nm=1e-9, psec=1e-12*Cvel;

SET ee=1.0D9, an=9.0D5,
    sigz=0.0,
    betax=1.0*mm, betay=1.0*mm,
    emitx=0.0, emity=0.0,
    sige=0.0,
    ntcut=3.0;

SET laserwl=1030*nm,
    rlx=50*micron, rly=50*micron,
    sigt=1.0*psec,
    pulseE=2.9D-2;

!! CAIN expects peak power density rather than pulse energy directly.
SET powerd=pulseE/[sigt*laserwl*Sqrt(rlx*rly)/(4*Cvel)];

SET MsgLevel=1;

BEAM RIGHT, KIND=electron, NP=900000, AN=an, E0=ee,
     TXYS=(0,0,0,0), GCUTT=ntcut,
     BETA=(betax,betay), EMIT=(emitx,emity), SIGT=sigz, SIGE=sige;

LASER LEFT, WAVEL=laserwl, POWERD=powerd,
       TXYS=(0,0,0,0),
       E3=(1,0,0), E1=(0,1,0),
       RAYLEIGH=(rlx,rly), SIGT=sigt, GCUTT=ntcut, STOKES=(0,0,0);

LASERQED COMPTON, NPH=0, ENHANCE=1, PMAX=0.5;

SET MsgLevel=0; FLAG OFF ECHO;
SET it=0;
PUSH Time=(-ntcut*(sigt+sigz),ntcut*(sigt+sigz),600);
     IF Mod(it,50)=0;
       PRINT it, FORMAT=(F6.0,'-th time step');
       PRINT STAT, SHORT;
     ENDIF;
     SET it=it+1;
ENDPUSH;

DRIFT S=0.05;
WRITE BEAM, KIND=photon, FILE='cain-linear-compton-90deg-xi029.dat';

PRINT STAT;
STOP;
END;
