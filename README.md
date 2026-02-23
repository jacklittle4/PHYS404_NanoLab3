# PHYS404 Nano Lab 3 — Acousto-Optic Modulator (AOM)

This repository contains Wolfram Mathematica / Wolfram Language analysis and supporting materials for

• Task B — Deflection Angle vs RF Frequency  
• Task C — Diffraction Efficiency vs RF Power  

Course: PHYS404 (Advanced Nanophysics Lab)

---

## Repository Structure

- originalTaskB.nb  
  Original Mathematica notebook framework for Task B (Bragg geometry and linear fitting workflow).

- LabReport_BC  
  Final written lab report for Tasks B and C.

- task_b_deflection_fit.wl  
  Final Wolfram Language script for extracting acoustic velocity from deflection angle data.

- task_c_efficiency_fit.wl  
  Final Wolfram Language script for nonlinear fitting of diffraction efficiency.

- aom_efficiency_fit.wl  
  Earlier refinement script used for efficiency model testing.

---

# Task B — Deflection Angle vs RF Frequency

In the Bragg regime, the angular separation between the 0th and 1st diffraction orders follows:

θ = (λ fRF) / vac

Where:

- θ = measured deflection angle  
- λ = laser wavelength (632.8 nm)  
- fRF = applied RF frequency  
- vac = acoustic velocity in the crystal  

Since:

θ = m fRF

The acoustic velocity is obtained from the slope:

vac = λ / m

Two fits were performed:

• Linear fit with intercept  
• Linear fit forced through origin (physically consistent since θ = 0 when fRF = 0)

This analysis is implemented in:

task_b_deflection_fit.wl

---

# Task C — Diffraction Efficiency vs RF Power

Diffraction efficiency is defined as:

η = P₁st / Ptotal  
Ptotal = P₀th + P₁st

RF power is calculated using a 50 Ω load:

VRMS = Vpp / (2√2)  
PRF = VRMS² / 50

In the Bragg regime, diffraction efficiency follows:

η(PRF) = sin²[(π/2) √(PRF / Pπ)]

Where:

- PRF = applied RF power  
- Pπ = characteristic π-power (fit parameter)

The nonlinear regression extracts:

• π-power (Pπ)  
• amplitude scaling factor  
• baseline offset  
• R² fit quality  

Implemented in:

task_c_efficiency_fit.wl

---

# How to Run

Open Wolfram Mathematica (or Wolfram Engine), set the working directory to this repository, and run:

Get["task_b_deflection_fit.wl"]
Get["task_c_efficiency_fit.wl"]

Each script:

• Imports experimental data  
• Performs regression  
• Prints fitted parameters  
• Displays publication-quality plots  

---

# Key Experimental Results

• Verified linear relationship: θ ∝ fRF  
• Extracted acoustic velocity on the order of 10³ m/s  
• Measured π-power ≈ 3 W  
• Fit quality R² ≈ 0.998  

---

# Notes

This repository contains analysis and modeling code only.  
Experimental setup, discussion, and full interpretation are documented in **LabReport_BC**.
