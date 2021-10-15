/**
 * astah* Diagram 3D Visualization
 * アクティビティ図/ムーブメント
 * created at 2021/10/06
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
#local InitialNode0_0 = <159.747, -54.667, 0.0>;
#local Action0_1 = <319.080, -214.654, 0.0 + RAISE>;
#local Action0_2 = <159.747, -214.654, 0.0 + RAISE>;
#local Action0_3 = <215.080, -296.320, 0.0 + RAISE>;
#local ActivityFinal0_4 = <159.827, -458.667, 0.0>;
#local ForkNode0_5 = <159.747, -121.833, 0.0>;
#local Action0_6 = <-8.161, -214.654, 0.0 + RAISE>;
#local Action0_7 = <-40.828, -296.320, 0.0 + RAISE>;
#local Action0_8 = <405.839, -296.320, 0.0 + RAISE>;
#local JoinNode0_9 = <159.747, -403.833, 0.0>;

  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode0_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(ForkNode0_5, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(ForkNode0_5, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_1 }
    object { Circle_Text(LabelFont, "eval sence",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_1, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_1, 4.0), LRd  vert(Action0_8, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_1, 4.0), LRd  vert(Action0_8, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 4,  vert(Action0_1, 4.0), LRd  vert(Action0_1, 4.0), LRd  vert(JoinNode0_9, 4.0), LRd  vert(JoinNode0_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 4,  vert(Action0_1, 4.0), LRd  vert(Action0_1, 4.0), LRd/1.0  vert(JoinNode0_9, 4.0), LRd/2.0  vert(JoinNode0_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_2 }
    object { Circle_Text(LabelFont, "eval needs",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_2, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_2, 4.0), LRd  vert(Action0_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_2, 4.0), LRd  vert(Action0_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 4,  vert(Action0_2, 4.0), LRd  vert(Action0_2, 4.0), LRd  vert(JoinNode0_9, 4.0), LRd  vert(JoinNode0_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 4,  vert(Action0_2, 4.0), LRd  vert(Action0_2, 4.0), LRd/1.0  vert(JoinNode0_9, 4.0), LRd/2.0  vert(JoinNode0_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_3 }
    object { Circle_Text(LabelFont, "delete",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_3, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action0_3, 4.0), LRd  vert(Action0_3, 4.0), LRd  vert(vertexCenter(Action0_3, JoinNode0_9), RAISE/4 + 4.0), LRd  vert(JoinNode0_9, 4.0), LRd  vert(JoinNode0_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action0_3, 4.0), LRd  vert(Action0_3, 4.0), LRd/1.0  vert(vertexCenter(Action0_3, JoinNode0_9), RAISE/4 + 4.0), LRd/2.0  vert(JoinNode0_9, 4.0), LRd/4.0  vert(JoinNode0_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal0_4 }
  object { ForkNode rotate -x*90 scale 24.0 translate ForkNode0_5 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_5, 4.0), LRd  vert(ForkNode0_5, 4.0), LRd  vert(vertexCenter(ForkNode0_5, Action0_1), RAISE/4 + 4.0), LRd  vert(Action0_1, 4.0), LRd  vert(Action0_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_5, 4.0), LRd  vert(ForkNode0_5, 4.0), LRd/1.0  vert(vertexCenter(ForkNode0_5, Action0_1), RAISE/4 + 4.0), LRd/2.0  vert(Action0_1, 4.0), LRd/4.0  vert(Action0_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_5, 4.0), LRd  vert(ForkNode0_5, 4.0), LRd  vert(vertexCenter(ForkNode0_5, Action0_2), RAISE/4 + 4.0), LRd  vert(Action0_2, 4.0), LRd  vert(Action0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_5, 4.0), LRd  vert(ForkNode0_5, 4.0), LRd/1.0  vert(vertexCenter(ForkNode0_5, Action0_2), RAISE/4 + 4.0), LRd/2.0  vert(Action0_2, 4.0), LRd/4.0  vert(Action0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_5, 4.0), LRd  vert(ForkNode0_5, 4.0), LRd  vert(vertexCenter(ForkNode0_5, Action0_6), RAISE/4 + 4.0), LRd  vert(Action0_6, 4.0), LRd  vert(Action0_6, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkNode0_5, 4.0), LRd  vert(ForkNode0_5, 4.0), LRd/1.0  vert(vertexCenter(ForkNode0_5, Action0_6), RAISE/4 + 4.0), LRd/2.0  vert(Action0_6, 4.0), LRd/4.0  vert(Action0_6, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_6 }
    object { Circle_Text(LabelFont, "eval attributes",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_6, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_6, 4.0), LRd  vert(Action0_7, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_6, 4.0), LRd  vert(Action0_7, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action0_6, 4.0), LRd  vert(Action0_6, 4.0), LRd  vert(vertexCenter(Action0_6, JoinNode0_9), RAISE/4 + 4.0), LRd  vert(JoinNode0_9, 4.0), LRd  vert(JoinNode0_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action0_6, 4.0), LRd  vert(Action0_6, 4.0), LRd/1.0  vert(vertexCenter(Action0_6, JoinNode0_9), RAISE/4 + 4.0), LRd/2.0  vert(JoinNode0_9, 4.0), LRd/4.0  vert(JoinNode0_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_7 }
    object { Circle_Text(LabelFont, "migrate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_7, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action0_7, 4.0), LRd  vert(Action0_7, 4.0), LRd  vert(vertexCenter(Action0_7, JoinNode0_9), RAISE/4 + 4.0), LRd  vert(JoinNode0_9, 4.0), LRd  vert(JoinNode0_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action0_7, 4.0), LRd  vert(Action0_7, 4.0), LRd/1.0  vert(vertexCenter(Action0_7, JoinNode0_9), RAISE/4 + 4.0), LRd/2.0  vert(JoinNode0_9, 4.0), LRd/4.0  vert(JoinNode0_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_8 }
    object { Circle_Text(LabelFont, "refactor",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_8, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 4,  vert(Action0_8, 4.0), LRd  vert(Action0_8, 4.0), LRd  vert(JoinNode0_9, 4.0), LRd  vert(JoinNode0_9, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 4,  vert(Action0_8, 4.0), LRd  vert(Action0_8, 4.0), LRd/1.0  vert(JoinNode0_9, 4.0), LRd/2.0  vert(JoinNode0_9, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { JoinNode rotate -x*90 scale 24.0 translate JoinNode0_9 }
    union{
    sphere_sweep { linear_spline, 2,  vert(JoinNode0_9, 4.0), LRd  vert(ActivityFinal0_4, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(JoinNode0_9, 4.0), LRd  vert(ActivityFinal0_4, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
}
object { ActivityDiagram_ei16c82e3456575d0ee46bca982933226e }
#declare EYE = <182, -496, -350>;
#declare FOCUS = <182, -256, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
