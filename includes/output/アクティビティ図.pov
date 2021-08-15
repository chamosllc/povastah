/**
 * astah* Diagram 3D Visualization
 * アクティビティ図
 * created at 2021/08/15
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"

#declare LRd = 3.2;
#declare LOOPRd = 36.0;
#declare TextScale = <16, 16, 2>;

#declare ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <87.004, -44.667, 0.00> }
    object { Circle_Text( LabelFont, "開始ノード3",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <87.004, -44.667, 30.00> }
    union{
    sphere_sweep { linear_spline, 2, <87.004, -44.667, 4.00>, LRd <87.004, -131.547, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <87.004, -44.667, 4.00>, LRd <87.004, -131.547, 4.00>, 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate <87.004, -131.547, 0.00> }
    object { Circle_Text( LabelFont, "Action",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <87.004, -131.547, 30.00> }
    union{
    sphere_sweep { linear_spline, 2, <87.004, -131.547, 4.00>, LRd <87.004, -220.000, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <87.004, -131.547, 4.00>, LRd <87.004, -220.000, 4.00>, 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <87.004, -220.000, 0.00> }
    object { Circle_Text( LabelFont, "アクティビティ終了3",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <87.004, -220.000, 30.00> }
}
#declare ActivityDiagram_o9o48e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <120.667, -87.448, 0.00> }
    object { Circle_Text( LabelFont, "InitialNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <120.667, -87.448, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <233.004, -87.448, 0.00> }
    object { Circle_Text( LabelFont, "Action",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <233.004, -87.448, 30.00> }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate <187.500, -303.255, 0.00> }
    object { Circle_Text( LabelFont, "CallBehaviorAction",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <187.500, -303.255, 30.00> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <659.350, -303.255, 0.00> }
    object { Circle_Text( LabelFont, "ActivityFinal",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <659.350, -303.255, 30.00> }
  object { SendSignalAction rotate -x*90 scale 24.0 translate <345.000, -183.760, 0.00> }
    object { Circle_Text( LabelFont, "SendSignalAction",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <345.000, -183.760, 30.00> }
  object { AcceptEventAction rotate -x*90 scale 24.0 translate <513.000, -183.760, 0.00> }
    object { Circle_Text( LabelFont, "AcceptEventAction",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <513.000, -183.760, 30.00> }
  object { ObjectNode rotate -x*90 scale 24.0 translate <409.080, -303.255, 0.00> }
    object { Circle_Text( LabelFont, "ObjectNode:Class",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <409.080, -303.255, 30.00> }
  object { AcceptTimeEventAction rotate -x*90 scale 24.0 translate <662.000, -191.594, 0.00> }
    object { Circle_Text( LabelFont, "AcceptTimeEventAction",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <662.000, -191.594, 30.00> }
  object { Process rotate -x*90 scale 24.0 translate <167.167, -190.047, 0.00> }
    object { Circle_Text( LabelFont, "Process",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <167.167, -190.047, 30.00> }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate <345.000, -87.448, 0.00> }
    object { Circle_Text( LabelFont, "DecisionNodeMergeNode",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <345.000, -87.448, 30.00> }
  object { ForkNode rotate -x*90 scale 24.0 translate <566.333, -87.448, 0.00> }
    object { Circle_Text( LabelFont, "ForkNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <566.333, -87.448, 30.00> }
  object { JoinNode rotate -x*90 scale 24.0 translate <674.333, -87.448, 0.00> }
    object { Circle_Text( LabelFont, "JoinNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <674.333, -87.448, 30.00> }
  object { FlowFinalNode rotate -x*90 scale 24.0 translate <558.000, -310.802, 0.00> }
  object { Connector rotate -x*90 scale 24.0 translate <450.781, -94.995, 0.00> }
    object { Circle_Text( LabelFont, "Connector",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <450.781, -94.995, 30.00> }
}
object { ActivityDiagram_o9o48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <418, -435, -525>;
#declare FOCUS = <418, -195, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
