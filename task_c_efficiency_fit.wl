(* PHYS404 Nano Lab 3 - Task C
   Diffraction efficiency versus RF power at fixed RF frequency. *)

ClearAll["Global`*"];

rfTermination = 50; (* ohms *)

taskCData = {
  {0.0324, 0.277672201}, {0.0576, 0.280836531}, {0.093025, 0.284018789},
  {0.140625, 0.300199003}, {0.2025, 0.316827423}, {0.265225, 0.323604288},
  {0.330625, 0.330452867}, {0.4096, 0.441787085}, {0.5041, 0.512038797},
  {0.6084, 0.569256696}, {0.7921, 0.61533221}, {1.030225, 0.653483452},
  {1.2544, 0.663200545}, {1.44, 0.712861702}, {1.6129, 0.753881459},
  {1.7689, 0.76431568}, {1.890625, 0.790714977}, {2.0164, 0.81756248},
  {2.0736, 0.83936319}, {2.1316, 0.850371114}, {2.004, 0.861450751},
  {2.204, 0.867017462}
};

pMax = Max[taskCData[[All, 1]]];
etaMin = Min[taskCData[[All, 2]]];
etaMax = Max[taskCData[[All, 2]]];

fitModel = NonlinearModelFit[
  taskCData,
  eta0 + A*Sin[(Pi/2) Sqrt[p/Ppi]]^2,
  {{Ppi, 2.0}, {eta0, etaMin}, {A, etaMax - etaMin}},
  p,
  Method -> "NMinimize"
];

bestParameters = fitModel["BestFitParameters"];
pPiFit = Ppi /. bestParameters;
eta0Fit = eta0 /. bestParameters;
amplitudeFit = A /. bestParameters;
rSquared = fitModel["RSquared"];

Print["--- Task C: Diffraction Efficiency vs RF Power ---"];
Print[Row[{Subscript[P, "π"], " = ", NumberForm[pPiFit, {5, 3}], " W"}]];
Print[Row[{"η0 = ", NumberForm[eta0Fit, {4, 3}]}]];
Print[Row[{"A = ", NumberForm[amplitudeFit, {4, 3}]}]];
Print[Row[{"R^2 = ", NumberForm[rSquared, {5, 4}]}]];
Print[Row[{"Assumed RF termination: ", rfTermination, " Ω"}]];

Show[
  ListPlot[
    taskCData,
    Frame -> True,
    FrameLabel -> {"P_RF (W)", "η (dimensionless)"},
    PlotRange -> {{0, pMax}, {0, 1}},
    PlotMarkers -> {Automatic, 10},
    PlotStyle -> Directive[Opacity[0.85]]
  ],
  Plot[fitModel[p], {p, 0, pMax}, PlotStyle -> {Red, Thick}],
  PlotLabel -> Style["Task C: Diffraction Efficiency vs RF Power", 15],
  PlotLegends -> Placed[
    LineLegend[
      {Directive[Opacity[0.85]], Directive[Red, Thick]},
      {
        "Measured data",
        Row[{Subscript[P, "π"], " = ", NumberForm[pPiFit, {5, 3}], " W, R^2 = ", NumberForm[rSquared, {5, 4}]}]
      }
    ],
    {0.64, 0.20}
  ]
]
