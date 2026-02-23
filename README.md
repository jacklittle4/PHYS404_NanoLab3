# PHYS404 Nano Lab 3

Analysis files for **Task B** and **Task C** of the acousto-optic modulator (AOM) lab.

## Repository contents

- `task_b_deflection_fit.wl`
  Final Wolfram Language script for Task B (deflection angle vs RF frequency).
- `task_c_efficiency_fit.wl`
  Final Wolfram Language script for Task C (diffraction efficiency vs RF power).
- `aom_efficiency_fit.wl`
  Compatibility wrapper that runs Task C.
- `LAB_REPORT_TASK_BC.md`
  Cleaned lab-report text for Task B and Task C.
- `PHYS404-Lab3-Little.nb`
  Original notebook used during lab development.
- `LICENSE`
  MIT License.
- `.gitignore`
  Ignore rules for Wolfram/editor temporary files.

## Task B model

For Bragg diffraction in an AOM,

\[
\theta \approx \frac{\lambda f_{RF}}{v_{ac}}
\]

The script performs two fits:
1. \(\theta = mf + b\)
2. \(\theta = mf\) (forced through origin)

Then computes acoustic velocity from \(v_{ac} = \lambda/m\).

## Task C model

At fixed RF frequency (80 MHz), diffraction efficiency is modeled as:

\[
\eta(P_{RF}) = \eta_0 + A\sin^2\left(\frac{\pi}{2}\sqrt{\frac{P_{RF}}{P_\pi}}\right)
\]

The script estimates \(P_\pi\), \(\eta_0\), \(A\), and \(R^2\).

## How to run

From Mathematica/Wolfram Engine:

- Run Task B: `Get["task_b_deflection_fit.wl"]`
- Run Task C: `Get["task_c_efficiency_fit.wl"]`

Each script prints fitted parameters and displays the corresponding plot.
