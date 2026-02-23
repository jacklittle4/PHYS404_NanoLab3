# PHYS404 Nano Lab 3 — Acousto-Optic Modulator (AOM)

This repository contains Wolfram Mathematica / Wolfram Language analysis and report materials for:

• Task B — Deflection Angle vs RF Frequency  
• Task C — Diffraction Efficiency vs RF Power  

Course: PHYS404 (Advanced Nanophysics Lab)

---

## Repository Contents

- TaskB.nb  
  Original notebook framework for Task B (Bragg angle geometry and linear fitting).

- labreport_bc.pdf  
  Final written lab report for Tasks B and C.

- task_b_deflection_fit.wl  
  Final Wolfram Language script for deflection angle analysis and acoustic velocity extraction.

- task_c_efficiency_fit.wl  
  Final Wolfram Language script for diffraction efficiency nonlinear fitting.

---

# Task B — Deflection Angle vs RF Frequency

In the Bragg regime, the angular separation between the 0th and 1st order beams follows:

θ = (λ fRF) / vac

Where:

- θ = measured deflection angle  
- λ = laser wavelength (632.8 nm)  
- fRF = applied RF frequency  
- vac = acoustic velocity in the crystal  

Because:

θ = m fRF

The acoustic velocity is extracted from the slope:

vac = λ / m

Two fits were performed:
• Linear fit with intercept  
• Linear fit forced through origin (physically preferred since θ = 0 when fRF = 0)

See:
task_b_deflection_fit.wl  
TaskB.nb  
labreport_bc.pdf

---

# Task C — Diffraction Efficiency vs RF Power

Diffraction efficiency is defined as:

η = P₁st / Ptotal  
Ptotal = P₀th + P₁st

RF power is calculated using a 50 Ω load:

VRMS = Vpp / (2√2)  
PRF = VRMS² / 50

In the Bragg regime, efficiency follows:

η(PRF) = sin²[(π/2) √(PRF / Pπ)]

Where:
- PRF = applied RF power  
- Pπ = π-power (fit parameter)  

The nonlinear regression extracts:
• Pπ  
• amplitude scaling factor  
• baseline offset  
• R² fit quality  

See:
task_c_efficiency_fit.wl  
labreport_bc.pdf

---

# How to Run the Analysis

1. Open Wolfram Mathematica or Wolfram Engine.
2. Set the working directory to this repository.
3. Run:

Get["task_b_deflection_fit.wl"]
Get["task_c_efficiency_fit.wl"]

Each script will:
• Import experimental data  
• Perform regression  
• Print fitted parameters  
• Display plots  

---

# Key Experimental Results

• Verified linear relationship: θ ∝ fRF  
• Extracted acoustic velocity on the order of 10³ m/s  
• Measured π-power ≈ 3 W  
• Fit quality R² ≈ 0.998  

---

# Notes

This repository contains analysis and modeling code only.  
Experimental setup and discussion are documented in labreport_bc.pdf.
