#!/usr/bin/env python3
"""Overlay CAIN and OPALX weak-field linear-Compton benchmark histograms."""

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


def labels_for_observable(observable: str):
    if observable == 'theta':
        return {
            'xlabel': r'$\theta_\gamma$ [rad]',
            'ylabel': r'Normalized density [rad$^{-1}$]',
            'title': r'Weak-field 90 degree linear-Compton lab-angle spectrum',
        }
    return {
        'xlabel': r'$E_\gamma$ [GeV]',
        'ylabel': r'Normalized density [GeV$^{-1}$]',
        'title': r'Weak-field 90 degree linear-Compton spectrum',
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('cain_csv', type=Path)
    parser.add_argument('opalx_csv', type=Path,
                        help='Deterministic OPALX benchmark CSV')
    parser.add_argument('--opalx-mc-csv', type=Path,
                        help='Optional sampled OPALX benchmark CSV')
    parser.add_argument('--observable', choices=('energy', 'theta'), default='energy')
    parser.add_argument('--output', type=Path, default=Path('linear-compton-comparison.png'))
    parser.add_argument('--xi', type=float, default=0.2955)
    parser.add_argument('--cain-sha', default='unknown')
    parser.add_argument('--opalx-sha', default='unknown')
    parser.add_argument('--mc-samples', type=int, default=0)
    parser.add_argument('--mc-seed', type=int, default=0)
    args = parser.parse_args()

    cain_centers, cain_density = read_histogram(args.cain_csv)
    opalx_centers, opalx_density = read_histogram(args.opalx_csv)
    labels = labels_for_observable(args.observable)

    fig, axis = plt.subplots(figsize=(7.8, 5.3))
    axis.step(cain_centers, cain_density, where='mid', linewidth=1.8, label='CAIN')
    axis.step(opalx_centers, opalx_density, where='mid', linewidth=1.6, label='OPALX deterministic')

    if args.opalx_mc_csv is not None:
        mc_centers, mc_density = read_histogram(args.opalx_mc_csv)
        label = 'OPALX sampled'
        if args.mc_samples > 0:
            label += f' ({args.mc_samples} samples)'
        axis.step(mc_centers,
                  mc_density,
                  where='mid',
                  linewidth=1.4,
                  linestyle='--',
                  label=label)

    axis.set_xlabel(labels['xlabel'])
    axis.set_ylabel(labels['ylabel'])
    axis.set_title(labels['title'] + rf', $\xi={args.xi:.4f}$')
    axis.legend()

    footer = f'CAIN {args.cain_sha}   OPALX {args.opalx_sha}'
    if args.opalx_mc_csv is not None and args.mc_seed:
        footer += f'   MC seed {args.mc_seed}'
    fig.text(0.5,
             0.01,
             footer,
             ha='center',
             va='bottom',
             fontsize=9)
    fig.tight_layout(rect=(0.0, 0.04, 1.0, 1.0))
    fig.savefig(args.output, dpi=200)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
