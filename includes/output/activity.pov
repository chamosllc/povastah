/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup アクティビティ図
 * created at 2021/08/04
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
#declare ActivityDiagram_o9o48e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <120.667, -87.448, 0.000> }
    object { Circle_Text( LabelFont, "InitialNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <120.667, -87.448, 30.000> }
  object { Action rotate -x*90 scale 24.0 translate <233.004, -87.448, 0.000> }
    object { Circle_Text( LabelFont, "Action",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <233.004, -87.448, 30.000> }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate <187.500, -303.255, 0.000> }
  object { ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f scale 0.1517679282868526 translate <171.540, -280.465, -5.464>}
    text { ttf LabelFont, "CallBehaviorAction", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <154.000, -354.302, 31.000> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <659.350, -303.255, 0.000> }
    object { Circle_Text( LabelFont, "ActivityFinal",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <659.350, -303.255, 30.000> }
  object { SendSignalAction rotate -x*90 scale 24.0 translate <345.000, -183.760, 0.000> }
    object { Circle_Text( LabelFont, "SendSignalAction",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <345.000, -183.760, 30.000> }
  object { AcceptEventAction rotate -x*90 scale 24.0 translate <513.000, -183.760, 0.000> }
    object { Circle_Text( LabelFont, "AcceptEventAction",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <513.000, -183.760, 30.000> }
  object { ObjectNode rotate -x*90 scale 24.0 translate <409.080, -303.255, 0.000> }
    object { Circle_Text( LabelFont, "ObjectNode:Class",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <409.080, -303.255, 30.000> }
  object { AcceptTimeEventAction rotate -x*90 scale 24.0 translate <662.000, -191.594, 0.000> }
    object { Circle_Text( LabelFont, "AcceptTimeEventAction",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <662.000, -191.594, 30.000> }
  object { Process rotate -x*90 scale 24.0 translate <167.167, -190.047, 0.000> }
    object { Circle_Text( LabelFont, "Process",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <167.167, -190.047, 30.000> }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate <345.000, -87.448, 0.000> }
    object { Circle_Text( LabelFont, "DecisionNodeMergeNode",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <345.000, -87.448, 30.000> }
  object { ForkNode rotate -x*90 scale 24.0 translate <566.333, -87.448, 0.000> }
    object { Circle_Text( LabelFont, "ForkNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <566.333, -87.448, 30.000> }
  object { JoinNode rotate -x*90 scale 24.0 translate <674.333, -87.448, 0.000> }
    object { Circle_Text( LabelFont, "JoinNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <674.333, -87.448, 30.000> }
  object { FlowFinalNode rotate -x*90 scale 24.0 translate <558.000, -310.802, 0.000> }
  object { Connector rotate -x*90 scale 24.0 translate <450.781, -94.995, 0.000> }
    object { Circle_Text( LabelFont, "Connector",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <450.781, -94.995, 30.000> }
}
object { ActivityDiagram_o9o48e854451c4ee75ae849d72474c5eb8f }
box { <0, 0, 0>, <1, 1, 1> pigment { image_map { jpeg  "./povastah-Lineup/activity.jpg" map_type 0 } rotate x*180 } scale <848, -422, 1> translate <50, 360, 31> scale 0.85 }
#declare EYE = <418.67, -130.71, -681.38>;
#declare FOCUS = <418.67,-50.0, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-100, -1200.00, -3000.00> color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
