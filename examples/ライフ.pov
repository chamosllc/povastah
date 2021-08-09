/**
 * astah* Diagram 3D Visualization
 * povastah ライフ
 * created at 2021/08/09
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ActivityDiagram_ei16c82e3456575d0ee46bca982933226e = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <188.540, -61.333, 0.000> }
  object { Action rotate -x*90 scale 24.0 translate <188.540, -147.320, 0.000> }
    object { Circle_Text( LabelFont, "物を見る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <188.540, -147.320, 30.000> }
  object { Action rotate -x*90 scale 24.0 translate <426.540, -147.320, 0.000> }
    object { Circle_Text( LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <426.540, -147.320, 30.000> }
  object { Action rotate -x*90 scale 24.0 translate <188.540, -246.654, 0.000> }
    object { Circle_Text( LabelFont, "物を消す",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <188.540, -246.654, 30.000> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <188.540, -324.667, 0.000> }
    sphere_sweep { linear_spline, 2, <188.540, -61.333, 4.000>, 3.0 <188.540, -147.320, 4.000>, 3.0 material { ControlFlow_ObjectFlowMaterial }}
    sphere_sweep { cubic_spline, 5, <188.540, -147.320, 4.000>, 3.0 <188.540, -147.320, 4.000>, 3.0 <294.667, -190.000, 4.000>, 3.0 <426.540, -147.320, 4.000>, 3.0 <426.540, -147.320, 4.000>, 3.0 material { ControlFlow_ObjectFlowMaterial }}
    sphere_sweep { cubic_spline, 5, <426.540, -147.320, 4.000>, 3.0 <426.540, -147.320, 4.000>, 3.0 <305.333, -90.667, 4.000>, 3.0 <188.540, -147.320, 4.000>, 3.0 <188.540, -147.320, 4.000>, 3.0 material { ControlFlow_ObjectFlowMaterial }}
    sphere_sweep { linear_spline, 2, <188.540, -147.320, 4.000>, 3.0 <188.540, -246.654, 4.000>, 3.0 material { ControlFlow_ObjectFlowMaterial }}
    sphere_sweep { linear_spline, 2, <188.540, -246.654, 4.000>, 3.0 <188.540, -324.667, 4.000>, 3.0 material { ControlFlow_ObjectFlowMaterial }}
  torus { 36.0, 3.0 translate <188.540, -147.320, -32.000>material { ControlFlow_ObjectFlowMaterial }}
}
#declare ActivityDiagram_hbue76362ca895e31cbb57906ea3ad6f99f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <192.540, -70.667, 0.000> }
    object { Circle_Text( LabelFont, "開始",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <192.540, -70.667, 30.000> }
  object { Action rotate -x*90 scale 24.0 translate <192.540, -148.654, 0.000> }
    object { Circle_Text( LabelFont, "物を作る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <192.540, -148.654, 30.000> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <192.540, -341.333, 0.000> }
    object { Circle_Text( LabelFont, "終了",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <192.540, -341.333, 30.000> }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate <340.540, -236.154, 0.000> }
  object { ActivityDiagram_ei16c82e3456575d0ee46bca982933226e scale 0.13267623546511628 translate <307.747, -208.469, -4.776>}
    text { ttf LabelFont, "物を取り扱う", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <304.000, -290.974, 31.000> }
    sphere_sweep { linear_spline, 2, <192.540, -70.667, 4.000>, 3.0 <192.540, -148.654, 4.000>, 3.0 material { ControlFlow_ObjectFlowMaterial }}
    sphere_sweep { b_spline, 6, <192.540, -148.654, 4.000>, 3.0 <192.540, -148.654, 4.000>, 3.0 <303.333, -138.000, 4.000>, 3.0 <336.000, -156.667, 4.000>, 3.0 <340.540, -236.154, 4.000>, 3.0 <340.540, -236.154, 4.000>, 3.0 material { ControlFlow_ObjectFlowMaterial }}
    sphere_sweep { cubic_spline, 5, <340.540, -236.154, 4.000>, 3.0 <340.540, -236.154, 4.000>, 3.0 <312.000, -326.000, 4.000>, 3.0 <192.540, -341.333, 4.000>, 3.0 <192.540, -341.333, 4.000>, 3.0 material { ControlFlow_ObjectFlowMaterial }}
}
object { ActivityDiagram_hbue76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <261.500, -446.167, -419.667>;
#declare FOCUS = <261.500, -206.167, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
