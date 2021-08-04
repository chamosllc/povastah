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

#declare ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <87.00, -44.67, 0.00> }
    object { Circle_Text( LabelFont, "開始ノード3", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <87.00, -44.67, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <87.00, -131.55, 0.00> }
    object { Circle_Text( LabelFont, "Action", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <87.00, -131.55, 30.00> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <87.00, -220.00, 0.00> }
    object { Circle_Text( LabelFont, "アクティビティ終了3", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <87.00, -220.00, 30.00> }
    sphere_sweep { linear_spline, 2, <87.00, -44.67, 4.00>, 3.0 <87.00, -131.55, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <87.00, -131.55, 4.00>, 3.0 <87.00, -220.00, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
}
#declare ActivityDiagram_o9o48e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <120.67, -87.76, 0.00> }
    object { Circle_Text( LabelFont, "InitialNode", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <120.67, -87.76, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <253.00, -87.76, 0.00> }
    object { Circle_Text( LabelFont, "Action", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <253.00, -87.76, 30.00> }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate <285.48, -306.46, 0.00> }
  object { ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f scale 0.21281424581005587 translate <259.27, -270.68, -7.66>}
    text { ttf LabelFont, "CallBehaviorAction", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <251.98, -357.51, 31.00> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <629.33, -309.09, 0.00> }
    object { Circle_Text( LabelFont, "ActivityFinal", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <629.33, -309.09, 30.00> }
  object { SendSignalAction rotate -x*90 scale 24.0 translate <345.00, -183.76, 0.00> }
    object { Circle_Text( LabelFont, "SendSignalAction", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <345.00, -183.76, 30.00> }
  object { AcceptEventAction rotate -x*90 scale 24.0 translate <513.00, -183.76, 0.00> }
    object { Circle_Text( LabelFont, "AcceptEventAction", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <513.00, -183.76, 30.00> }
  object { ObjectNode rotate -x*90 scale 24.0 translate <483.06, -306.46, 0.00> }
    object { Circle_Text( LabelFont, "ObjectNode:Class", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <483.06, -306.46, 30.00> }
  object { AcceptTimeEventAction rotate -x*90 scale 24.0 translate <662.00, -191.59, 0.00> }
    object { Circle_Text( LabelFont, "AcceptTimeEventAction", 0.9666666666666667, 0, 2, 1.6333333333333335, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <662.00, -191.59, 30.00> }
  object { Process rotate -x*90 scale 24.0 translate <167.17, -190.05, 0.00> }
    object { Circle_Text( LabelFont, "Process", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <167.17, -190.05, 30.00> }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate <391.67, -87.76, 0.00> }
    object { Circle_Text( LabelFont, "DecisionNodeMergeNode", 0.9666666666666667, 0, 2, 1.6333333333333335, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <391.67, -87.76, 30.00> }
  object { ForkNode rotate -x*90 scale 24.0 translate <521.67, -87.76, 0.00> }
    object { Circle_Text( LabelFont, "ForkNode", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <521.67, -87.76, 30.00> }
  object { JoinNode rotate -x*90 scale 24.0 translate <644.33, -87.76, 0.00> }
    object { Circle_Text( LabelFont, "JoinNode", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <644.33, -87.76, 30.00> }
}
object { ActivityDiagram_o9o48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <418.67, -440.71, -571.38>;
#declare FOCUS = <418.67, -200.71, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
