# plotTunes.py by Chris Cortes
# Adapted for wiki example by Jochem Snuverink

import matplotlib.pyplot as plt
import numpy as np

def main():
    tunesOPAL = np.loadtxt("data/tunes.dat",skiprows = 1, unpack =True)
    Nur = tunesOPAL[3]
    Nuz = tunesOPAL[4]
    E   = tunesOPAL[0]
    plt.scatter(Nur,Nuz,c=E,cmap=plt.get_cmap('winter'),marker=".",s=30,label="Close Orbit Finder")
    cbar = plt.colorbar()
    cbar.set_label("E [MeV]", rotation = 270)
    plt.xlabel(r"$\nu_r$")
    plt.ylabel(r"$\nu_z$")
    plt.title("Tune diagram for PSI Ring")
    plt.xlim(1.09,1.8)
    plt.ylim(0.65,1.2)
    plt.legend(loc=0)
    plt.savefig("RingTunes")
    #plt.show()

main()
