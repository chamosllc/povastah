/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup サブステートマシン図
 * created at 2021/08/11
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare TextScale = <16, 16, 2>;
#declare LRd = 3.2;

#declare StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f = union {
  object { State rotate -x*90 scale 24.0 translate <180.833, -68.714, 0.000> }
    object { Circle_Text( LabelFont, "State",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <180.833, -68.714, 30.000> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <107.333, -68.714, 0.000> }
  object { FinalState rotate -x*90 scale 24.0 translate <254.000, -68.714, 0.000> }
    sphere_sweep { linear_spline, 2, <180.833, -68.714, 4.000>, LRd <254.000, -68.714, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <107.333, -68.714, 4.000>, LRd <180.833, -68.714, 4.000>, LRd material { TransitionMaterial }}
}
object { StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <180.833, -308.667, -201.500>;
#declare FOCUS = <180.833, -68.667, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
