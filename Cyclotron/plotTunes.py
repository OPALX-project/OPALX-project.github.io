# plotTunes.py by Chris Cortes
# Adapted for wiki example by Jochem Snuverink

import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np

mpl.rcParams['font.size']               = 12

def main():
    fig, ax = plt.subplots(1)
    tunesOPAL = np.loadtxt("data/tunes.dat",skiprows = 1, unpack =True)
    Nur = tunesOPAL[4]
    Nuz = tunesOPAL[5]
    E   = tunesOPAL[0]
    pco = ax.scatter(Nur,Nuz,c=E,cmap=plt.get_cmap('winter'),marker=".",s=30,label="Closed Orbit Finder")
    cbar = fig.colorbar(pco)
    cbar.set_label("E [MeV]", rotation = 90, labelpad = 15)
    # Add Walkinshaw resonance
    pwr = ax.plot([0,4],[0,2],':',color='black', label = 'Walkinshaw resonance')
    plt.xlabel(r"$\nu_r$")
    plt.ylabel(r"$\nu_z$")
    plt.title("Tune diagram for PSI Ring")
    plt.xlim(1.0,1.8)
    plt.ylim(0.5,1.2)
    # legend order - reorder since for some reason reversed 
    handles,labels = ax.get_legend_handles_labels()
    handles = [handles[1], handles[0]]
    labels  = [ labels[1],  labels[0]]
    plt.legend(handles, labels, loc=0, framealpha=1.0)
    plt.savefig("RingTunes")
    #plt.show()

main()
