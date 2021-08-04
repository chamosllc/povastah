/**
 * astah* Diagram 3D Visualization
 * povastah ライフ
 * created at 2021/08/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ActivityDiagram_ei16c82e3456575d0ee46bca982933226e = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <188.54, -61.33, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <188.54, -61.33, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <188.54, -147.32, 0.00> }
    object { Circle_Text( LabelFont, "物を見る", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <188.54, -147.32, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <426.54, -147.32, 0.00> }
    object { Circle_Text( LabelFont, "物を変える", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <426.54, -147.32, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <188.54, -246.65, 0.00> }
    object { Circle_Text( LabelFont, "物を消す", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <188.54, -246.65, 30.00> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <188.54, -324.67, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <188.54, -324.67, 30.00> }
    sphere_sweep { linear_spline, 2, <188.54, -61.33, 4.00>, 3.0 <188.54, -147.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <188.54, -147.32, 4.00>, 3.0 <188.54, -147.32, 4.00>, 3.0 <294.67, -190.00, 4.00>, 3.0 <426.54, -147.32, 4.00>, 3.0 <426.54, -147.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <426.54, -147.32, 4.00>, 3.0 <426.54, -147.32, 4.00>, 3.0 <305.33, -90.67, 4.00>, 3.0 <188.54, -147.32, 4.00>, 3.0 <188.54, -147.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <188.54, -147.32, 4.00>, 3.0 <188.54, -246.65, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <188.54, -246.65, 4.00>, 3.0 <188.54, -324.67, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
  torus { 36.0, 3.0 translate <188.54, -147.32, -32.00>texture { ControlFlow_ObjectFlowTexture }}
}
#declare ActivityDiagram_hbue76362ca895e31cbb57906ea3ad6f99f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <192.54, -70.67, 0.00> }
    object { Circle_Text( LabelFont, "開始", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <192.54, -70.67, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <192.54, -148.65, 0.00> }
    object { Circle_Text( LabelFont, "物を作る", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <192.54, -148.65, 30.00> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <192.54, -341.33, 0.00> }
    object { Circle_Text( LabelFont, "終了", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <192.54, -341.33, 30.00> }
  object { CallBehaviorAction rotate -x*90 scale 24.0 translate <340.54, -236.15, 0.00> }
  object { ActivityDiagram_ei16c82e3456575d0ee46bca982933226e scale 0.1481838474025974 translate <306.5812016369047, -207.89992559523807, -29.23> }
    text { ttf LabelFont, "物を取り扱う", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <304.00, -290.97, 31.00> }
    sphere_sweep { linear_spline, 2, <192.54, -70.67, 4.00>, 3.0 <192.54, -148.65, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { b_spline, 6, <192.54, -148.65, 4.00>, 3.0 <192.54, -148.65, 4.00>, 3.0 <303.33, -138.00, 4.00>, 3.0 <336.00, -156.67, 4.00>, 3.0 <340.54, -236.15, 4.00>, 3.0 <340.54, -236.15, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <340.54, -236.15, 4.00>, 3.0 <340.54, -236.15, 4.00>, 3.0 <312.00, -326.00, 4.00>, 3.0 <192.54, -341.33, 4.00>, 3.0 <192.54, -341.33, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
}
object { ActivityDiagram_hbue76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <261.50, -446.17, -419.67>;
#declare FOCUS = <261.50, -206.17, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
