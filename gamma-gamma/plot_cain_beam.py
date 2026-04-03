#!/usr/bin/env python3
"""Plot and histogram CAIN WRITE BEAM output for the gamma-gamma notes."""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path
import math
import re

import matplotlib.pyplot as plt


@dataclass(frozen=True)
class CainParticle:
    kind: int
    gen: int
    name: str
    wgt: float
    t_m: float
    x_m: float
    y_m: float
    s_m: float
    e_ev: float
    px_evc: float
    py_evc: float
    ps_evc: float
    spin1: float
    spin2: float
    spin3: float


def _parse_fortran_float(token: str) -> float:
    token = token.strip().replace('D', 'E')
    if 'E' not in token and re.search(r'[0-9][+-][0-9]+$', token):
        match = re.search(r'([+-][0-9]+)$', token)
        assert match is not None
        token = token[: match.start()] + 'E' + token[match.start():]
    return float(token)


def parse_cain_beam(path: Path) -> list[CainParticle]:
    particles: list[CainParticle] = []
    with path.open() as stream:
        for line in stream:
            stripped = line.lstrip()
            if not line.strip():
                continue
            if stripped.startswith('END'):
                break
            if stripped.startswith('!'):
                continue

            parts = line.split()
            if len(parts) < 14 or not parts[0].lstrip('-').isdigit():
                continue

            values = [_parse_fortran_float(token) for token in parts[2:14]]
            particles.append(
                CainParticle(
                    kind=int(parts[0]),
                    gen=int(parts[1]),
                    name='',
                    wgt=values[0],
                    t_m=values[1],
                    x_m=values[2],
                    y_m=values[3],
                    s_m=values[4],
                    e_ev=values[5],
                    px_evc=values[6],
                    py_evc=values[7],
                    ps_evc=values[8],
                    spin1=values[9],
                    spin2=values[10],
                    spin3=values[11],
                )
            )
    return particles


def build_histogram(values: list[float], weights: list[float], bins: int,
                    vmin: float, vmax: float) -> tuple[list[float], list[float], list[float]]:
    width = (vmax - vmin) / bins
    counts = [0.0] * bins
    centers = [vmin + (i + 0.5) * width for i in range(bins)]
    for value, weight in zip(values, weights):
        if value < vmin or value >= vmax:
            continue
        index = int((value - vmin) / width)
        if 0 <= index < bins:
            counts[index] += weight
    total = sum(counts)
    density = [count / (total * width) if total > 0.0 else 0.0 for count in counts]
    return centers, density, counts


def write_histogram_csv(path: Path, centers: list[float], density: list[float],
                        counts: list[float], observable: str) -> None:
    if observable == 'theta':
        header = '# center_rad,density_per_rad,count\n'
    else:
        header = '# center_GeV,density_per_GeV,count\n'

    with path.open('w') as stream:
        stream.write(header)
        for center, dens, count in zip(centers, density, counts):
            stream.write(f'{center:.17g},{dens:.17g},{count:.17g}\n')


def photon_energy_gev(photon: CainParticle) -> float:
    return photon.e_ev * 1.0e-9


def photon_theta_rad(photon: CainParticle) -> float:
    transverse = math.hypot(photon.px_evc, photon.py_evc)
    return math.atan2(transverse, photon.ps_evc)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('beam_file', type=Path, help='CAIN WRITE BEAM output file')
    parser.add_argument('--observable', choices=('energy', 'theta'), default='energy')
    parser.add_argument('--output', type=Path, default=Path('cain_photon_spectrum.png'))
    parser.add_argument('--csv-output', type=Path, default=None)
    parser.add_argument('--bins', type=int, default=80)
    parser.add_argument('--emin', type=float, default=0.0)
    parser.add_argument('--emax', type=float, default=0.01)
    parser.add_argument('--tmin', type=float, default=0.0)
    parser.add_argument('--tmax', type=float, default=0.02)
    args = parser.parse_args()

    particles = parse_cain_beam(args.beam_file)
    photons = [particle for particle in particles if particle.kind == 1]
    if not photons:
        raise SystemExit(f'No photons found in {args.beam_file}')

    weights = [particle.wgt for particle in photons]
    if args.observable == 'theta':
        values = [photon_theta_rad(photon) for photon in photons]
        centers, density, counts = build_histogram(values, weights, args.bins, args.tmin, args.tmax)
        xlabel = r'$\theta_\gamma$ [rad]'
        ylabel = r'Normalized density [rad$^{-1}$]'
        title = 'CAIN photon angular spectrum'
    else:
        values = [photon_energy_gev(photon) for photon in photons]
        centers, density, counts = build_histogram(values, weights, args.bins, args.emin, args.emax)
        xlabel = r'$E_\gamma$ [GeV]'
        ylabel = r'Normalized density [GeV$^{-1}$]'
        title = 'CAIN photon spectrum'

    fig, axis = plt.subplots(figsize=(7.0, 4.5))
    axis.step(centers, density, where='mid', linewidth=1.6, label='CAIN')
    axis.set_xlabel(xlabel)
    axis.set_ylabel(ylabel)
    axis.set_title(title)
    axis.legend()
    fig.tight_layout()
    fig.savefig(args.output, dpi=200)

    if args.csv_output is not None:
        write_histogram_csv(args.csv_output, centers, density, counts, args.observable)

    return 0


if __name__ == '__main__':
    raise SystemExit(main())
