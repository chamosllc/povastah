/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan 源泉徴収税画面
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

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
object { StateMachineDiagram_7pya_e8128ac6c1d56428bfcbc5567f70b355 }
#declare EYE = <259.67, -71.91, -363.57>;
#declare FOCUS = <259.67, -71.91, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
