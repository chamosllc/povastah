/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan ABC_A_6_画面遷移
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

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
#declare StateMachineDiagram_yfw_d1720ea1a76588fd96aa2623c119cd20 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <196.44, -131.59, 0.00> }
object { State rotate -x*90 scale 24.0 translate <317.52, -131.59, 0.00> }
 text { ttf LabelFont, "管理者操作", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <279.49, -167.59, 30.00> }
object { SubmachineState rotate -x*90 scale 24.0 translate <515.50, -131.59, 0.00> }
 text { ttf LabelFont, "厚生年金保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <451.00, -167.59, 30.00> }
object { StateMachineDiagram_7gkj_e8128ac6c1d56428bfcbc5567f70b355 scale 0.2026969178082192 translate <461.1434432077626, -117.01857475385273, -8.23> }
// link Transition:[annuity]
sphere_sweep { linear_spline, 2, 
<317.52, -131.59, 4.00>, 3.0
<515.50, -131.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<196.44, -131.59, 4.00>, 3.0
<317.52, -131.59, 4.00>, 3.0
  texture { TransitionTexture }}

}
object { StateMachineDiagram_yfw_d1720ea1a76588fd96aa2623c119cd20 }
#declare EYE = <383.44, -131.50, -546.94>;
#declare FOCUS = <383.44, -131.50, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
