/**
 * astah* Diagram 3D Visualization
 * アクティビティ図/ライフ
 * created at 2021/09/01
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

#declare ActivityDiagram_ei16c82e3456575d0ee46bca982933226e = union {
#local InitialNode1_0 = <188.540, -61.333, 0.0>;
#local Action1_1 = <188.540, -147.320, 0.0>;
#local Action1_2 = <426.540, -147.320, 0.0>;
#local Action1_3 = <188.540, -246.654, 0.0>;
#local ActivityFinal1_4 = <188.540, -324.667, 0.0>;

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
    torus { LOOPRd, LRd translate vert(<188.540, -147.320, 0.000>, - LOOPRd) material { ControlFlowObjectFlowMaterial } no_shadow }
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
#local InitialNode2_0 = <194.667, 34.667, 0.0>;
#local Process2_1 = <194.540, -77.320, 0.0>;
#local Action2_2 = <372.783, -99.987, 0.0>;
#local Process2_3 = <569.873, -111.320, 0.0>;
#local Action2_4 = <717.450, -189.320, 0.0>;
#local ActivityFinal2_5 = <717.450, -283.333, 0.0>;
#local ObjectNode2_6 = <381.000, -283.654, 0.0>;
#local DecisionNodeMergeNode2_7 = <562.333, -10.667, 0.0>;

  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode2_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode2_0, 4.0), LRd  vert(Process2_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode2_0, 4.0), LRd  vert(Process2_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate Process2_1 }
    object { Circle_Text(LabelFont, "物を作る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Process2_1, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd  vertex(Process2_1, <94.127, 69.320, 4.000>), LRd  vert(Action2_2, 4.0), LRd  vert(Action2_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd/1.0  vertex(Process2_1, <94.127, 69.320, 4.000>), LRd/2.0  vert(Action2_2, 4.0), LRd/4.0  vert(Action2_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd  vertex(Process2_1, <37.460, -140.680, 4.000>), LRd  vert(ObjectNode2_6, 4.0), LRd  vert(ObjectNode2_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process2_1, 4.0), LRd  vert(Process2_1, 4.0), LRd/1.0  vertex(Process2_1, <37.460, -140.680, 4.000>), LRd/2.0  vert(ObjectNode2_6, 4.0), LRd/4.0  vert(ObjectNode2_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action2_2 }
    object { Circle_Text(LabelFont, "物を見る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action2_2, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action2_2, 4.0), LRd  vert(ObjectNode2_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action2_2, 4.0), LRd  vert(ObjectNode2_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action2_2, 4.0), LRd  vert(DecisionNodeMergeNode2_7, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action2_2, 4.0), LRd  vert(DecisionNodeMergeNode2_7, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate Process2_3 }
    object { Circle_Text(LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Process2_3, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process2_3, 4.0), LRd  vert(Process2_3, 4.0), LRd  vertex(Process2_3, <-104.540, -27.346, 4.000>), LRd  vert(Action2_2, 4.0), LRd  vert(Action2_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process2_3, 4.0), LRd  vert(Process2_3, 4.0), LRd/1.0  vertex(Process2_3, <-104.540, -27.346, 4.000>), LRd/2.0  vert(Action2_2, 4.0), LRd/4.0  vert(Action2_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(Process2_3, 4.0), LRd  vert(ObjectNode2_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Process2_3, 4.0), LRd  vert(ObjectNode2_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action2_4 }
    object { Circle_Text(LabelFont, "物を消す",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action2_4, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action2_4, 4.0), LRd  vert(ActivityFinal2_5, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action2_4, 4.0), LRd  vert(ActivityFinal2_5, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action2_4, 4.0), LRd  vert(Action2_4, 4.0), LRd  vertex(Action2_4, <-184.117, -78.013, 4.000>), LRd  vert(ObjectNode2_6, 4.0), LRd  vert(ObjectNode2_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action2_4, 4.0), LRd  vert(Action2_4, 4.0), LRd/1.0  vertex(Action2_4, <-184.117, -78.013, 4.000>), LRd/2.0  vert(ObjectNode2_6, 4.0), LRd/4.0  vert(ObjectNode2_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal2_5 }
  object { ObjectNode rotate -x*90 scale 24.0 translate ObjectNode2_6 }
    object { Circle_Text(LabelFont, ":物",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ObjectNode2_6, 30.0)  no_shadow }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate DecisionNodeMergeNode2_7 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode2_7, 4.0), LRd  vert(DecisionNodeMergeNode2_7, 4.0), LRd  vertex(DecisionNodeMergeNode2_7, <141.000, -28.000, 4.000>), LRd  vert(Action2_4, 4.0), LRd  vert(Action2_4, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode2_7, 4.0), LRd  vert(DecisionNodeMergeNode2_7, 4.0), LRd/1.0  vertex(DecisionNodeMergeNode2_7, <141.000, -28.000, 4.000>), LRd/2.0  vert(Action2_4, 4.0), LRd/4.0  vert(Action2_4, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode2_7, 4.0), LRd  vert(Process2_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode2_7, 4.0), LRd  vert(Process2_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
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
  object { ActivityDiagram_ei16c82e3456575d0ee46bca982933226e scale 0.13267623546511628  translate vertex(CallBehaviorAction0_3, <-32.793, 22.909, -4.113>) }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction0_3 }
    object { Circle_Text(LabelFont, "物を取り扱う",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(CallBehaviorAction0_3, 30.0)  no_shadow }
    text { ttf LabelFont, "物を取り扱う", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction0_3, <-40.540, -46.820, 30.000>) no_shadow }

    union{
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction0_3, 4.0), LRd  vert(CallBehaviorAction0_3, 4.0), LRd  vertex(CallBehaviorAction0_3, <-18.540, -41.180, 4.000>), LRd  vert(ActivityFinal0_2, 4.0), LRd  vert(ActivityFinal0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction0_3, 4.0), LRd  vert(CallBehaviorAction0_3, 4.0), LRd/1.0  vertex(CallBehaviorAction0_3, <-18.540, -41.180, 4.000>), LRd/2.0  vert(ActivityFinal0_2, 4.0), LRd/4.0  vert(ActivityFinal0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f scale 0.11381701995012469  translate vertex(CallBehaviorAction0_4, <-53.499, 12.501, -3.528>) }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction0_4 }
    object { Circle_Text(LabelFont, "物を扱う",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(CallBehaviorAction0_4, 30.0)  no_shadow }
    text { ttf LabelFont, "物を扱う", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction0_4, <-22.360, -46.820, 30.000>) no_shadow }

    union{
    sphere_sweep { linear_spline, 2,  vert(CallBehaviorAction0_4, 4.0), LRd  vert(ActivityFinal0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(CallBehaviorAction0_4, 4.0), LRd  vert(ActivityFinal0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
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
#declare EYE = <241, -300, -300>;
#declare FOCUS = <241, -220, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
