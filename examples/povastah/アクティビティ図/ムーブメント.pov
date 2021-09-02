/**
 * astah* Diagram 3D Visualization
 * アクティビティ図/ムーブメント
 * created at 2021/09/02
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
#local InitialNode0_0 = <188.540, -61.333, 0.0>;
#local Action0_1 = <188.540, -147.320, 0.0>;
#local Action0_2 = <426.540, -147.320, 0.0>;
#local Action0_3 = <188.540, -246.654, 0.0>;
#local ActivityFinal0_4 = <188.540, -324.667, 0.0>;

  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode0_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(Action0_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(Action0_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_1 }
    object { Circle_Text(LabelFont, "物を見る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_1, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action0_1, 4.0), LRd  vert(Action0_1, 4.0), LRd  vertex(Action0_1, <106.127, -42.680, 4.000>), LRd  vert(Action0_2, 4.0), LRd  vert(Action0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action0_1, 4.0), LRd  vert(Action0_1, 4.0), LRd/1.0  vertex(Action0_1, <106.127, -42.680, 4.000>), LRd/2.0  vert(Action0_2, 4.0), LRd/4.0  vert(Action0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_1, 4.0), LRd  vert(Action0_3, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_1, 4.0), LRd  vert(Action0_3, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    torus { LOOPRd, LRd translate vert(<188.540, -147.320, 0.000>, - LOOPRd) material { ControlFlowObjectFlowMaterial } no_shadow }
  object { Action rotate -x*90 scale 24.0 translate Action0_2 }
    object { Circle_Text(LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_2, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(Action0_2, 4.0), LRd  vert(Action0_2, 4.0), LRd  vertex(Action0_2, <-121.207, 56.654, 4.000>), LRd  vert(Action0_1, 4.0), LRd  vert(Action0_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(Action0_2, 4.0), LRd  vert(Action0_2, 4.0), LRd/1.0  vertex(Action0_2, <-121.207, 56.654, 4.000>), LRd/2.0  vert(Action0_1, 4.0), LRd/4.0  vert(Action0_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_3 }
    object { Circle_Text(LabelFont, "物を消す",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_3, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_3, 4.0), LRd  vert(ActivityFinal0_4, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_3, 4.0), LRd  vert(ActivityFinal0_4, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal0_4 }
}
object { ActivityDiagram_ei16c82e3456575d0ee46bca982933226e }
#declare EYE = <300, -300, -300>;
#declare FOCUS = <300, -200, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}

