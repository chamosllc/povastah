/**
 * astah* Diagram 3D Visualization
 * アクティビティ図
 * created at 2021/10/26
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"

#local LRd = 3.2;
#local LOOPRd = 36.0;
#local TextScale = <16, 16, 2>;

#local RAISE = -48;

#declare ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f = union {
#local InitialNode1_0 = <87.004, -44.667, 0.0>;
#local Action1_1 = <87.004, -131.547, 0.0>;
#local ActivityFinal1_2 = <87.004, -220.000, 0.0>;

  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode1_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode1_0, 4.0), LRd  vert(Action1_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode1_0, 4.0), LRd  vert(Action1_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action1_1 }
    object { Circle_Text(LabelFont, "Action",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_1, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action1_1, 4.0), LRd  vert(ActivityFinal1_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action1_1, 4.0), LRd  vert(ActivityFinal1_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal1_2 }
}
#declare ActivityDiagram_o9o48e854451c4ee75ae849d72474c5eb8f = union {
#local InitialNode0_0 = <120.667, -87.448, 0.0>;
#local Action0_1 = <233.004, -87.448, 0.0>;
#local CallBehaviorAction0_2 = <187.500, -303.255, 0.0>;
#local ActivityFinal0_3 = <659.350, -303.255, 0.0>;
#local SendSignalAction0_4 = <345.000, -183.760, 0.0>;
#local AcceptEventAction0_5 = <513.000, -183.760, 0.0>;
#local ObjectNode0_6 = <409.080, -303.255, 0.0>;
#local AcceptTimeEventAction0_7 = <662.000, -191.594, 0.0>;
#local Process0_8 = <167.167, -190.047, 0.0>;
#local DecisionNodeMergeNode0_9 = <345.000, -87.448, 0.0>;
#local ForkNode0_10 = <566.333, -87.448, 0.0>;
#local JoinNode0_11 = <674.333, -87.448, 0.0>;
#local FlowFinalNode0_12 = <558.000, -310.802, 0.0>;
#local Connector0_13 = <450.781, -94.995, 0.0>;

  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode0_0 }
    object { Circle_Text(LabelFont, "InitialNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(InitialNode0_0, 30.0)  no_shadow }
  object { Action rotate -x*90 scale 24.0 translate Action0_1 }
    object { Circle_Text(LabelFont, "Action",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_1, 30.0)  no_shadow }
  #local CallBehaviorAction0_2_SCALE = 0.17718;
  #local CallBehaviorAction0_2_sub = CallBehaviorAction0_2 + <-87.161, 132.167, -32>*CallBehaviorAction0_2_SCALE;
  object { ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f scale CallBehaviorAction0_2_SCALE translate CallBehaviorAction0_2_sub }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction0_2 }
    text { ttf LabelFont, "CallBehaviorAction", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction0_2, <-37.500, -48.000, 30.000>) no_shadow }

  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal0_3 }
    object { Circle_Text(LabelFont, "ActivityFinal",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ActivityFinal0_3, 30.0)  no_shadow }
  object { SendSignalAction rotate -x*90 scale 24.0 translate SendSignalAction0_4 }
    object { Circle_Text(LabelFont, "SendSignalAction",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(SendSignalAction0_4, 30.0)  no_shadow }
  object { AcceptEventAction rotate -x*90 scale 24.0 translate AcceptEventAction0_5 }
    object { Circle_Text(LabelFont, "AcceptEventAction",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(AcceptEventAction0_5, 30.0)  no_shadow }
  object { ObjectNode rotate -x*90 scale 24.0 translate ObjectNode0_6 }
    object { Circle_Text(LabelFont, "ObjectNode:Class",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ObjectNode0_6, 30.0)  no_shadow }
  object { AcceptTimeEventAction rotate -x*90 scale 24.0 translate AcceptTimeEventAction0_7 }
    object { Circle_Text(LabelFont, "AcceptTimeEventAction",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(AcceptTimeEventAction0_7, 30.0)  no_shadow }
  object { Process rotate -x*90 scale 24.0 translate Process0_8 }
    object { Circle_Text(LabelFont, "Process",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Process0_8, 30.0)  no_shadow }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate DecisionNodeMergeNode0_9 }
    object { Circle_Text(LabelFont, "DecisionNodeMergeNode",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(DecisionNodeMergeNode0_9, 30.0)  no_shadow }
  object { ForkNode rotate -x*90 scale 24.0 translate ForkNode0_10 }
    object { Circle_Text(LabelFont, "ForkNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ForkNode0_10, 30.0)  no_shadow }
  object { JoinNode rotate -x*90 scale 24.0 translate JoinNode0_11 }
    object { Circle_Text(LabelFont, "JoinNode",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(JoinNode0_11, 30.0)  no_shadow }
  object { FlowFinalNode rotate -x*90 scale 24.0 translate FlowFinalNode0_12 }
  object { Connector rotate -x*90 scale 24.0 translate Connector0_13 }
    object { Circle_Text(LabelFont, "Connector",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Connector0_13, 30.0)  no_shadow }
}
object { ActivityDiagram_o9o48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <418, -435, -525>;
#declare FOCUS = <418, -195, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
