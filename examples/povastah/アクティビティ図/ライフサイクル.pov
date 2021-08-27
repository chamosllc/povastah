/**
 * astah* Diagram 3D Visualization
 * アクティビティ図/ライフサイクル
 * created at 2021/08/27
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

// ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f
#local InitialNode0_0 = <194.667, 34.667, 0.0>;
#local Process0_1 = <194.540, -77.320, 0.0>;
#local Action0_2 = <377.450, -77.320, 0.0>;
#local Process0_3 = <583.873, -77.320, 0.0>;
#local Action0_4 = <756.117, -77.320, 0.0>;
#local ActivityFinal0_5 = <756.117, -194.667, 0.0>;
#local ObjectNode0_6 = <459.666, -230.987, 0.0>;
#local DecisionNodeMergeNode0_7 = <471.000, -1.333, 0.0>;

#declare ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode0_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(Process0_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(Process0_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate Process0_1 }
    object { Circle_Text(LabelFont, "物を作る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Process0_1, 30.0)  }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process0_1, 4.0), LRd  vert(Process0_1, 4.0), LRd  vertex(Process0_1, <72.127, 65.987, 4.000>), LRd  vert(Action0_2, 4.0), LRd  vert(Action0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process0_1, 4.0), LRd  vert(Process0_1, 4.0), LRd/1.0  vertex(Process0_1, <72.127, 65.987, 4.000>), LRd/2.0  vert(Action0_2, 4.0), LRd/4.0  vert(Action0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process0_1, 4.0), LRd  vert(Process0_1, 4.0), LRd  vertex(Process0_1, <106.127, -82.013, 4.000>), LRd  vert(ObjectNode0_6, 4.0), LRd  vert(ObjectNode0_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process0_1, 4.0), LRd  vert(Process0_1, 4.0), LRd/1.0  vertex(Process0_1, <106.127, -82.013, 4.000>), LRd/2.0  vert(ObjectNode0_6, 4.0), LRd/4.0  vert(ObjectNode0_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_2 }
    object { Circle_Text(LabelFont, "物を見る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_2, 30.0)  }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_2, 4.0), LRd  vert(ObjectNode0_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_2, 4.0), LRd  vert(ObjectNode0_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_2, 4.0), LRd  vert(DecisionNodeMergeNode0_7, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_2, 4.0), LRd  vert(DecisionNodeMergeNode0_7, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate Process0_3 }
    object { Circle_Text(LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Process0_3, 30.0)  }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Process0_3, 4.0), LRd  vert(Process0_3, 4.0), LRd  vertex(Process0_3, <-118.540, -61.346, 4.000>), LRd  vert(Action0_2, 4.0), LRd  vert(Action0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Process0_3, 4.0), LRd  vert(Process0_3, 4.0), LRd/1.0  vertex(Process0_3, <-118.540, -61.346, 4.000>), LRd/2.0  vert(Action0_2, 4.0), LRd/4.0  vert(Action0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(Process0_3, 4.0), LRd  vert(ObjectNode0_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Process0_3, 4.0), LRd  vert(ObjectNode0_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_4 }
    object { Circle_Text(LabelFont, "物を消す",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_4, 30.0)  }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_4, 4.0), LRd  vert(ActivityFinal0_5, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_4, 4.0), LRd  vert(ActivityFinal0_5, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action0_4, 4.0), LRd  vert(Action0_4, 4.0), LRd  vertex(Action0_4, <-115.450, -72.680, 4.000>), LRd  vert(ObjectNode0_6, 4.0), LRd  vert(ObjectNode0_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action0_4, 4.0), LRd  vert(Action0_4, 4.0), LRd/1.0  vertex(Action0_4, <-115.450, -72.680, 4.000>), LRd/2.0  vert(ObjectNode0_6, 4.0), LRd/4.0  vert(ObjectNode0_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal0_5 }
  object { ObjectNode rotate -x*90 scale 24.0 translate ObjectNode0_6 }
    object { Circle_Text(LabelFont, ":物",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ObjectNode0_6, 30.0)  }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate DecisionNodeMergeNode0_7 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode0_7, 4.0), LRd  vert(DecisionNodeMergeNode0_7, 4.0), LRd  vertex(DecisionNodeMergeNode0_7, <142.333, 5.000, 4.000>), LRd  vert(Action0_4, 4.0), LRd  vert(Action0_4, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(DecisionNodeMergeNode0_7, 4.0), LRd  vert(DecisionNodeMergeNode0_7, 4.0), LRd/1.0  vertex(DecisionNodeMergeNode0_7, <142.333, 5.000, 4.000>), LRd/2.0  vert(Action0_4, 4.0), LRd/4.0  vert(Action0_4, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode0_7, 4.0), LRd  vert(Process0_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(DecisionNodeMergeNode0_7, 4.0), LRd  vert(Process0_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
}
object { ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <471, -341, -484>;
#declare FOCUS = <471, -101, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
