(* PHYS404 Nano Lab 3 - Task B
   Deflection angle versus RF frequency for an AOM (Bragg regime). *)

ClearAll["Global`*"];

laserWavelength = 632.8*10^-9; (* meters *)

taskBData = {
  {60000000, 0.008466464}, {62500000, 0.008983832}, {65000000, 0.009454163},
  {67500000, 0.009924489}, {70000000, 0.010441843}, {72500000, 0.010582938},
  {75000000, 0.010771065}, {77500000, 0.010959191}, {80000000, 0.011194347},
  {82500000, 0.01133544}, {85000000, 0.011523564}, {87500000, 0.011899809},
  {90000000, 0.01227605}, {92500000, 0.012652288}, {95000000, 0.012934464},
  {97500000, 0.013216638}, {100000000, 0.013404753}
};

fMin = Min[taskBData[[All, 1]]];
fMax = Max[taskBData[[All, 1]]];

fitWithIntercept = LinearModelFit[taskBData, {1, f}, f];
slopeWithIntercept = fitWithIntercept["BestFitParameters"][[2]];
intercept = fitWithIntercept["BestFitParameters"][[1]];
acousticVelocityWithIntercept = laserWavelength/slopeWithIntercept;
rSquaredWithIntercept = fitWithIntercept["RSquared"];

fitThroughOrigin = LinearModelFit[taskBData, f, f, IncludeConstantBasis -> False];
slopeThroughOrigin = fitThroughOrigin["BestFitParameters"][[1]];
acousticVelocityThroughOrigin = laserWavelength/slopeThroughOrigin;
rSquaredThroughOrigin = fitThroughOrigin["RSquared"];

Print["--- Task B: Deflection Angle vs RF Frequency ---"];
Print["Model 1 (with intercept):  θ = m f + b"];
Print[Row[{"m = ", ScientificForm[slopeWithIntercept, 4], " s"}]];
Print[Row[{"b = ", ScientificForm[intercept, 4], " rad"}]];
Print[Row[{"v_ac = λ/m = ", NumberForm[acousticVelocityWithIntercept, {7, 1}], " m/s"}]];
Print[Row[{"R^2 = ", NumberForm[rSquaredWithIntercept, {5, 4}]}]];

Print[""];
Print["Model 2 (forced through origin):  θ = m f"];
Print[Row[{"m = ", ScientificForm[slopeThroughOrigin, 4], " s"}]];
Print[Row[{"v_ac = λ/m = ", NumberForm[acousticVelocityThroughOrigin, {7, 1}], " m/s"}]];
Print[Row[{"R^2 = ", NumberForm[rSquaredThroughOrigin, {5, 4}]}]];

Show[
  ListPlot[
    taskBData,
    Frame -> True,
    FrameLabel -> {"f_RF (Hz)", "θ (rad)"},
    PlotMarkers -> {Automatic, 10},
    PlotRange -> All
  ],
  Plot[fitWithIntercept[f], {f, fMin, fMax}, PlotStyle -> {Red, Thick}],
  Plot[fitThroughOrigin[f], {f, fMin, fMax}, PlotStyle -> {Blue, Dashed, Thick}],
  PlotLabel -> Style["Task B: Deflection Angle vs RF Frequency", 15],
  PlotLegends -> Placed[
    LineLegend[
      {Red, Blue},
      {
        Row[{"θ = mf + b  (v_ac = ", NumberForm[acousticVelocityWithIntercept, {7, 1}], " m/s)"}],
        Row[{"θ = mf      (v_ac = ", NumberForm[acousticVelocityThroughOrigin, {7, 1}], " m/s)"}]
      }
    ],
    {0.36, 0.80}
  ]
]
