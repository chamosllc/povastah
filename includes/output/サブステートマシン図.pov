/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup サブステートマシン図
 * created at 2021/08/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f = union {
  object { State rotate -x*90 scale 24.0 translate <180.83, -68.71, 0.00> }
    object { Circle_Text( LabelFont, "State", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <180.83, -68.71, 30.00> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <107.33, -68.71, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <107.33, -68.71, 30.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <253.33, -125.38, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <253.33, -125.38, 30.00> }
    sphere_sweep { linear_spline, 2, <180.83, -68.71, 4.00>, 3.0 <253.33, -125.38, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <107.33, -68.71, 4.00>, 3.0 <180.83, -68.71, 4.00>, 3.0 texture { TransitionTexture }}
}
object { StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <180.33, -273.17, -185.50>;
#declare FOCUS = <180.33, -93.17, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
