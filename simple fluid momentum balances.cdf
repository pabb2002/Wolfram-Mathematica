(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 13.0' *)

(***************************************************************************)
(*                                                                         *)
(*                                                                         *)
(*  Under the Wolfram FreeCDF terms of use, this file and its content are  *)
(*  bound by the Creative Commons BY-SA Attribution-ShareAlike license.    *)
(*                                                                         *)
(*        For additional information concerning CDF licensing, see:        *)
(*                                                                         *)
(*         www.wolfram.com/cdf/adopting-cdf/licensing-options.html         *)
(*                                                                         *)
(*                                                                         *)
(***************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1088,         20]
NotebookDataLength[     20421,        487]
NotebookOptionsPosition[     19828,        466]
NotebookOutlinePosition[     20302,        484]
CellTagsIndexPosition[     20259,        481]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell["\<\
This program calculates the velocity profile of a Newtonian fluid with \
horizontal laminar flow. It does so for three different geometries: \
rectangular, cylindrical and spherical. In the momentum balance, the term for \
gravity is ignored since this program only models horizontal flow. Bulk flow \
terms are also cancelled by assuming that the momentum due to bulk flow stays \
constant.

The program takes into account a few possible scenarios to consider different \
boundary conditions. One scenario is that the fluid is surrounded by \
stationary walls/plates, in which case the shear stress is 0 at the center \
and a symmetrical velocity profile. Another scenario is that there is a gas \
liquid interface, where shear stress is 0 as well. If neither of these \
scenarios apply, the last scenario that\[CloseCurlyQuote]s covered is that \
the velocity of the fluid is known at 2 points. 

\
\>", "Text",
 CellChangeTimes->{{3.8522356171349645`*^9, 3.852235709055559*^9}, {
  3.8522357764454465`*^9, 3.852235786323194*^9}, {3.852235823974633*^9, 
  3.85223589162232*^9}, {3.852236370741188*^9, 3.852236371107209*^9}, {
  3.852236416438835*^9, 3.8522365900808935`*^9}, {3.8522377098558445`*^9, 
  3.852237719213122*^9}},ExpressionUUID->"42fdba7a-0807-460e-ba31-\
3f0a0c500339"],

Cell[CellGroupData[{

Cell["Key", "Subtitle",
 CellChangeTimes->{{3.8522367817633038`*^9, 
  3.852236782088105*^9}},ExpressionUUID->"124f5e9c-8fc2-4b4a-9966-\
9b49bc3997c7"],

Cell["\<\
parSol = particular solution
genSol = general solution
rhsVdiffeq = right hand side of the differential equation for velocity
velProf = velocity profile
specificVelProf = specific velocity profile given inputted conditions for the \
fluid\
\>", "Text",
 CellChangeTimes->{{3.852236789228277*^9, 3.85223680402738*^9}, {
  3.852238338994914*^9, 
  3.852238396640629*^9}},ExpressionUUID->"f34a3984-625f-4f14-9cd3-\
fb2e947b469d"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Stationary Walls or Gas-Liquid Interface", "Title",
 CellChangeTimes->{{3.8522413088645945`*^9, 
  3.852241330062666*^9}},ExpressionUUID->"3270db68-8c07-42f0-80f3-\
66960abf1012"],

Cell["Rectangular Geometry (Flow Between Slabs)", "Subtitle",
 CellChangeTimes->{{3.8522412650835238`*^9, 
  3.8522412877338867`*^9}},ExpressionUUID->"ec6ac885-bdcd-41db-a231-\
0788d8681606"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "\"\<Global`*\>\"", "]"}], "\[IndentingNewLine]", 
  "\[IndentingNewLine]", 
  RowBox[{"(*", 
   RowBox[{
    RowBox[{
     RowBox[{"\[Tau]", "'"}], "[", "x", "]"}], "=."}], "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"(*", 
   RowBox[{
    RowBox[{"d1input", "=", 
     RowBox[{"Input", "[", "\"\<x-value where \[Tau]=0: \>\"", "]"}]}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{"V1input", "=", 
     RowBox[{"Input", "[", "\"\<Known velocity: \>\"", "]"}]}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{"d2input", "=", 
     RowBox[{"Input", "[", "\"\<x-value of known velocity: \>\"", "]"}]}], 
    ";", "\[IndentingNewLine]", 
    RowBox[{"Linput", "=", 
     RowBox[{"Input", "[", "\"\<Length of plates: \>\"", "]"}]}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{"\[Mu]input", "=", 
     RowBox[{"Input", "[", "\"\<Fluid viscosity: \>\"", "]"}]}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{"Poinput", "=", 
     RowBox[{"Input", "[", "\"\<Inlet pressure: \>\"", "]"}]}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{"Plinput", "=", 
     RowBox[{"Input", "[", "\"\<Outlet pressure: \>\"", "]"}]}], ";"}], 
   "\[IndentingNewLine]", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"d1input", "=", "5"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"V1input", "=", "0"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"d2input", "=", "2"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Linput", "=", "2"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"\[Mu]input", "=", "2"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Poinput", "=", "3"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"Plinput", "=", "2"}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"parSolTau", "=", 
   RowBox[{"DSolve", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"\[Tau]", "'"}], "[", "x", "]"}], "==", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"Pl", "-", "Po"}], ")"}], "/", "L"}]}], ",", 
       RowBox[{
        RowBox[{"\[Tau]", "[", "d1", "]"}], "==", "0"}]}], "}"}], ",", 
     RowBox[{"\[Tau]", "[", "x", "]"}], ",", "x"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Print", "[", 
   RowBox[{"\"\<Shear stress: \[Tau](x) = \>\"", ",", 
    RowBox[{
     RowBox[{
      RowBox[{"\[Tau]", "[", "x", "]"}], "/.", 
      RowBox[{"parSolTau", "[", 
       RowBox[{"[", "1", "]"}], "]"}]}], "/.", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"d1", "->", "d1input"}], ",", 
       RowBox[{"Po", "->", "Poinput"}], ",", 
       RowBox[{"Pl", "->", "Plinput"}]}], "}"}]}]}], "]"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"rhsVdiffeq", " ", "=", " ", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"\[Tau]", "[", "x", "]"}], "/.", "parSolTau"}], ")"}], "/", 
      RowBox[{"(", 
       RowBox[{"-", "\[Mu]"}], ")"}]}], ")"}], "[", 
    RowBox[{"[", "1", "]"}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"parSolV", " ", "=", " ", 
   RowBox[{"DSolve", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"V", "'"}], "[", "x", "]"}], "==", "rhsVdiffeq"}], ",", " ", 
       RowBox[{
        RowBox[{"V", "[", "d2", "]"}], "==", "V1"}]}], "}"}], ",", 
     RowBox[{"V", "[", "x", "]"}], ",", "x"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"velProf", "=", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"V", "[", "x", "]"}], "/.", "parSolV"}], ")"}], "[", 
     RowBox[{"[", "1", "]"}], "]"}]}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"specificVelProf", "=", 
   RowBox[{"velProf", "/.", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"d1", "->", "d1input"}], ",", 
      RowBox[{"V1", "->", "V1input"}], ",", 
      RowBox[{"d2", "->", "d2input"}], ",", 
      RowBox[{"L", "->", "Linput"}], ",", " ", 
      RowBox[{"\[Mu]", "->", "\[Mu]input"}], ",", " ", 
      RowBox[{"Po", "->", "Poinput"}], ",", 
      RowBox[{"Pl", "->", "Plinput"}]}], "}"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Print", "[", 
   RowBox[{"\"\<Velocity profile: V(x) = \>\"", ",", " ", "specificVelProf"}],
    "]"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"flip", "=", 
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{"y", "==", "specificVelProf"}], ",", "x"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"F1", "[", "y_", "]"}], "=", 
   RowBox[{"x", "/.", "flip"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"If", "[", 
  RowBox[{
   RowBox[{"d1input", "==", "0"}], ",", "\[IndentingNewLine]", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"F1", "[", "y", "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"y", ",", 
       RowBox[{"-", "10"}], ",", "10"}], "}"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"-", "10"}], ",", "10"}], "}"}]}]}], "]"}]}], 
  "\[IndentingNewLine]", "]"}], "\[IndentingNewLine]", 
 RowBox[{"If", "[", 
  RowBox[{
   RowBox[{"d1input", ">", "0"}], ",", "\[IndentingNewLine]", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"F1", "[", "y", "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"y", ",", 
       RowBox[{"-", "10"}], ",", "10"}], "}"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"-", "10"}], ",", "d1input"}], "}"}]}]}], "]"}]}], 
  "\[IndentingNewLine]", "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"If", "[", 
   RowBox[{
    RowBox[{"d1input", "<", "0"}], ",", "\[IndentingNewLine]", 
    RowBox[{"Plot", "[", 
     RowBox[{
      RowBox[{"F1", "[", "y", "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"y", ",", 
        RowBox[{"-", "10"}], ",", "10"}], "}"}], ",", 
      RowBox[{"PlotRange", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"d1input", ",", "10"}], "}"}]}]}], "]"}]}], 
   "\[IndentingNewLine]", "]"}], "\[IndentingNewLine]", 
  RowBox[{"(*", "cylindrical", "*)"}], "\[IndentingNewLine]", 
  "\[IndentingNewLine]", 
  RowBox[{"(*", "spherical", "*)"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]"}], "Input",
 CellChangeTimes->{{3.8522359140905137`*^9, 3.852235954066066*^9}, {
   3.852235990991307*^9, 3.852236089333959*^9}, {3.8522361326431785`*^9, 
   3.852236148909584*^9}, {3.8522362328805428`*^9, 3.85223624553959*^9}, {
   3.8522362897570457`*^9, 3.852236322826795*^9}, {3.8522366703722253`*^9, 
   3.8522367679648037`*^9}, {3.852236825533874*^9, 3.8522369094520826`*^9}, {
   3.85223705347665*^9, 3.8522370581521873`*^9}, 3.8522370894044275`*^9, {
   3.8522371196485434`*^9, 3.852237122366144*^9}, {3.852237170923953*^9, 
   3.852237179158437*^9}, {3.852237213302546*^9, 3.852237333148182*^9}, {
   3.852237427757247*^9, 3.8522374380903816`*^9}, {3.852237485390517*^9, 
   3.852237491591378*^9}, {3.8522375277201214`*^9, 3.8522375392516212`*^9}, {
   3.8522375705466585`*^9, 3.852237573809346*^9}, {3.8522376326312695`*^9, 
   3.852237635363122*^9}, 3.8522376946927958`*^9, {3.852237766533991*^9, 
   3.8522378098874407`*^9}, {3.852237840272284*^9, 3.8522380304981346`*^9}, {
   3.8522380825156107`*^9, 3.852238175157016*^9}, {3.852238211701166*^9, 
   3.8522383328901033`*^9}, {3.852238415640814*^9, 3.852238543070319*^9}, {
   3.852238670633043*^9, 3.8522386748765073`*^9}, {3.852238835188778*^9, 
   3.8522388805277376`*^9}, {3.8522389141306047`*^9, 3.852239239710827*^9}, {
   3.852239420391045*^9, 3.852239470556821*^9}, {3.8522395142799053`*^9, 
   3.8522395395694766`*^9}, {3.852239570007163*^9, 3.8522395860436263`*^9}, {
   3.8522397207234917`*^9, 3.852239727609214*^9}, {3.8522398230498877`*^9, 
   3.852239826786773*^9}, {3.8522398651468363`*^9, 3.852239890910838*^9}, {
   3.8522399378076015`*^9, 3.852240017193987*^9}, {3.852240169464039*^9, 
   3.852240312990472*^9}, {3.8522403485689754`*^9, 3.8522404959466953`*^9}, {
   3.852240543362305*^9, 3.8522405438051596`*^9}, {3.852240589584999*^9, 
   3.8522406117953515`*^9}, {3.852240704506288*^9, 3.8522409212786255`*^9}, {
   3.852240959775908*^9, 3.8522410154143276`*^9}, {3.8522412218577576`*^9, 
   3.8522412496753902`*^9}, {3.8522413536642075`*^9, 
   3.8522416328675776`*^9}, {3.8522416637794333`*^9, 
   3.8522416817383857`*^9}, {3.8522417119500046`*^9, 3.852241744836361*^9}, {
   3.8522417752561045`*^9, 3.8522417886989365`*^9}, {3.852241820546524*^9, 
   3.852241928379732*^9}, {3.8522419841951447`*^9, 3.852241988209936*^9}, {
   3.852242217126766*^9, 3.8522422172764225`*^9}, {3.8522424729765406`*^9, 
   3.852242473095441*^9}},
 CellLabel->
  "In[792]:=",ExpressionUUID->"2020ab87-51d2-49fb-9c2c-054475d77417"],

Cell[CellGroupData[{

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Shear stress: \[Tau](x) = \"\>", "\[InvisibleSpace]", 
   FractionBox[
    RowBox[{"5", "-", "x"}], "L"]}],
  SequenceForm[
  "Shear stress: \[Tau](x) = ", $CellContext`L^(-1) (5 - $CellContext`x)],
  Editable->False]], "Print",
 CellChangeTimes->{
  3.8522415467753687`*^9, {3.8522415846443853`*^9, 3.852241620356064*^9}, 
   3.852241747211691*^9, 3.852241896769494*^9, {3.852241974918143*^9, 
   3.852241992695635*^9}, 3.8522422179930353`*^9, 3.8522424736730394`*^9},
 CellLabel->
  "During evaluation of \
In[792]:=",ExpressionUUID->"aa7d57a9-344f-4672-ad44-8b86180f3dea"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Velocity profile: V(x) = \"\>", "\[InvisibleSpace]", 
   RowBox[{
    FractionBox["1", "8"], " ", 
    RowBox[{"(", 
     RowBox[{"16", "-", 
      RowBox[{"10", " ", "x"}], "+", 
      SuperscriptBox["x", "2"]}], ")"}]}]}],
  SequenceForm[
  "Velocity profile: V(x) = ", 
   Rational[1, 8] (16 - 10 $CellContext`x + $CellContext`x^2)],
  Editable->False]], "Print",
 CellChangeTimes->{
  3.8522415467753687`*^9, {3.8522415846443853`*^9, 3.852241620356064*^9}, 
   3.852241747211691*^9, 3.852241896769494*^9, {3.852241974918143*^9, 
   3.852241992695635*^9}, 3.8522422179930353`*^9, 3.8522424736972895`*^9},
 CellLabel->
  "During evaluation of \
In[792]:=",ExpressionUUID->"552a7d59-0691-4cff-8d2b-43bc4b12b912"]
}, Open  ]],

Cell[BoxData[
 GraphicsBox[{{{}, {}, 
    TagBox[
     {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
      1.], LineBox[CompressedData["
1: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
       "]]},
     Annotation[#, "Charting`Private`Tag$45517#1"]& ]}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImagePadding->All,
  Method->{
   "DefaultBoundaryStyle" -> Automatic, 
    "DefaultGraphicsInteraction" -> {
     "Version" -> 1.2, "TrackMousePosition" -> {True, False}, 
      "Effects" -> {
       "Highlight" -> {"ratio" -> 2}, "HighlightPoint" -> {"ratio" -> 2}, 
        "Droplines" -> {
         "freeformCursorMode" -> True, 
          "placement" -> {"x" -> "All", "y" -> "None"}}}}, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None, 
    "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
        (Identity[#]& )[
         Part[#, 1]], 
        (Identity[#]& )[
         Part[#, 2]]}& ), "CopiedValueFunction" -> ({
        (Identity[#]& )[
         Part[#, 1]], 
        (Identity[#]& )[
         Part[#, 2]]}& )}},
  PlotRange->{{-1.1247864570883084`, 9.999999591836735}, {-10., 5.}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {0, 0}},
  Ticks->{Automatic, Automatic}]], "Output",
 CellChangeTimes->{{3.8522370362368517`*^9, 3.852237092161603*^9}, 
   3.8522371231899014`*^9, 3.852237180851589*^9, {3.8522372427453203`*^9, 
   3.8522373023487263`*^9}, 3.8522373336882668`*^9, 3.85223743925732*^9, 
   3.852237492177404*^9, 3.852237540763114*^9, 3.8522375746116304`*^9, {
   3.8522376691843023`*^9, 3.8522376821017075`*^9}, 3.852237782207509*^9, 
   3.8522378151641617`*^9, {3.8522378647690015`*^9, 3.8522378876005163`*^9}, 
   3.8522379217704268`*^9, {3.8522380211390915`*^9, 3.852238031262042*^9}, {
   3.8522380847063665`*^9, 3.85223811460312*^9}, {3.8522381520913987`*^9, 
   3.852238176402072*^9}, {3.852238231264944*^9, 3.8522382363883586`*^9}, 
   3.8522383064120383`*^9, {3.8522384596954546`*^9, 3.8522385437042246`*^9}, 
   3.8522386763048487`*^9, {3.8522389314821897`*^9, 3.852239015861699*^9}, {
   3.852239059036806*^9, 3.8522391019353695`*^9}, {3.8522391602524853`*^9, 
   3.8522391865191064`*^9}, {3.8522392228212457`*^9, 3.852239240327624*^9}, {
   3.852239422762656*^9, 3.8522394711120844`*^9}, {3.8522395211694365`*^9, 
   3.852239540044261*^9}, 3.8522395879055033`*^9, 3.852239728069027*^9, 
   3.852239827292618*^9, {3.8522398681028605`*^9, 3.8522398915257235`*^9}, 
   3.852239960564145*^9, {3.8522399948513536`*^9, 3.852240017710642*^9}, {
   3.852240176496586*^9, 3.8522401905659943`*^9}, 3.85224026545977*^9, {
   3.8522405621601777`*^9, 3.852240612223332*^9}, 3.852240889186178*^9, {
   3.8522410001243553`*^9, 3.8522410159355764`*^9}, 3.8522412290746136`*^9, {
   3.8522415360714655`*^9, 3.8522415467753687`*^9}, {3.8522415846756287`*^9, 
   3.8522416203717117`*^9}, 3.8522417472276635`*^9, 3.8522418968253756`*^9, {
   3.852241974928998*^9, 3.8522419927667465`*^9}, 3.8522422180697055`*^9, 
   3.8522424737285633`*^9},
 CellLabel->
  "Out[810]=",ExpressionUUID->"b3728fd5-b2ec-4247-aacd-d2bbff959309"]
}, Open  ]],

Cell["", "Gas-Liquid Interface",ExpressionUUID->"d7698e8c-6581-4ced-981a-707fecb81c16"],

Cell["Two Known Velocities", "Subtitle",
 CellChangeTimes->{{3.852236974476982*^9, 
  3.8522369857495794`*^9}},ExpressionUUID->"1ce59d9d-04da-4a4a-ae39-\
3ad62d7a1e70"]
}, Open  ]]
},
WindowSize->{1152., 688.5},
WindowMargins->{{
  Automatic, -4.7999999999999545`}, {-4.7999999999999545`, Automatic}},
Magnification:>0.7 Inherited,
FrontEndVersion->"13.0 for Microsoft Windows (64-bit) (December 2, 2021)",
StyleDefinitions->"Default.nb",
ExpressionUUID->"c969354c-60dd-4d5e-9465-ff467e54aa7c"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[1488, 33, 1295, 23, 121, "Text",ExpressionUUID->"42fdba7a-0807-460e-ba31-3f0a0c500339"],
Cell[CellGroupData[{
Cell[2808, 60, 151, 3, 37, "Subtitle",ExpressionUUID->"124f5e9c-8fc2-4b4a-9966-9b49bc3997c7"],
Cell[2962, 65, 436, 11, 88, "Text",ExpressionUUID->"f34a3984-625f-4f14-9cd3-fb2e947b469d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[3435, 81, 185, 3, 68, "Title",ExpressionUUID->"3270db68-8c07-42f0-80f3-66960abf1012"],
Cell[3623, 86, 191, 3, 37, "Subtitle",ExpressionUUID->"ec6ac885-bdcd-41db-a231-0788d8681606"],
Cell[CellGroupData[{
Cell[3839, 93, 8822, 218, 606, "Input",ExpressionUUID->"2020ab87-51d2-49fb-9c2c-054475d77417"],
Cell[CellGroupData[{
Cell[12686, 315, 624, 14, 30, "Print",ExpressionUUID->"aa7d57a9-344f-4672-ad44-8b86180f3dea"],
Cell[13313, 331, 762, 19, 30, "Print",ExpressionUUID->"552a7d59-0691-4cff-8d2b-43bc4b12b912"]
}, Open  ]],
Cell[14090, 353, 5449, 102, 171, "Output",ExpressionUUID->"b3728fd5-b2ec-4247-aacd-d2bbff959309"]
}, Open  ]],
Cell[19554, 458, 87, 0, 17, "Gas-Liquid Interface",ExpressionUUID->"d7698e8c-6581-4ced-981a-707fecb81c16"],
Cell[19644, 460, 168, 3, 37, "Subtitle",ExpressionUUID->"1ce59d9d-04da-4a4a-ae39-3ad62d7a1e70"]
}, Open  ]]
}
]
*)

(* NotebookSignature svTz9ss44KmKzBKcRvEcxsRR *)
