/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup アクティビティ図
 * created at 2021/08/05
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <87.004, -44.667, 0.000> }
    object { Circle_Text( LabelFont, "開始ノード3",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <87.004, -44.667, 30.000> }
  object { Action rotate -x*90 scale 24.0 translate <87.004, -131.547, 0.000> }
    object { Circle_Text( LabelFont, "Action",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <87.004, -131.547, 30.000> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <87.004, -220.000, 0.000> }
    object { Circle_Text( LabelFont, "アクティビティ終了3",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <87.004, -220.000, 30.000> }
    sphere_sweep { linear_spline, 2, <87.004, -44.667, 4.000>, 3.0 <87.004, -131.547, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <87.004, -131.547, 4.000>, 3.0 <87.004, -220.000, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
}
#declare ActivityDiagram_o9o48e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <120.667, -87.760, 0.000> }
    object { Circle_Text( LabelFont, "InitialNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <120.667, -87.760, 30.000> }
  object { Action rotate -x*90 scale 24.0 translate <253.004, -87.760, 0.000> }
    object { Circle_Text( LabelFont, "Action",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <253.004, -87.760, 30.000> }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate <285.484, -306.464, 0.000> }
  object { ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f scale 0.1517679282868526 translate <269.524, -283.673, -5.464>}
    text { ttf LabelFont, "CallBehaviorAction", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <251.984, -357.510, 31.000> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <629.333, -309.094, 0.000> }
    object { Circle_Text( LabelFont, "ActivityFinal",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <629.333, -309.094, 30.000> }
  object { SendSignalAction rotate -x*90 scale 24.0 translate <345.000, -183.760, 0.000> }
    object { Circle_Text( LabelFont, "SendSignalAction",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <345.000, -183.760, 30.000> }
  object { AcceptEventAction rotate -x*90 scale 24.0 translate <513.000, -183.760, 0.000> }
    object { Circle_Text( LabelFont, "AcceptEventAction",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <513.000, -183.760, 30.000> }
  object { ObjectNode rotate -x*90 scale 24.0 translate <483.064, -306.464, 0.000> }
    object { Circle_Text( LabelFont, "ObjectNode:Class",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <483.064, -306.464, 30.000> }
  object { AcceptTimeEventAction rotate -x*90 scale 24.0 translate <662.000, -191.594, 0.000> }
    object { Circle_Text( LabelFont, "AcceptTimeEventAction",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <662.000, -191.594, 30.000> }
  object { Process rotate -x*90 scale 24.0 translate <167.167, -190.047, 0.000> }
    object { Circle_Text( LabelFont, "Process",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <167.167, -190.047, 30.000> }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate <391.667, -87.760, 0.000> }
    object { Circle_Text( LabelFont, "DecisionNodeMergeNode",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <391.667, -87.760, 30.000> }
  object { ForkNode rotate -x*90 scale 24.0 translate <521.667, -87.760, 0.000> }
    object { Circle_Text( LabelFont, "ForkNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <521.667, -87.760, 30.000> }
  object { JoinNode rotate -x*90 scale 24.0 translate <644.333, -87.760, 0.000> }
    object { Circle_Text( LabelFont, "JoinNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <644.333, -87.760, 30.000> }
}
object { ActivityDiagram_o9o48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <418.667, -440.714, -571.380>;
#declare FOCUS = <418.667, -200.714, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.000, -1000.000, -3000.000> color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
