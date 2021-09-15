/**
 * astah* Diagram 3D Visualization
 * 構造表現/アクティビティ図ForkJoin
 * created at 2021/09/13
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
#local InitialNode1_0 = <-46.127, -46.667, 0.0>;
#local Action1_1 = <-46.127, -132.654, 0.0>;
#local Action1_2 = <191.873, -132.654, 0.0>;
#local Action1_3 = <-46.127, -231.987, 0.0>;
#local ActivityFinal1_4 = <-46.127, -310.000, 0.0>;

  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode1_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode1_0, 4.0), LRd  vert(Action1_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode1_0, 4.0), LRd  vert(Action1_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action1_1 }
    object { Circle_Text(LabelFont, "物を見る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_1, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action1_1, 4.0), LRd  vert(Action1_1, 4.0), LRd  vertex(Action1_1, <106.127, -42.680, 4.000>), LRd  vert(Action1_2, 4.0), LRd  vert(Action1_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action1_1, 4.0), LRd  vert(Action1_1, 4.0), LRd/1.0  vertex(Action1_1, <106.127, -42.680, 4.000>), LRd/2.0  vert(Action1_2, 4.0), LRd/4.0  vert(Action1_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action1_1, 4.0), LRd  vert(Action1_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action1_1, 4.0), LRd  vert(Action1_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    torus { LOOPRd, LRd translate vert(Action1_1, -LOOPRd) material { ControlFlowObjectFlowMaterial } no_shadow }
  object { Action rotate -x*90 scale 24.0 translate Action1_2 }
    object { Circle_Text(LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_2, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action1_2, 4.0), LRd  vert(Action1_2, 4.0), LRd  vertex(Action1_2, <-121.207, 56.654, 4.000>), LRd  vert(Action1_1, 4.0), LRd  vert(Action1_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action1_2, 4.0), LRd  vert(Action1_2, 4.0), LRd/1.0  vertex(Action1_2, <-121.207, 56.654, 4.000>), LRd/2.0  vert(Action1_1, 4.0), LRd/4.0  vert(Action1_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action1_3 }
    object { Circle_Text(LabelFont, "物を消す",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_3, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action1_3, 4.0), LRd  vert(ActivityFinal1_4, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action1_3, 4.0), LRd  vert(ActivityFinal1_4, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal1_4 }
}
#declare ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f = union {
#local DecisionNodeMergeNode2_0 = <489.268, -20.593, 0.0>;
#local Process2_1 = <121.475, -87.246, 0.0>;
#local Action2_2 = <299.718, -109.913, 0.0>;
#local ObjectNode2_3 = <307.935, -293.580, 0.0>;
#local InitialNode2_4 = <121.602, 24.741, 0.0>;
#local Action2_5 = <644.385, -199.246, 0.0>;
#local Process2_6 = <496.808, -121.246, 0.0>;
#local ActivityFinal2_7 = <644.385, -293.259, 0.0>;

  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate DecisionNodeMergeNode2_0 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode2_0, 4.0), LRd  vert(DecisionNodeMergeNode2_0, 4.0), LRd  vertex(DecisionNodeMergeNode2_0, <141.000, -28.000, 4.000>), LRd  vert(Action2_5, 4.0), LRd  vert(Action2_5, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode2_0, 4.0), LRd  vert(DecisionNodeMergeNode2_0, 4.0), LRd/1.0  vertex(DecisionNodeMergeNode2_0, <141.000, -28.000, 4.000>), LRd/2.0  vert(Action2_5, 4.0), LRd/4.0  vert(Action2_5, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode2_0, 4.0), LRd  vert(Process2_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode2_0, 4.0), LRd  vert(Process2_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate Process2_1 }
    object { Circle_Text(LabelFont, "物を作る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Process2_1, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd  vertex(Process2_1, <94.127, 69.320, 4.000>), LRd  vert(Action2_2, 4.0), LRd  vert(Action2_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd/1.0  vertex(Process2_1, <94.127, 69.320, 4.000>), LRd/2.0  vert(Action2_2, 4.0), LRd/4.0  vert(Action2_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd  vertex(Process2_1, <37.460, -140.680, 4.000>), LRd  vert(ObjectNode2_3, 4.0), LRd  vert(ObjectNode2_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd/1.0  vertex(Process2_1, <37.460, -140.680, 4.000>), LRd/2.0  vert(ObjectNode2_3, 4.0), LRd/4.0  vert(ObjectNode2_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
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
    sphere_sweep { cubic_spline, 5,  vert(Action2_5, 4.0), LRd  vert(Action2_5, 4.0), LRd  vertex(Action2_5, <-184.117, -78.013, 4.000>), LRd  vert(ObjectNode2_3, 4.0), LRd  vert(ObjectNode2_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action2_5, 4.0), LRd  vert(Action2_5, 4.0), LRd/1.0  vertex(Action2_5, <-184.117, -78.013, 4.000>), LRd/2.0  vert(ObjectNode2_3, 4.0), LRd/4.0  vert(ObjectNode2_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate Process2_6 }
    object { Circle_Text(LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Process2_6, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process2_6, 4.0), LRd  vert(Process2_6, 4.0), LRd  vertex(Process2_6, <-104.540, -27.346, 4.000>), LRd  vert(Action2_2, 4.0), LRd  vert(Action2_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process2_6, 4.0), LRd  vert(Process2_6, 4.0), LRd/1.0  vertex(Process2_6, <-104.540, -27.346, 4.000>), LRd/2.0  vert(Action2_2, 4.0), LRd/4.0  vert(Action2_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(Process2_6, 4.0), LRd  vert(ObjectNode2_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Process2_6, 4.0), LRd  vert(ObjectNode2_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal2_7 }
}
#declare ActivityDiagram_hbue76362ca895e31cbb57906ea3ad6f99f = union {
#local InitialNode3_0 = <213.603, -70.000, 0.0>;
#local Action3_1 = <330.540, -187.987, 0.0>;
#local ActivityFinal3_2 = <213.603, -344.667, 0.0>;
#local CallBehaviorAction3_3 = <330.540, -284.820, 0.0>;
#local CallBehaviorAction3_4 = <125.225, -238.154, 0.0>;
#local DecisionNodeMergeNode3_5 = <213.603, -134.000, 0.0>;

  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode3_0 }
    object { Circle_Text(LabelFont, "開始",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(InitialNode3_0, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode3_0, 4.0), LRd  vert(DecisionNodeMergeNode3_5, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode3_0, 4.0), LRd  vert(DecisionNodeMergeNode3_5, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action3_1 }
    object { Circle_Text(LabelFont, "物を作る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action3_1, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action3_1, 4.0), LRd  vert(CallBehaviorAction3_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action3_1, 4.0), LRd  vert(CallBehaviorAction3_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal3_2 }
  #local CallBehaviorAction3_3_SCALE = 0.17690;
  object { ActivityDiagram_ei16c82e3456575d0ee46bca982933226e scale CallBehaviorAction3_3_SCALE translate  vertexScale(CallBehaviorAction3_3, CallBehaviorAction3_3_SCALE, <257.707*CallBehaviorAction3_3_SCALE, -106.654*CallBehaviorAction3_3_SCALE, -32*CallBehaviorAction3_3_SCALE>)  }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction3_3 }
    text { ttf LabelFont, "物を取り扱う", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction3_3, <-40.540, -48.000, 30.000>) no_shadow }

    union{
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction3_3, 4.0), LRd  vert(CallBehaviorAction3_3, 4.0), LRd  vertex(CallBehaviorAction3_3, <-18.540, -41.180, 4.000>), LRd  vert(ActivityFinal3_2, 4.0), LRd  vert(ActivityFinal3_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction3_3, 4.0), LRd  vert(CallBehaviorAction3_3, 4.0), LRd/1.0  vertex(CallBehaviorAction3_3, <-18.540, -41.180, 4.000>), LRd/2.0  vert(ActivityFinal3_2, 4.0), LRd/4.0  vert(ActivityFinal3_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  #local CallBehaviorAction3_4_SCALE = 0.10557;
  object { ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f scale CallBehaviorAction3_4_SCALE translate  vertexScale(CallBehaviorAction3_4, CallBehaviorAction3_4_SCALE, <-253.750*CallBehaviorAction3_4_SCALE, -100.394*CallBehaviorAction3_4_SCALE, -32*CallBehaviorAction3_4_SCALE>)  }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction3_4 }
    text { ttf LabelFont, "物を扱う", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction3_4, <-22.360, -48.000, 30.000>) no_shadow }

    union{
    sphere_sweep { linear_spline, 2,  vert(CallBehaviorAction3_4, 4.0), LRd  vert(ActivityFinal3_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(CallBehaviorAction3_4, 4.0), LRd  vert(ActivityFinal3_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    torus { LOOPRd, LRd rotate -z*45 translate vertex(CallBehaviorAction3_4, <54.360 - LOOPRd, 22.820, 16 - LOOPRd>) material { ControlFlowObjectFlowMaterial } no_shadow }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate DecisionNodeMergeNode3_5 }
    union{
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode3_5, 4.0), LRd  vert(Action3_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode3_5, 4.0), LRd  vert(Action3_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode3_5, 4.0), LRd  vert(DecisionNodeMergeNode3_5, 4.0), LRd  vertex(DecisionNodeMergeNode3_5, <-74.270, -30.667, 4.000>), LRd  vert(CallBehaviorAction3_4, 4.0), LRd  vert(CallBehaviorAction3_4, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode3_5, 4.0), LRd  vert(DecisionNodeMergeNode3_5, 4.0), LRd/1.0  vertex(DecisionNodeMergeNode3_5, <-74.270, -30.667, 4.000>), LRd/2.0  vert(CallBehaviorAction3_4, 4.0), LRd/4.0  vert(CallBehaviorAction3_4, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
}
#declare ActivityDiagram_ky0ce4b1c12b0b0b3b2860874e0282606b = union {
#local InitialNode0_0 = <86.000, -197.333, 0.0>;
#local ForkNode0_1 = <151.833, -197.333, 0.0>;
#local CallBehaviorAction0_2 = <274.559, -101.000, 0.0 + RAISE>;
#local CallBehaviorAction0_3 = <301.892, -267.154, 0.0 + RAISE>;
#local ForkNode0_4 = <389.167, -101.000, 0.0 + RAISE>;
#local CallBehaviorAction0_5 = <524.963, -54.167, 0.0 + RAISE*2>;
#local Action0_6 = <525.172, -144.000, 0.0 + RAISE*2>;
#local JoinNode0_7 = <643.833, -101.000, 0.0 + RAISE>;
#local CallBehaviorAction0_8 = <544.559, -267.154, 0.0 + RAISE>;
#local JoinNode0_9 = <713.167, -197.333, 0.0>;
#local ActivityFinal0_10 = <784.667, -197.333, 0.0>;

  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode0_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(ForkNode0_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(ForkNode0_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ForkNode rotate -x*90 scale 24.0 translate ForkNode0_1 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_1, 4.0), LRd  vert(ForkNode0_1, 4.0), LRd  vertCenter(CallBehaviorAction0_2, ForkNode0_1, -28.0), LRd  vert(CallBehaviorAction0_2, 4.0), LRd  vert(CallBehaviorAction0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_1, 4.0), LRd  vert(ForkNode0_1, 4.0), LRd/1.0  vertCenter(CallBehaviorAction0_2, ForkNode0_1, -28.0), LRd/2.0  vert(CallBehaviorAction0_2, 4.0), LRd/4.0  vert(CallBehaviorAction0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_1, 4.0), LRd  vert(ForkNode0_1, 4.0), LRd  vertCenter(CallBehaviorAction0_3, ForkNode0_1, -28.0), LRd  vert(CallBehaviorAction0_3, 4.0), LRd  vert(CallBehaviorAction0_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_1, 4.0), LRd  vert(ForkNode0_1, 4.0), LRd/1.0  vertCenter(CallBehaviorAction0_3, ForkNode0_1, -28.0), LRd/2.0  vert(CallBehaviorAction0_3, 4.0), LRd/4.0  vert(CallBehaviorAction0_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  #local CallBehaviorAction0_2_SCALE = 0.17690;
  object { ActivityDiagram_ei16c82e3456575d0ee46bca982933226e scale CallBehaviorAction0_2_SCALE translate  vertexScale(CallBehaviorAction0_2, CallBehaviorAction0_2_SCALE, <201.725*CallBehaviorAction0_2_SCALE, 77.167*CallBehaviorAction0_2_SCALE, -32*CallBehaviorAction0_2_SCALE>)  }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction0_2 }
    text { ttf LabelFont, "ムーブメント", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction0_2, <-40.540, -48.000, 30.000>) no_shadow }

    union{
    sphere_sweep { linear_spline, 2,  vert(CallBehaviorAction0_2, 4.0), LRd  vert(ForkNode0_4, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(CallBehaviorAction0_2, 4.0), LRd  vert(ForkNode0_4, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  #local CallBehaviorAction0_3_SCALE = 0.10557;
  object { ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f scale CallBehaviorAction0_3_SCALE translate  vertexScale(CallBehaviorAction0_3, CallBehaviorAction0_3_SCALE, <-77.083*CallBehaviorAction0_3_SCALE, -129.394*CallBehaviorAction0_3_SCALE, -32*CallBehaviorAction0_3_SCALE>)  }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction0_3 }
    text { ttf LabelFont, "ライフサイクル", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction0_3, <-49.630, -48.000, 30.000>) no_shadow }

    union{
    sphere_sweep { linear_spline, 2,  vert(CallBehaviorAction0_3, 4.0), LRd  vert(CallBehaviorAction0_8, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(CallBehaviorAction0_3, 4.0), LRd  vert(CallBehaviorAction0_8, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ForkNode rotate -x*90 scale 24.0 translate ForkNode0_4 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_4, 4.0), LRd  vert(ForkNode0_4, 4.0), LRd  vertCenter(CallBehaviorAction0_5, ForkNode0_4, -28.0), LRd  vert(CallBehaviorAction0_5, 4.0), LRd  vert(CallBehaviorAction0_5, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_4, 4.0), LRd  vert(ForkNode0_4, 4.0), LRd/1.0  vertCenter(CallBehaviorAction0_5, ForkNode0_4, -28.0), LRd/2.0  vert(CallBehaviorAction0_5, 4.0), LRd/4.0  vert(CallBehaviorAction0_5, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_4, 4.0), LRd  vert(ForkNode0_4, 4.0), LRd  vertCenter(ForkNode0_4, Action0_6, -28.0), LRd  vert(Action0_6, 4.0), LRd  vert(Action0_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_4, 4.0), LRd  vert(ForkNode0_4, 4.0), LRd/1.0  vertCenter(ForkNode0_4, Action0_6, -28.0), LRd/2.0  vert(Action0_6, 4.0), LRd/4.0  vert(Action0_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  #local CallBehaviorAction0_5_SCALE = 0.10557;
  object { ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f scale CallBehaviorAction0_5_SCALE translate  vertexScale(CallBehaviorAction0_5, CallBehaviorAction0_5_SCALE, <145.988*CallBehaviorAction0_5_SCALE, 83.593*CallBehaviorAction0_5_SCALE, -32*CallBehaviorAction0_5_SCALE>)  }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction0_5 }
    text { ttf LabelFont, "ライフサイクル", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction0_5, <-49.630, -48.000, 30.000>) no_shadow }

    union{
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction0_5, 4.0), LRd  vert(CallBehaviorAction0_5, 4.0), LRd  vertCenter(CallBehaviorAction0_5, JoinNode0_7, -28.0), LRd  vert(JoinNode0_7, 4.0), LRd  vert(JoinNode0_7, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction0_5, 4.0), LRd  vert(CallBehaviorAction0_5, 4.0), LRd/1.0  vertCenter(CallBehaviorAction0_5, JoinNode0_7, -28.0), LRd/2.0  vert(JoinNode0_7, 4.0), LRd/4.0  vert(JoinNode0_7, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_6 }
    object { Circle_Text(LabelFont, "アクション",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_6, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action0_6, 4.0), LRd  vert(Action0_6, 4.0), LRd  vertCenter(Action0_6, JoinNode0_7, -28.0), LRd  vert(JoinNode0_7, 4.0), LRd  vert(JoinNode0_7, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action0_6, 4.0), LRd  vert(Action0_6, 4.0), LRd/1.0  vertCenter(Action0_6, JoinNode0_7, -28.0), LRd/2.0  vert(JoinNode0_7, 4.0), LRd/4.0  vert(JoinNode0_7, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { JoinNode rotate -x*90 scale 24.0 translate JoinNode0_7 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(JoinNode0_7, 4.0), LRd  vert(JoinNode0_7, 4.0), LRd  vertCenter(JoinNode0_7, JoinNode0_9, -28.0), LRd  vert(JoinNode0_9, 4.0), LRd  vert(JoinNode0_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(JoinNode0_7, 4.0), LRd  vert(JoinNode0_7, 4.0), LRd/1.0  vertCenter(JoinNode0_7, JoinNode0_9, -28.0), LRd/2.0  vert(JoinNode0_9, 4.0), LRd/4.0  vert(JoinNode0_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  #local CallBehaviorAction0_8_SCALE = 0.17910;
  object { ActivityDiagram_hbue76362ca895e31cbb57906ea3ad6f99f scale CallBehaviorAction0_8_SCALE translate  vertexScale(CallBehaviorAction0_8, CallBehaviorAction0_8_SCALE, <304.693*CallBehaviorAction0_8_SCALE, -67.794*CallBehaviorAction0_8_SCALE, -32*CallBehaviorAction0_8_SCALE>)  }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction0_8 }
    text { ttf LabelFont, "ライフ", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction0_8, <-13.270, -48.000, 30.000>) no_shadow }

    union{
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction0_8, 4.0), LRd  vert(CallBehaviorAction0_8, 4.0), LRd  vertCenter(CallBehaviorAction0_8, JoinNode0_9, -28.0), LRd  vert(JoinNode0_9, 4.0), LRd  vert(JoinNode0_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction0_8, 4.0), LRd  vert(CallBehaviorAction0_8, 4.0), LRd/1.0  vertCenter(CallBehaviorAction0_8, JoinNode0_9, -28.0), LRd/2.0  vert(JoinNode0_9, 4.0), LRd/4.0  vert(JoinNode0_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { JoinNode rotate -x*90 scale 24.0 translate JoinNode0_9 }
    union{
    sphere_sweep { linear_spline, 2,  vert(JoinNode0_9, 4.0), LRd  vert(ActivityFinal0_10, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(JoinNode0_9, 4.0), LRd  vert(ActivityFinal0_10, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal0_10 }
}
object { ActivityDiagram_ky0ce4b1c12b0b0b3b2860874e0282606b }
#declare EYE = <435, -600, -440>;
#declare FOCUS = <435, -160, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
