# PHYS404 Nano Lab 3 – Task B and Task C Report

## Task B – Deflection Angle vs RF Frequency

### Objective
Determine how diffraction angle \(\theta\) depends on applied RF frequency \(f_{RF}\), and extract acoustic velocity \(v_{ac}\) of the AOM crystal.

### Theory and method
In the Bragg regime, the first-order deflection angle follows:

\[
\theta \approx \frac{\lambda f_{RF}}{v_{ac}}
\]

Using \(\lambda = 632.8\,\text{nm}\), the relationship is linear in \(f_{RF}\).
Defining slope \(m\):

\[
m = \frac{\lambda}{v_{ac}} \quad \Rightarrow \quad v_{ac} = \frac{\lambda}{m}
\]

Data were recorded for frequencies from 60 MHz to 100 MHz while RF power remained constant.
Two linear fits were used:

1. \(\theta = mf + b\) (intercept allowed)
2. \(\theta = mf\) (through origin)

### Results summary
- The \(\theta\)-vs-\(f_{RF}\) trend is clearly linear.
- Both fits produced high \(R^2\), with slightly different slopes.
- Because \(v_{ac} = \lambda/m\), the different slopes lead to different extracted acoustic velocities.

### Interpretation
The fit with intercept captures systematic offsets (alignment/zero-angle offsets), while the through-origin model enforces the physical condition \(\theta = 0\) at \(f_{RF}=0\).
For this experiment, the through-origin fit is typically the more physically constrained model.

### Conclusion
Task B verifies the expected proportionality:

\[
\theta \propto f_{RF}
\]

and yields an acoustic velocity on the order of \(10^3\,\text{m/s}\), consistent with AOM materials.

---

## Task C – Diffraction Efficiency vs RF Power (\(f_{RF}=80\) MHz)

### Objective
Determine how first-order diffraction efficiency \(\eta\) varies with RF power and estimate the \(\pi\)-power \(P_\pi\).

### Theory and method
RF power was computed using 50 \(\Omega\) termination:

\[
V_{RMS} = \frac{V_{pp}}{2\sqrt{2}}, \qquad
P_{RF} = \frac{V_{RMS}^2}{50}
\]

Diffraction efficiency was computed from measured optical powers:

\[
\eta = \frac{P_{1st}}{P_{total}}, \qquad P_{total}=P_{0th}+P_{1st}
\]

Model fit used:

\[
\eta(P_{RF}) = \eta_0 + A\sin^2\left(\frac{\pi}{2}\sqrt{\frac{P_{RF}}{P_\pi}}\right)
\]

### Results summary
- Efficiency increases nonlinearly with RF power and approaches saturation.
- Nonlinear regression provides \(P_\pi\), offset \(\eta_0\), amplitude \(A\), and \(R^2\).
- The fit quality is high and consistent with Bragg-regime behavior.

### Interpretation
The \(\sin^2\) dependence is expected because acoustic amplitude scales with \(\sqrt{P_{RF}}\) and diffraction strength depends on acoustic phase modulation.
Estimated \(P_\pi\) is approximately a few watts, consistent with your measured range and observed maximum efficiency.

### Conclusion
Task C confirms the expected Bragg-regime efficiency response and supports proper AOM operation near the measured \(\pi\)-power.
