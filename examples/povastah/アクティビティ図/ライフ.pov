/**
 * astah* Diagram 3D Visualization
 * アクティビティ図/ライフ
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

// ActivityDiagram_hbue76362ca895e31cbb57906ea3ad6f99f
#local InitialNode0_0 = <192.540, -70.667, 0.0>;
#local Action0_1 = <192.540, -148.654, 0.0>;
#local ActivityFinal0_2 = <192.540, -341.333, 0.0>;
#local CallBehaviorAction0_3 = <340.540, -236.154, 0.0>;

// ActivityDiagram_ei16c82e3456575d0ee46bca982933226e
#local InitialNode1_0 = <188.540, -61.333, 0.0>;
#local Action1_1 = <188.540, -147.320, 0.0>;
#local Action1_2 = <426.540, -147.320, 0.0>;
#local Action1_3 = <188.540, -246.654, 0.0>;
#local ActivityFinal1_4 = <188.540, -324.667, 0.0>;

#declare ActivityDiagram_ei16c82e3456575d0ee46bca982933226e = union {
  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode1_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode1_0, 4.0), LRd  vert(Action1_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode1_0, 4.0), LRd  vert(Action1_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action1_1 }
    object { Circle_Text(LabelFont, "物を見る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_1, 30.0)  }
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
    object { Circle_Text(LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_2, 30.0)  }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action1_2, 4.0), LRd  vert(Action1_2, 4.0), LRd  vertex(Action1_2, <-121.207, 56.654, 4.000>), LRd  vert(Action1_1, 4.0), LRd  vert(Action1_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action1_2, 4.0), LRd  vert(Action1_2, 4.0), LRd/1.0  vertex(Action1_2, <-121.207, 56.654, 4.000>), LRd/2.0  vert(Action1_1, 4.0), LRd/4.0  vert(Action1_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action1_3 }
    object { Circle_Text(LabelFont, "物を消す",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action1_3, 30.0)  }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action1_3, 4.0), LRd  vert(ActivityFinal1_4, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action1_3, 4.0), LRd  vert(ActivityFinal1_4, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal1_4 }
}
#declare ActivityDiagram_hbue76362ca895e31cbb57906ea3ad6f99f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode0_0 }
    object { Circle_Text(LabelFont, "開始",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(InitialNode0_0, 30.0)  }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(Action0_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(Action0_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_1 }
    object { Circle_Text(LabelFont, "物を作る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_1, 30.0)  }
    union{
    sphere_sweep { cubic_spline, 6,  vert(Action0_1, 4.0), LRd  vert(Action0_1, 4.0), LRd  vertex(Action0_1, <110.793, 10.654, 4.000>), LRd  vertex(Action0_1, <143.460, -8.013, 4.000>), LRd  vert(CallBehaviorAction0_3, 4.0), LRd  vert(CallBehaviorAction0_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 6,  vert(Action0_1, 4.0), LRd  vert(Action0_1, 4.0), LRd/1.0  vertex(Action0_1, <110.793, 10.654, 4.000>), LRd/2.0  vertex(Action0_1, <143.460, -8.013, 4.000>), LRd/4.0  vert(CallBehaviorAction0_3, 4.0), LRd/8.0  vert(CallBehaviorAction0_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal0_2 }
    object { Circle_Text(LabelFont, "終了",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ActivityFinal0_2, 30.0)  }
  object { ActivityDiagram_ei16c82e3456575d0ee46bca982933226e scale 0.13267623546511628  translate vertex(CallBehaviorAction0_3, <-32.793, 22.909, -4.113>) }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate CallBehaviorAction0_3 }
    object { Circle_Text(LabelFont, "物を取り扱う",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(CallBehaviorAction0_3, 30.0)  }
    text { ttf LabelFont, "物を取り扱う", 1, 0 scale TextScale texture { LabelTecture } translate vertex(CallBehaviorAction0_3, <-40.540, -46.820, 30.000>) no_shadow }

    union{
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction0_3, 4.0), LRd  vert(CallBehaviorAction0_3, 4.0), LRd  vertex(CallBehaviorAction0_3, <-28.540, -89.846, 4.000>), LRd  vert(ActivityFinal0_2, 4.0), LRd  vert(ActivityFinal0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(CallBehaviorAction0_3, 4.0), LRd  vert(CallBehaviorAction0_3, 4.0), LRd/1.0  vertex(CallBehaviorAction0_3, <-28.540, -89.846, 4.000>), LRd/2.0  vert(ActivityFinal0_2, 4.0), LRd/4.0  vert(ActivityFinal0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
}
object { ActivityDiagram_hbue76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <300, -446, -360>;
#declare FOCUS = <300, -240, 0>;
camera { location EYE direction 1.3*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
