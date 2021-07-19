/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan 社員画面
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare StateMachineDiagram_bslb_3885535429bae75d78e3378cdc11db25 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <-47.33, -24.93, 0.00> }
object { State rotate -x*90 scale 24.0 translate <87.50, -24.93, 0.00> }
 text { ttf LabelFont, "create.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <40.00, -60.93, 30.00> }
object { State rotate -x*90 scale 24.0 translate <236.60, -193.59, 0.00> }
 text { ttf LabelFont, "entry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <208.00, -229.59, 30.00> }
object { State rotate -x*90 scale 24.0 translate <306.67, -24.93, 0.00> }
 text { ttf LabelFont, "confirm.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <262.67, -60.93, 30.00> }
object { FinalState rotate -x*90 scale 24.0 translate <87.50, -193.59, 0.00> }
// link Transition:submit
sphere_sweep { cubic_spline, 5, 
<87.50, -24.93, 4.00>, 3.0
<87.50, -24.93, 4.00>, 3.0
<175.33, -78.24, 4.00>, 3.0
<306.67, -24.93, 4.00>, 3.0
<306.67, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<-47.33, -24.93, 4.00>, 3.0
<87.50, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<87.50, -24.93, 4.00>, 3.0
<87.50, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<236.60, -193.59, 4.00>, 3.0
<87.50, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset / back
sphere_sweep { cubic_spline, 5, 
<306.67, -24.93, 4.00>, 3.0
<283.40, -0.62, 4.00>, 3.0
<186.67, 30.43, 4.00>, 3.0
<87.50, -24.93, 4.00>, 3.0
<87.50, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { cubic_spline, 5, 
<306.67, -24.93, 4.00>, 3.0
<306.67, -24.93, 4.00>, 3.0
<320.00, -145.57, 4.00>, 3.0
<236.60, -193.59, 4.00>, 3.0
<236.60, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <87.50, -24.93, -32.00>  texture { TransitionTexture }}

// link Transition:submit [error]
torus { 36.0, 3.0 translate <87.50, -24.93, -32.00>  texture { TransitionTexture }}

}
object { StateMachineDiagram_bslb_3885535429bae75d78e3378cdc11db25 }
#declare EYE = <146.67, -79.55, -258.22>;
#declare FOCUS = <146.67, -79.55, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
