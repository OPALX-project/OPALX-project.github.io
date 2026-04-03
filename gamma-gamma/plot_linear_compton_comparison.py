#!/usr/bin/env python3
"""Overlay CAIN and OPALX weak-field linear-Compton spectra."""

from __future__ import annotations

import argparse
from pathlib import Path

import matplotlib.pyplot as plt


def read_histogram(path: Path):
    centers = []
    density = []
    for line in path.read_text().splitlines():
        if not line or line.startswith('#'):
            continue
        center, dens, *_ = line.split(',')
        centers.append(float(center))
        density.append(float(dens))
    return centers, density


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('cain_csv', type=Path)
    parser.add_argument('opalx_csv', type=Path)
    parser.add_argument('--output', type=Path, default=Path('linear-compton-comparison.png'))
    args = parser.parse_args()

    cain_centers, cain_density = read_histogram(args.cain_csv)
    opalx_centers, opalx_density = read_histogram(args.opalx_csv)

    fig, axis = plt.subplots(figsize=(7.0, 4.5))
    axis.step(cain_centers, cain_density, where='mid', linewidth=1.6, label='CAIN')
    axis.step(opalx_centers, opalx_density, where='mid', linewidth=1.6, label='OPALX')
    axis.set_xlabel(r'$E_\gamma$ [GeV]')
    axis.set_ylabel(r'Normalized density [GeV$^{-1}$]')
    axis.set_title('Weak-field 90 degree linear-Compton spectrum')
    axis.legend()
    fig.tight_layout()
    fig.savefig(args.output, dpi=200)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
