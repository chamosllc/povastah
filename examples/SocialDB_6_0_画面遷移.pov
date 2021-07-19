/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SocialDB_6_0_画面遷移
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare StateMachineDiagram_7922_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.67, -131.33, 0.00> }
object { State rotate -x*90 scale 24.0 translate <210.83, -10.05, 0.00> }
 text { ttf LabelFont, "employ.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <171.33, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <407.00, -10.05, 0.00> }
 text { ttf LabelFont, "employEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <334.00, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <380.83, -140.71, 0.00> }
 text { ttf LabelFont, "employList.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <315.33, -176.71, 30.00> }
object { ChoicePseudostate rotate -x*90 scale 24.0 translate <167.50, -130.17, 0.00> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<88.67, -131.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:entry
sphere_sweep { linear_spline, 2, 
<167.50, -130.17, 4.00>, 3.0
<210.83, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit / save
sphere_sweep { linear_spline, 2, 
<210.83, -10.05, 4.00>, 3.0
<407.00, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { linear_spline, 2, 
<407.00, -10.05, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <210.83, -10.05, -32.00>  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { cubic_spline, 5, 
<210.83, -10.05, 4.00>, 3.0
<210.83, -10.05, 4.00>, 3.0
<159.33, -56.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { linear_spline, 2, 
<380.83, -140.71, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:list
sphere_sweep { cubic_spline, 5, 
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<258.67, -185.00, 4.00>, 3.0
<380.83, -140.71, 4.00>, 3.0
<380.83, -140.71, 4.00>, 3.0
  texture { TransitionTexture }}

}
#declare StateMachineDiagram_7922_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.67, -131.33, 0.00> }
object { State rotate -x*90 scale 24.0 translate <210.83, -10.05, 0.00> }
 text { ttf LabelFont, "employ.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <171.33, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <407.00, -10.05, 0.00> }
 text { ttf LabelFont, "employEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <334.00, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <380.83, -140.71, 0.00> }
 text { ttf LabelFont, "employList.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <315.33, -176.71, 30.00> }
object { ChoicePseudostate rotate -x*90 scale 24.0 translate <167.50, -130.17, 0.00> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<88.67, -131.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:entry
sphere_sweep { linear_spline, 2, 
<167.50, -130.17, 4.00>, 3.0
<210.83, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit / save
sphere_sweep { linear_spline, 2, 
<210.83, -10.05, 4.00>, 3.0
<407.00, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { linear_spline, 2, 
<407.00, -10.05, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <210.83, -10.05, -32.00>  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { cubic_spline, 5, 
<210.83, -10.05, 4.00>, 3.0
<210.83, -10.05, 4.00>, 3.0
<159.33, -56.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { linear_spline, 2, 
<380.83, -140.71, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:list
sphere_sweep { cubic_spline, 5, 
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<258.67, -185.00, 4.00>, 3.0
<380.83, -140.71, 4.00>, 3.0
<380.83, -140.71, 4.00>, 3.0
  texture { TransitionTexture }}

}
#declare StateMachineDiagram_7gkj_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.67, -131.33, 0.00> }
object { State rotate -x*90 scale 24.0 translate <207.83, -10.05, 0.00> }
 text { ttf LabelFont, "health.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <171.33, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <404.00, -10.05, 0.00> }
 text { ttf LabelFont, "healthEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <334.00, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <377.83, -140.71, 0.00> }
 text { ttf LabelFont, "healthList.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <315.33, -176.71, 30.00> }
object { ChoicePseudostate rotate -x*90 scale 24.0 translate <167.50, -130.17, 0.00> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<88.67, -131.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:entry
sphere_sweep { linear_spline, 2, 
<167.50, -130.17, 4.00>, 3.0
<207.83, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit / save
sphere_sweep { linear_spline, 2, 
<207.83, -10.05, 4.00>, 3.0
<404.00, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { linear_spline, 2, 
<404.00, -10.05, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <207.83, -10.05, -32.00>  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { cubic_spline, 5, 
<207.83, -10.05, 4.00>, 3.0
<207.83, -10.05, 4.00>, 3.0
<159.33, -56.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { linear_spline, 2, 
<377.83, -140.71, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:list
sphere_sweep { cubic_spline, 5, 
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<258.67, -185.00, 4.00>, 3.0
<377.83, -140.71, 4.00>, 3.0
<377.83, -140.71, 4.00>, 3.0
  texture { TransitionTexture }}

}
#declare StateMachineDiagram_7pya_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.67, -131.33, 0.00> }
object { State rotate -x*90 scale 24.0 translate <198.55, -10.05, 0.00> }
 text { ttf LabelFont, "tax.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <183.33, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <395.36, -10.05, 0.00> }
 text { ttf LabelFont, "taxEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <346.00, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <368.33, -140.71, 0.00> }
 text { ttf LabelFont, "taxList.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <327.33, -176.71, 30.00> }
object { ChoicePseudostate rotate -x*90 scale 24.0 translate <167.50, -130.17, 0.00> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<88.67, -131.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:entry
sphere_sweep { linear_spline, 2, 
<167.50, -130.17, 4.00>, 3.0
<198.55, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit / save
sphere_sweep { linear_spline, 2, 
<198.55, -10.05, 4.00>, 3.0
<395.36, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { linear_spline, 2, 
<395.36, -10.05, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <198.55, -10.05, -32.00>  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { cubic_spline, 5, 
<198.55, -10.05, 4.00>, 3.0
<198.55, -10.05, 4.00>, 3.0
<159.33, -56.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { linear_spline, 2, 
<368.33, -140.71, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:list
sphere_sweep { cubic_spline, 5, 
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<258.67, -185.00, 4.00>, 3.0
<368.33, -140.71, 4.00>, 3.0
<368.33, -140.71, 4.00>, 3.0
  texture { TransitionTexture }}

}
#declare StateMachineDiagram_17bc2_39aff7367173f652afc310de89302491 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <236.44, 47.78, 0.00> }
object { State rotate -x*90 scale 24.0 translate <236.19, -24.03, 0.00> }
 text { ttf LabelFont, "管理者操作", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <198.16, -60.03, 30.00> }
object { SubmachineState rotate -x*90 scale 24.0 translate <267.00, -146.03, 0.00> }
 text { ttf LabelFont, "厚生年金保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <199.50, -182.03, 30.00> }
object { StateMachineDiagram_7922_e8128ac6c1d56428bfcbc5567f70b355 scale 0.2026969178082192 translate <212.0353524543379, -131.45394890351255, -8.23> }
object { SubmachineState rotate -x*90 scale 24.0 translate <89.83, -146.03, 0.00> }
 text { ttf LabelFont, "雇用保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <38.33, -182.03, 30.00> }
object { StateMachineDiagram_7922_e8128ac6c1d56428bfcbc5567f70b355 scale 0.2026969178082192 translate <34.86868578767116, -131.45394890351255, -8.23> }
object { SubmachineState rotate -x*90 scale 24.0 translate <440.50, -146.03, 0.00> }
 text { ttf LabelFont, "健康保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <392.00, -182.03, 30.00> }
object { StateMachineDiagram_7gkj_e8128ac6c1d56428bfcbc5567f70b355 scale 0.2026969178082192 translate <386.1434432077626, -131.45394890351255, -8.23> }
object { SubmachineState rotate -x*90 scale 24.0 translate <475.17, -24.03, 0.00> }
 text { ttf LabelFont, "源泉徴収税額", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <420.70, -60.03, 30.00> }
object { StateMachineDiagram_7pya_e8128ac6c1d56428bfcbc5567f70b355 scale 0.2026969178082192 translate <422.53303367579906, -9.453948903512561, -8.23> }
// link Transition:[employ]
sphere_sweep { linear_spline, 2, 
<236.19, -24.03, 4.00>, 3.0
<89.83, -146.03, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:[annuity]
sphere_sweep { linear_spline, 2, 
<236.19, -24.03, 4.00>, 3.0
<267.00, -146.03, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:[health]
sphere_sweep { linear_spline, 2, 
<236.19, -24.03, 4.00>, 3.0
<440.50, -146.03, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:[tax]
sphere_sweep { linear_spline, 2, 
<236.19, -24.03, 4.00>, 3.0
<475.17, -24.03, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<236.44, 47.78, 4.00>, 3.0
<236.19, -24.03, 4.00>, 3.0
  texture { TransitionTexture }}

}
object { StateMachineDiagram_17bc2_39aff7367173f652afc310de89302491 }
#declare EYE = <275.83, -58.72, -366.56>;
#declare FOCUS = <275.83, -58.72, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
