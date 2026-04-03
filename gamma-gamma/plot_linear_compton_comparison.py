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
    parser.add_argument('--xi', type=float, default=0.2955)
    parser.add_argument('--cain-sha', default='unknown')
    parser.add_argument('--opalx-sha', default='unknown')
    args = parser.parse_args()

    cain_centers, cain_density = read_histogram(args.cain_csv)
    opalx_centers, opalx_density = read_histogram(args.opalx_csv)

    fig, axis = plt.subplots(figsize=(7.4, 5.0))
    axis.step(cain_centers, cain_density, where='mid', linewidth=1.6, label='CAIN')
    axis.step(opalx_centers, opalx_density, where='mid', linewidth=1.6, label='OPALX')
    axis.set_xlabel(r'$E_\gamma$ [GeV]')
    axis.set_ylabel(r'Normalized density [GeV$^{-1}$]')
    axis.set_title(rf'Weak-field 90 degree linear-Compton spectrum, $\xi={args.xi:.4f}$')
    axis.legend()
    fig.text(0.5,
             0.01,
             f'CAIN {args.cain_sha}   OPALX {args.opalx_sha}',
             ha='center',
             va='bottom',
             fontsize=9)
    fig.tight_layout(rect=(0.0, 0.04, 1.0, 1.0))
    fig.savefig(args.output, dpi=200)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
