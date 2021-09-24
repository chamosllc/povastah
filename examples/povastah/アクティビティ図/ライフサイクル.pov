/**
 * astah* Diagram 3D Visualization
 * アクティビティ図/ライフサイクル
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

#declare ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f = union {
#local DecisionNodeMergeNode0_0 = <481.268, -70.593, 0.0>;
#local Process0_1 = <121.475, -70.580, 0.0>;
#local Action0_2 = <284.385, -131.913, 0.0>;
#local ObjectNode0_3 = <307.935, -293.580, 0.0>;
#local InitialNode0_4 = <121.602, 24.741, 0.0>;
#local Action0_5 = <597.718, -261.900, 0.0>;
#local Process0_6 = <464.142, -177.913, 0.0>;
#local ActivityFinal0_7 = <597.718, -355.913, 0.0>;

  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate DecisionNodeMergeNode0_0 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode0_0, 4.0), LRd  vert(DecisionNodeMergeNode0_0, 4.0), LRd  vertex(DecisionNodeMergeNode0_0, <113.398, -36.667, 4.000>), LRd  vert(Action0_5, 4.0), LRd  vert(Action0_5, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode0_0, 4.0), LRd  vert(DecisionNodeMergeNode0_0, 4.0), LRd/1.0  vertex(DecisionNodeMergeNode0_0, <113.398, -36.667, 4.000>), LRd/2.0  vert(Action0_5, 4.0), LRd/4.0  vert(Action0_5, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode0_0, 4.0), LRd  vert(Process0_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode0_0, 4.0), LRd  vert(Process0_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate Process0_1 }
    object { Circle_Text(LabelFont, "物を作る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Process0_1, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process0_1, 4.0), LRd  vert(Process0_1, 4.0), LRd  vertex(Process0_1, <124.525, -14.680, 4.000>), LRd  vert(Action0_2, 4.0), LRd  vert(Action0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process0_1, 4.0), LRd  vert(Process0_1, 4.0), LRd/1.0  vertex(Process0_1, <124.525, -14.680, 4.000>), LRd/2.0  vert(Action0_2, 4.0), LRd/4.0  vert(Action0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process0_1, 4.0), LRd  vert(Process0_1, 4.0), LRd  vertex(Process0_1, <37.460, -157.346, 4.000>), LRd  vert(ObjectNode0_3, 4.0), LRd  vert(ObjectNode0_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process0_1, 4.0), LRd  vert(Process0_1, 4.0), LRd/1.0  vertex(Process0_1, <37.460, -157.346, 4.000>), LRd/2.0  vert(ObjectNode0_3, 4.0), LRd/4.0  vert(ObjectNode0_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_2 }
    object { Circle_Text(LabelFont, "物を見る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_2, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_2, 4.0), LRd  vert(ObjectNode0_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_2, 4.0), LRd  vert(ObjectNode0_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_2, 4.0), LRd  vert(DecisionNodeMergeNode0_0, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_2, 4.0), LRd  vert(DecisionNodeMergeNode0_0, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ObjectNode rotate -x*90 scale 24.0 translate ObjectNode0_3 }
    object { Circle_Text(LabelFont, ":物",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ObjectNode0_3, 30.0)  no_shadow }
  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode0_4 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_4, 4.0), LRd  vert(Process0_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_4, 4.0), LRd  vert(Process0_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_5 }
    object { Circle_Text(LabelFont, "物を消す",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_5, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_5, 4.0), LRd  vert(ActivityFinal0_7, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_5, 4.0), LRd  vert(ActivityFinal0_7, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action0_5, 4.0), LRd  vert(Action0_5, 4.0), LRd  vertex(Action0_5, <-137.450, -15.359, 4.000>), LRd  vert(ObjectNode0_3, 4.0), LRd  vert(ObjectNode0_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action0_5, 4.0), LRd  vert(Action0_5, 4.0), LRd/1.0  vertex(Action0_5, <-137.450, -15.359, 4.000>), LRd/2.0  vert(ObjectNode0_3, 4.0), LRd/4.0  vert(ObjectNode0_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate Process0_6 }
    object { Circle_Text(LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Process0_6, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process0_6, 4.0), LRd  vert(Process0_6, 4.0), LRd  vertex(Process0_6, <-94.808, 14.654, 4.000>), LRd  vert(Action0_2, 4.0), LRd  vert(Action0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process0_6, 4.0), LRd  vert(Process0_6, 4.0), LRd/1.0  vertex(Process0_6, <-94.808, 14.654, 4.000>), LRd/2.0  vert(Action0_2, 4.0), LRd/4.0  vert(Action0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(Process0_6, 4.0), LRd  vert(ObjectNode0_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Process0_6, 4.0), LRd  vert(ObjectNode0_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal0_7 }
}
object { ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <390, -400, -400>;
#declare FOCUS = <390, -200, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
