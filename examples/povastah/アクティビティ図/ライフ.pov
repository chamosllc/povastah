/**
 * astah* Diagram 3D Visualization
 * アクティビティ図/ライフ
 * created at 2021/09/24
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

#declare ActivityDiagram_ei16c82e3456575d0ee46bca982933226e = union {
#local InitialNode1_0 = <159.747, -54.667, 0.0>;
#local Action1_1 = <319.080, -214.654, 0.0 + RAISE>;
#local Action1_2 = <159.747, -214.654, 0.0 + RAISE>;
#local Action1_3 = <215.080, -296.320, 0.0 + RAISE>;
#local ActivityFinal1_4 = <159.827, -458.667, 0.0>;
#local ForkNode1_5 = <159.747, -121.833, 0.0>;
#local Action1_6 = <-8.161, -214.654, 0.0 + RAISE>;
#local Action1_7 = <-40.828, -296.320, 0.0 + RAISE>;
#local Action1_8 = <405.839, -296.320, 0.0 + RAISE>;
#local JoinNode1_9 = <159.747, -403.833, 0.0>;

  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode1_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode1_0, 4.0), LRd  vert(ForkNode1_5, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode1_0, 4.0), LRd  vert(ForkNode1_5, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action1_1 }
    object { Circle_Text(LabelFont, "eval sence",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_1, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action1_1, 4.0), LRd  vert(Action1_8, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action1_1, 4.0), LRd  vert(Action1_8, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 4,  vert(Action1_1, 4.0), LRd  vert(Action1_1, 4.0), LRd  vert(JoinNode1_9, 4.0), LRd  vert(JoinNode1_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 4,  vert(Action1_1, 4.0), LRd  vert(Action1_1, 4.0), LRd/1.0  vert(JoinNode1_9, 4.0), LRd/2.0  vert(JoinNode1_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action1_2 }
    object { Circle_Text(LabelFont, "eval needs",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_2, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action1_2, 4.0), LRd  vert(Action1_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action1_2, 4.0), LRd  vert(Action1_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 4,  vert(Action1_2, 4.0), LRd  vert(Action1_2, 4.0), LRd  vert(JoinNode1_9, 4.0), LRd  vert(JoinNode1_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 4,  vert(Action1_2, 4.0), LRd  vert(Action1_2, 4.0), LRd/1.0  vert(JoinNode1_9, 4.0), LRd/2.0  vert(JoinNode1_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action1_3 }
    object { Circle_Text(LabelFont, "delete",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_3, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action1_3, 4.0), LRd  vert(Action1_3, 4.0), LRd  vertCenter(Action1_3, JoinNode1_9, -28.0), LRd  vert(JoinNode1_9, 4.0), LRd  vert(JoinNode1_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action1_3, 4.0), LRd  vert(Action1_3, 4.0), LRd/1.0  vertCenter(Action1_3, JoinNode1_9, -28.0), LRd/2.0  vert(JoinNode1_9, 4.0), LRd/4.0  vert(JoinNode1_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal1_4 }
  object { ForkNode rotate -x*90 scale 24.0 translate ForkNode1_5 }
    object { Circle_Text(LabelFont, "フォークノード0",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ForkNode1_5, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkNode1_5, 4.0), LRd  vert(ForkNode1_5, 4.0), LRd  vertCenter(ForkNode1_5, Action1_1, -28.0), LRd  vert(Action1_1, 4.0), LRd  vert(Action1_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkNode1_5, 4.0), LRd  vert(ForkNode1_5, 4.0), LRd/1.0  vertCenter(ForkNode1_5, Action1_1, -28.0), LRd/2.0  vert(Action1_1, 4.0), LRd/4.0  vert(Action1_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkNode1_5, 4.0), LRd  vert(ForkNode1_5, 4.0), LRd  vertCenter(ForkNode1_5, Action1_2, -28.0), LRd  vert(Action1_2, 4.0), LRd  vert(Action1_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkNode1_5, 4.0), LRd  vert(ForkNode1_5, 4.0), LRd/1.0  vertCenter(ForkNode1_5, Action1_2, -28.0), LRd/2.0  vert(Action1_2, 4.0), LRd/4.0  vert(Action1_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkNode1_5, 4.0), LRd  vert(ForkNode1_5, 4.0), LRd  vertCenter(ForkNode1_5, Action1_6, -28.0), LRd  vert(Action1_6, 4.0), LRd  vert(Action1_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkNode1_5, 4.0), LRd  vert(ForkNode1_5, 4.0), LRd/1.0  vertCenter(ForkNode1_5, Action1_6, -28.0), LRd/2.0  vert(Action1_6, 4.0), LRd/4.0  vert(Action1_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action1_6 }
    object { Circle_Text(LabelFont, "eval attributes",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_6, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action1_6, 4.0), LRd  vert(Action1_7, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action1_6, 4.0), LRd  vert(Action1_7, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action1_6, 4.0), LRd  vert(Action1_6, 4.0), LRd  vertCenter(Action1_6, JoinNode1_9, -28.0), LRd  vert(JoinNode1_9, 4.0), LRd  vert(JoinNode1_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action1_6, 4.0), LRd  vert(Action1_6, 4.0), LRd/1.0  vertCenter(Action1_6, JoinNode1_9, -28.0), LRd/2.0  vert(JoinNode1_9, 4.0), LRd/4.0  vert(JoinNode1_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action1_7 }
    object { Circle_Text(LabelFont, "migrate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_7, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action1_7, 4.0), LRd  vert(Action1_7, 4.0), LRd  vertCenter(Action1_7, JoinNode1_9, -28.0), LRd  vert(JoinNode1_9, 4.0), LRd  vert(JoinNode1_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action1_7, 4.0), LRd  vert(Action1_7, 4.0), LRd/1.0  vertCenter(Action1_7, JoinNode1_9, -28.0), LRd/2.0  vert(JoinNode1_9, 4.0), LRd/4.0  vert(JoinNode1_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action1_8 }
    object { Circle_Text(LabelFont, "refactor",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_8, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 4,  vert(Action1_8, 4.0), LRd  vert(Action1_8, 4.0), LRd  vert(JoinNode1_9, 4.0), LRd  vert(JoinNode1_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 4,  vert(Action1_8, 4.0), LRd  vert(Action1_8, 4.0), LRd/1.0  vert(JoinNode1_9, 4.0), LRd/2.0  vert(JoinNode1_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { JoinNode rotate -x*90 scale 24.0 translate JoinNode1_9 }
    object { Circle_Text(LabelFont, "ジョインノード0",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(JoinNode1_9, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(JoinNode1_9, 4.0), LRd  vert(ActivityFinal1_4, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(JoinNode1_9, 4.0), LRd  vert(ActivityFinal1_4, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
}
#declare ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f = union {
#local DecisionNodeMergeNode2_0 = <481.268, -70.593, 0.0>;
#local Process2_1 = <121.475, -70.580, 0.0>;
#local Action2_2 = <284.385, -131.913, 0.0>;
#local ObjectNode2_3 = <307.935, -293.580, 0.0>;
#local InitialNode2_4 = <121.602, 24.741, 0.0>;
#local Action2_5 = <597.718, -261.900, 0.0>;
#local Process2_6 = <464.142, -177.913, 0.0>;
#local ActivityFinal2_7 = <597.718, -355.913, 0.0>;

  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate DecisionNodeMergeNode2_0 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode2_0, 4.0), LRd  vert(DecisionNodeMergeNode2_0, 4.0), LRd  vertex(DecisionNodeMergeNode2_0, <113.398, -36.667, 4.000>), LRd  vert(Action2_5, 4.0), LRd  vert(Action2_5, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode2_0, 4.0), LRd  vert(DecisionNodeMergeNode2_0, 4.0), LRd/1.0  vertex(DecisionNodeMergeNode2_0, <113.398, -36.667, 4.000>), LRd/2.0  vert(Action2_5, 4.0), LRd/4.0  vert(Action2_5, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode2_0, 4.0), LRd  vert(Process2_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode2_0, 4.0), LRd  vert(Process2_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate Process2_1 }
    object { Circle_Text(LabelFont, "物を作る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Process2_1, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd  vertex(Process2_1, <124.525, -14.680, 4.000>), LRd  vert(Action2_2, 4.0), LRd  vert(Action2_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd/1.0  vertex(Process2_1, <124.525, -14.680, 4.000>), LRd/2.0  vert(Action2_2, 4.0), LRd/4.0  vert(Action2_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd  vertex(Process2_1, <37.460, -157.346, 4.000>), LRd  vert(ObjectNode2_3, 4.0), LRd  vert(ObjectNode2_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd/1.0  vertex(Process2_1, <37.460, -157.346, 4.000>), LRd/2.0  vert(ObjectNode2_3, 4.0), LRd/4.0  vert(ObjectNode2_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action2_2 }
    object { Circle_Text(LabelFont, "物を見る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action2_2, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action2_2, 4.0), LRd  vert(ObjectNode2_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action2_2, 4.0), LRd  vert(ObjectNode2_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action2_2, 4.0), LRd  vert(DecisionNodeMergeNode2_0, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action2_2, 4.0), LRd  vert(DecisionNodeMergeNode2_0, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ObjectNode rotate -x*90 scale 24.0 translate ObjectNode2_3 }
    object { Circle_Text(LabelFont, ":物",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ObjectNode2_3, 30.0)  no_shadow }
  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode2_4 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode2_4, 4.0), LRd  vert(Process2_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode2_4, 4.0), LRd  vert(Process2_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action2_5 }
    object { Circle_Text(LabelFont, "物を消す",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action2_5, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action2_5, 4.0), LRd  vert(ActivityFinal2_7, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action2_5, 4.0), LRd  vert(ActivityFinal2_7, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action2_5, 4.0), LRd  vert(Action2_5, 4.0), LRd  vertex(Action2_5, <-137.450, -15.359, 4.000>), LRd  vert(ObjectNode2_3, 4.0), LRd  vert(ObjectNode2_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action2_5, 4.0), LRd  vert(Action2_5, 4.0), LRd/1.0  vertex(Action2_5, <-137.450, -15.359, 4.000>), LRd/2.0  vert(ObjectNode2_3, 4.0), LRd/4.0  vert(ObjectNode2_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate Process2_6 }
    object { Circle_Text(LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Process2_6, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process2_6, 4.0), LRd  vert(Process2_6, 4.0), LRd  vertex(Process2_6, <-94.808, 14.654, 4.000>), LRd  vert(Action2_2, 4.0), LRd  vert(Action2_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process2_6, 4.0), LRd  vert(Process2_6, 4.0), LRd/1.0  vertex(Process2_6, <-94.808, 14.654, 4.000>), LRd/2.0  vert(Action2_2, 4.0), LRd/4.0  vert(Action2_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(Process2_6, 4.0), LRd  vert(ObjectNode2_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Process2_6, 4.0), LRd  vert(ObjectNode2_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal2_7 }
}
#declare ActivityDiagram_hbue76362ca895e31cbb57906ea3ad6f99f = union {
#local InitialNode0_0 = <213.603, -70.000, 0.0>;
#local Action0_1 = <330.540, -187.987, 0.0>;
#local ActivityFinal0_2 = <213.603, -344.667, 0.0>;
#local CallBehaviorAction0_3 = <330.540, -284.820, 0.0>;
#local CallBehaviorAction0_4 = <125.225, -238.154, 0.0>;
#local DecisionNodeMergeNode0_5 = <213.603, -134.000, 0.0>;

  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode0_0 }
    object { Circle_Text(LabelFont, "開始",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(InitialNode0_0, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(DecisionNodeMergeNode0_5, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(DecisionNodeMergeNode0_5, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_1 }
    object { Circle_Text(LabelFont, "物を作る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_1, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_1, 4.0), LRd  vert(CallBehaviorAction0_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_1, 4.0), LRd  vert(CallBehaviorAction0_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal0_2 }
  #local CallBehaviorAction0_3_SCALE = 0.12676;
  object { ActivityDiagram_ei16c82e3456575d0ee46bca982933226e scale CallBehaviorAction0_3_SCALE translate  vertexScale(CallBehaviorAction0_3, CallBehaviorAction0_3_SCALE, <147.678*CallBehaviorAction0_3_SCALE, -28.154*CallBehaviorAction0_3_SCALE, -32*CallBehaviorAction0_3_SCALE>)  }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction0_3 }
    text { ttf LabelFont, "物を取り扱う", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction0_3, <-40.540, -48.000, 30.000>) no_shadow }

    union{
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction0_3, 4.0), LRd  vert(CallBehaviorAction0_3, 4.0), LRd  vertex(CallBehaviorAction0_3, <-18.540, -41.180, 4.000>), LRd  vert(ActivityFinal0_2, 4.0), LRd  vert(ActivityFinal0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction0_3, 4.0), LRd  vert(CallBehaviorAction0_3, 4.0), LRd/1.0  vertex(CallBehaviorAction0_3, <-18.540, -41.180, 4.000>), LRd/2.0  vert(ActivityFinal0_2, 4.0), LRd/4.0  vert(ActivityFinal0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  #local CallBehaviorAction0_4_SCALE = 0.11339;
  object { ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f scale CallBehaviorAction0_4_SCALE translate  vertexScale(CallBehaviorAction0_4, CallBehaviorAction0_4_SCALE, <-230.250*CallBehaviorAction0_4_SCALE, -72.394*CallBehaviorAction0_4_SCALE, -32*CallBehaviorAction0_4_SCALE>)  }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction0_4 }
    text { ttf LabelFont, "物を扱う", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction0_4, <-22.360, -48.000, 30.000>) no_shadow }

    union{
    sphere_sweep { linear_spline, 2,  vert(CallBehaviorAction0_4, 4.0), LRd  vert(ActivityFinal0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(CallBehaviorAction0_4, 4.0), LRd  vert(ActivityFinal0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    torus { LOOPRd, LRd rotate -z*45 translate vertex(CallBehaviorAction0_4, <54.360 - LOOPRd, 22.820, 16 - LOOPRd>) material { ControlFlowObjectFlowMaterial } no_shadow }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate DecisionNodeMergeNode0_5 }
    union{
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode0_5, 4.0), LRd  vert(Action0_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode0_5, 4.0), LRd  vert(Action0_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode0_5, 4.0), LRd  vert(DecisionNodeMergeNode0_5, 4.0), LRd  vertex(DecisionNodeMergeNode0_5, <-74.270, -30.667, 4.000>), LRd  vert(CallBehaviorAction0_4, 4.0), LRd  vert(CallBehaviorAction0_4, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode0_5, 4.0), LRd  vert(DecisionNodeMergeNode0_5, 4.0), LRd/1.0  vertex(DecisionNodeMergeNode0_5, <-74.270, -30.667, 4.000>), LRd/2.0  vert(CallBehaviorAction0_4, 4.0), LRd/4.0  vert(CallBehaviorAction0_4, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
}
object { ActivityDiagram_hbue76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <241, -450, -360>;
#declare FOCUS = <241, -240, 0>;
camera { location EYE direction 1.5*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
