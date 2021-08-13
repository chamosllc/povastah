/**
 * astah* Diagram 3D Visualization
 * CallBehaviorAction
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

#declare ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <87.004, -44.667, 0.0> }
    object { Circle_Text( LabelFont, "開始ノード3",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <87.004, -44.667, 30.0> }
    union{
    sphere_sweep { linear_spline, 2, <87.004, -44.667, 4.0>, LRd <87.004, -131.547, 4.0>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <87.004, -44.667, 4.0>, LRd <87.004, -131.547, 4.0>, 0.0 material { ControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate <87.004, -131.547, 0.0> }
    object { Circle_Text( LabelFont, "Action",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <87.004, -131.547, 30.0> }
    union{
    sphere_sweep { linear_spline, 2, <87.004, -131.547, 4.0>, LRd <87.004, -220.000, 4.0>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <87.004, -131.547, 4.0>, LRd <87.004, -220.000, 4.0>, 0.0 material { ControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <87.004, -220.000, 0.0> }
    object { Circle_Text( LabelFont, "アクティビティ終了3",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <87.004, -220.000, 30.0> }
}
object { ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <87, -372, -136>;
#declare FOCUS = <87, -132, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
