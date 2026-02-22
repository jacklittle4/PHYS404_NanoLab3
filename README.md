 (cd "$(git rev-parse --show-toplevel)" && git apply --3way <<'EOF' 
diff --git a/README.md b/README.md
new file mode 100644
index 0000000000000000000000000000000000000000..15b8deb9940ede2f0d8e3d986c42c0dcc402a33f
--- /dev/null
+++ b/README.md
@@ -0,0 +1,34 @@
+# PHYS404 Nano Lab 3
+
+This repository contains a Wolfram Language analysis for fitting **AOM diffraction efficiency** as a function of RF drive power.
+
+## What is included
+
+- `aom_efficiency_fit.wl` — cleaned and documented analysis script.
+- `PHYS404-Lab3-Little.nb` — original notebook work.
+
+## Model used
+
+The fit assumes:
+
+\[
+\eta = \sin^2\left(\frac{\pi}{2}\sqrt{\frac{P_{RF}}{P_\pi}}\right)
+\]
+
+Where:
+- \(\eta\) is diffraction efficiency,
+- \(P_{RF}\) is RF power,
+- \(P_\pi\) is the fitted characteristic power scale.
+
+## How to run
+
+1. Open Wolfram Mathematica or Wolfram Engine.
+2. Run `aom_efficiency_fit.wl`.
+3. The script will:
+   - print the best-fit \(P_\pi\),
+   - print the fit quality \(R^2\),
+   - display data points and the fitted curve.
+
+## Notes
+
+- The script keeps your original dataset and model, but improves naming, readability, and output clarity.
 
EOF
)
