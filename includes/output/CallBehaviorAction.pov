/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup CallBehaviorAction
 * created at 2021/08/11
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare TextScale = <16, 16, 2>;
#declare LRd = 3.2;

#declare ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <87.004, -44.667, 0.000> }
    object { Circle_Text( LabelFont, "開始ノード3",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <87.004, -44.667, 30.000> }
  object { Action rotate -x*90 scale 24.0 translate <87.004, -131.547, 0.000> }
    object { Circle_Text( LabelFont, "Action",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <87.004, -131.547, 30.000> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <87.004, -220.000, 0.000> }
    object { Circle_Text( LabelFont, "アクティビティ終了3",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <87.004, -220.000, 30.000> }
    sphere_sweep { linear_spline, 2, <87.004, -44.667, 4.000>, LRd <87.004, -131.547, 4.000>, LRd material { ControlFlow_ObjectFlowMaterial }}
    sphere_sweep { linear_spline, 2, <87.004, -131.547, 4.000>, LRd <87.004, -220.000, 4.000>, LRd material { ControlFlow_ObjectFlowMaterial }}
}
object { ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <87.161, -372.167, -176.000>;
#declare FOCUS = <87.161, -132.167, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
