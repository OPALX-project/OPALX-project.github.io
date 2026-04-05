#!/usr/bin/env python3
"""Overlay CAIN and OPALX weak-field linear-Compton benchmark histograms."""

from __future__ import annotations

import argparse
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


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


def read_joint_histogram(path: Path):
    rows = []
    energy_centers = []
    theta_centers = []
    for line in path.read_text().splitlines():
        if not line or line.startswith('#'):
            continue
        energy_center, theta_center, density, *_ = line.split(',')
        energy = float(energy_center)
        theta = float(theta_center)
        rows.append((energy, theta, float(density)))
        if energy not in energy_centers:
            energy_centers.append(energy)
        if theta not in theta_centers:
            theta_centers.append(theta)

    data = np.zeros((len(energy_centers), len(theta_centers)))
    eindex = {value: i for i, value in enumerate(energy_centers)}
    tindex = {value: j for j, value in enumerate(theta_centers)}
    for energy, theta, density in rows:
        data[eindex[energy], tindex[theta]] = density
    return np.array(energy_centers), np.array(theta_centers), data


def labels_for_observable(observable: str):
    if observable == 'theta':
        return {
            'xlabel': r'$\theta_\gamma$ [rad]',
            'ylabel': r'Normalized density [rad$^{-1}$]',
        }
    if observable == 'joint':
        return {
            'xlabel': r'$\theta_\gamma$ [rad]',
            'ylabel': r'$E_\gamma$ [GeV]',
            'colorbar': r'Normalized density [GeV$^{-1}$ rad$^{-1}$]',
        }
    return {
        'xlabel': r'$E_\gamma$ [GeV]',
        'ylabel': r'Normalized density [GeV$^{-1}$]',
    }


def plot_joint(args):
    cain_e, cain_t, cain_data = read_joint_histogram(args.cain_csv)
    opalx_e, opalx_t, opalx_data = read_joint_histogram(args.opalx_csv)
    panels = [(f'CAIN {args.cain_sha}', cain_data), (f'OPALX det {args.opalx_sha}', opalx_data)]
    if args.opalx_mc_csv is not None:
        mc_e, mc_t, mc_data = read_joint_histogram(args.opalx_mc_csv)
        if not (np.array_equal(cain_e, mc_e) and np.array_equal(cain_t, mc_t)):
            raise RuntimeError('Joint MC histogram grid does not match CAIN grid.')
        panels.append((f'OPALX MC {args.opalx_sha}', mc_data))

    if not (np.array_equal(cain_e, opalx_e) and np.array_equal(cain_t, opalx_t)):
        raise RuntimeError('Joint deterministic histogram grid does not match CAIN grid.')

    labels = labels_for_observable('joint')
    vmax = max(np.max(data) for _, data in panels)
    fig, axes = plt.subplots(1, len(panels), figsize=(5.2 * len(panels), 4.8), sharex=True, sharey=True)
    if len(panels) == 1:
        axes = [axes]
    images = []
    extent = (cain_t[0], cain_t[-1], cain_e[0], cain_e[-1])
    for axis, (panel_label, data) in zip(axes, panels):
        image = axis.imshow(data,
                            origin='lower',
                            aspect='auto',
                            extent=extent,
                            interpolation='nearest',
                            vmin=0.0,
                            vmax=vmax)
        axis.text(0.02, 0.98, panel_label, transform=axis.transAxes,
                  ha='left', va='top', fontsize=9,
                  bbox=dict(boxstyle='round,pad=0.25', facecolor='white', alpha=0.85, edgecolor='none'))
        axis.set_xlabel(labels['xlabel'])
        images.append(image)
    axes[0].set_ylabel(labels['ylabel'])
    colorbar = fig.colorbar(images[-1], ax=axes, shrink=0.95)
    colorbar.set_label(labels['colorbar'])
    fig.savefig(args.output, dpi=200)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('cain_csv', type=Path)
    parser.add_argument('opalx_csv', type=Path,
                        help='Deterministic OPALX benchmark CSV')
    parser.add_argument('--opalx-mc-csv', type=Path,
                        help='Optional sampled OPALX benchmark CSV')
    parser.add_argument('--observable', choices=('energy', 'theta', 'joint'), default='energy')
    parser.add_argument('--output', type=Path, default=Path('linear-compton-comparison.png'))
    parser.add_argument('--xi', type=float, default=0.2955)
    parser.add_argument('--cain-sha', default='unknown')
    parser.add_argument('--opalx-sha', default='unknown')
    parser.add_argument('--mc-samples', type=int, default=0)
    parser.add_argument('--mc-seed', type=int, default=0)
    args = parser.parse_args()

    if args.observable == 'joint':
        plot_joint(args)
        return 0

    cain_centers, cain_density = read_histogram(args.cain_csv)
    opalx_centers, opalx_density = read_histogram(args.opalx_csv)
    labels = labels_for_observable(args.observable)

    fig, axis = plt.subplots(figsize=(7.8, 5.3))
    axis.step(cain_centers, cain_density, where='mid', linewidth=1.8, label=f'CAIN {args.cain_sha}')
    axis.step(opalx_centers, opalx_density, where='mid', linewidth=1.6, label=f'OPALX det {args.opalx_sha}')

    if args.opalx_mc_csv is not None:
        mc_centers, mc_density = read_histogram(args.opalx_mc_csv)
        label = f'OPALX MC {args.opalx_sha}'
        axis.step(mc_centers,
                  mc_density,
                  where='mid',
                  linewidth=1.4,
                  linestyle='--',
                  label=label)

    axis.set_xlabel(labels['xlabel'])
    axis.set_ylabel(labels['ylabel'])
    axis.legend()
    fig.tight_layout()
    fig.savefig(args.output, dpi=200)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
