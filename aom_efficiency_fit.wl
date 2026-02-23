(* AOM diffraction-efficiency fit using a sin^2 saturation model *)
ClearAll["Global`*"];

(* Measured pairs: {RF power in W, diffraction efficiency eta} *)
powerEfficiencyData = {
  {0.0324, 0.277672201}, 
  {0.0576, 0.280836531},
  {0.093025, 0.284018789},
  {0.140625, 0.300199003},
  {0.2025, 0.316827423},
  {0.265225, 0.323604288},
  {0.330625, 0.330452867},
  {0.4096, 0.441787085},
  {0.5041, 0.512038797},
  {0.6084, 0.569256696},
  {0.7921, 0.61533221},
  {1.030225, 0.653483452},
  {1.2544, 0.663200545},
  {1.44, 0.712861702},
  {1.6129, 0.753881459},
  {1.7689, 0.76431568},
  {1.890625, 0.790714977},
  {2.0164, 0.81756248},
  {2.0736, 0.83936319},
  {2.1316, 0.850371114}
};

maxPower = Max[powerEfficiencyData[[All, 1]]];

(* Fit model: eta = sin^2((pi/2) * sqrt(P_RF / P_pi)) *)
fitModel = NonlinearModelFit[
  powerEfficiencyData,
  Sin[(Pi/2) Sqrt[p/Ppi]]^2,
  {{Ppi, 2.0}},
  p
];

pPiFit = Ppi /. fitModel["BestFitParameters"];
rSquared = fitModel["RSquared"];

Print[
  Row[{
    "Best-fit parameter: ",
    Subscript[P, "\[Pi]"],
    " = ",
    NumberForm[pPiFit, {5, 3}],
    " W (model predicts ",
    "\[Eta] = 1",
    " at this RF power)"
  }]
];

Print[Row[{"R", Superscript["", 2], " = ", NumberForm[rSquared, {4, 3}]}]];

Show[
  ListPlot[
    powerEfficiencyData,
    Frame -> True,
    FrameLabel -> {
      Row[{Subscript[P, RF], " (W)"}],
      Row[{"\[Eta] = ", Subscript[P, "1st"], " / ", Subscript[P, "Total"]}]
    },
    PlotRange -> {{0, maxPower}, {0, 1}},
    PlotMarkers -> {Automatic, 10}
  ],
  Plot[fitModel[p], {p, 0, maxPower}, PlotStyle -> {Red, Thick}],
  PlotLabel -> Style["Diffraction Efficiency vs RF Power (AOM)", 15]
]
