/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan 物
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare StateMachineDiagram_kky_e76362ca895e31cbb57906ea3ad6f99f = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <117.33, -138.00, 0.00> }
object { State rotate -x*90 scale 24.0 translate <278.67, -137.67, 0.00> }
 text { ttf LabelFont, "一時", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <288.67, -173.67, 30.00> }
object { State rotate -x*90 scale 24.0 translate <438.67, -137.67, 0.00> }
 text { ttf LabelFont, "永続", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <448.67, -173.67, 30.00> }
object { FinalState rotate -x*90 scale 24.0 translate <586.67, -138.00, 0.00> }
// link Transition:/ instanciate
sphere_sweep { linear_spline, 2, 
<117.33, -138.00, 4.00>, 3.0
<278.67, -137.67, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:CREATE
sphere_sweep { linear_spline, 2, 
<278.67, -137.67, 4.00>, 3.0
<438.67, -137.67, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:UPDATE
torus { 36.0, 3.0 translate <438.67, -137.67, -32.00>  texture { TransitionTexture }}

// link Transition:DELETE
sphere_sweep { linear_spline, 2, 
<438.67, -137.67, 4.00>, 3.0
<586.67, -138.00, 4.00>, 3.0
  texture { TransitionTexture }}

}
object { StateMachineDiagram_kky_e76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <444.33, -327.33, -803.67>;
#declare FOCUS = <444.33, -327.33, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
