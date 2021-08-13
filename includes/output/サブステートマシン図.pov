/**
 * astah* Diagram 3D Visualization
 * サブステートマシン図
 * created at 2021/08/13
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare LRd = 3.2;
#declare LOOPRd = 36.0;
#declare TextScale = <16, 16, 2>;

#declare StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f = union {
  object { State rotate -x*90 scale 24.0 translate <180.833, -68.714, 0.0> }
    object { Circle_Text( LabelFont, "State",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <180.833, -68.714, 30.0> }
    union{
    sphere_sweep { linear_spline, 2, <180.833, -68.714, 4.0>, LRd <254.000, -68.714, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <180.833, -68.714, 4.0>, LRd <254.000, -68.714, 4.0>, 0.0 material { TransitionMaterial } no_image }
    }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <107.333, -68.714, 0.0> }
    union{
    sphere_sweep { linear_spline, 2, <107.333, -68.714, 4.0>, LRd <180.833, -68.714, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <107.333, -68.714, 4.0>, LRd <180.833, -68.714, 4.0>, 0.0 material { TransitionMaterial } no_image }
    }
  object { FinalState rotate -x*90 scale 24.0 translate <254.000, -68.714, 0.0> }
}
object { StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <180, -308, -160>;
#declare FOCUS = <180, -68, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { StateMachineDiagramTexture }}
