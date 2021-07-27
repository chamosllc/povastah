/**
 * astah* Diagram 3D Visualization
 * povastah リスト画面
 * created at 2021/07/27
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare StateMachineDiagram_e7_881a9fa389742b575ef0aabbe66a5249 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <130.00, -89.33, 0.00> }
object { State rotate -x*90 scale 24.0 translate <232.57, -89.15, 0.00> }
 text { ttf LabelFont, "find", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <239.91, -125.15, 30.00> }
object { State rotate -x*90 scale 24.0 translate <392.57, -167.15, 0.00> }
 text { ttf LabelFont, "show", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <393.35, -203.15, 30.00> }
object { State rotate -x*90 scale 24.0 translate <241.90, -222.49, 0.00> }
 text { ttf LabelFont, "select", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <232.16, -258.49, 30.00> }
object { FinalState rotate -x*90 scale 24.0 translate <130.00, -222.67, 0.00> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<130.00, -89.33, 4.00>, 3.0
<232.57, -89.15, 4.00>, 3.0
  texture { TransitionTexture }}
// link Transition:retry
torus { 36.0, 3.0 translate <232.57, -89.15, -32.00>  texture { TransitionTexture }}
// link Transition:
sphere_sweep { cubic_spline, 5, 
<232.57, -89.15, 4.00>, 3.0
<232.57, -89.15, 4.00>, 3.0
<300.00, -55.33, 4.00>, 3.0
<392.57, -167.15, 4.00>, 3.0
<392.57, -167.15, 4.00>, 3.0
  texture { TransitionTexture }}
// link Transition:
sphere_sweep { linear_spline, 2, 
<392.57, -167.15, 4.00>, 3.0
<241.90, -222.49, 4.00>, 3.0
  texture { TransitionTexture }}
// link Transition:
sphere_sweep { linear_spline, 2, 
<241.90, -222.49, 4.00>, 3.0
<130.00, -222.67, 4.00>, 3.0
  texture { TransitionTexture }}
// link Transition:back

sphere_sweep { linear_spline, 2, 
<392.57, -167.15, 4.00>, 3.0
<232.57, -89.15, 4.00>, 3.0
  texture { TransitionTexture }}
}
object { StateMachineDiagram_e7_881a9fa389742b575ef0aabbe66a5249 }
#declare EYE = <272.00, -132.19, -436.19>;
#declare FOCUS = <272.00, -132.19, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
