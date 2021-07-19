/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan 1_0_活動視点
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ActivityDiagram_ei_16c82e3456575d0ee46bca982933226e = union {
object { InitialNode rotate -x*90 scale 24.0 translate <188.54, -61.33, 0.00> }
object { Action rotate -x*90 scale 24.0 translate <188.54, -147.32, 0.00> }
 text { ttf LabelFont, "物を見る", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <164.54, -183.32, 30.00> }
object { Action rotate -x*90 scale 24.0 translate <426.54, -147.32, 0.00> }
 text { ttf LabelFont, "物を変える", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <396.54, -183.32, 30.00> }
object { Action rotate -x*90 scale 24.0 translate <188.54, -246.65, 0.00> }
 text { ttf LabelFont, "物を消す", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <164.54, -282.65, 30.00> }
object { ActivityFinal rotate -x*90 scale 24.0 translate <188.54, -324.67, 0.00> }
// link ControlFlow/ObjectFlow:[READ]
sphere_sweep { linear_spline, 2, 
<188.54, -61.33, 4.00>, 3.0
<188.54, -147.32, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:[UPDATE]
sphere_sweep { cubic_spline, 5, 
<188.54, -147.32, 4.00>, 3.0
<188.54, -147.32, 4.00>, 3.0
<294.67, -190.00, 4.00>, 3.0
<426.54, -147.32, 4.00>, 3.0
<426.54, -147.32, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:
sphere_sweep { cubic_spline, 5, 
<426.54, -147.32, 4.00>, 3.0
<426.54, -147.32, 4.00>, 3.0
<305.33, -90.67, 4.00>, 3.0
<188.54, -147.32, 4.00>, 3.0
<188.54, -147.32, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:[DELETE]
sphere_sweep { linear_spline, 2, 
<188.54, -147.32, 4.00>, 3.0
<188.54, -246.65, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<188.54, -246.65, 4.00>, 3.0
<188.54, -324.67, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:[READ]
torus { 36.0, 3.0 translate <188.54, -147.32, -32.00>  texture { ControlFlow_ObjectFlowTexture }}

}
#declare ActivityDiagram_hbu_e76362ca895e31cbb57906ea3ad6f99f = union {
object { InitialNode rotate -x*90 scale 24.0 translate <192.54, -70.67, 0.00> }
object { Action rotate -x*90 scale 24.0 translate <192.54, -147.32, 0.00> }
 text { ttf LabelFont, "物を作る", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <168.54, -183.32, 30.00> }
object { ActivityFinal rotate -x*90 scale 24.0 translate <192.54, -341.33, 0.00> }
object { CallBehaviorAction rotate -x*90 scale 24.0 translate <174.00, -233.05, 0.00> }
 text { ttf LabelFont, "物を取り扱う", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <138.00, -269.05, 30.00> }
object { ActivityDiagram_ei_16c82e3456575d0ee46bca982933226e scale 0.13802083333333334 translate <142.37022569444446, -206.73090277777774, -28.23> }
// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<192.54, -70.67, 4.00>, 3.0
<192.54, -147.32, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<192.54, -147.32, 4.00>, 3.0
<174.00, -233.05, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:[DELETE]
sphere_sweep { linear_spline, 2, 
<174.00, -233.05, 4.00>, 3.0
<192.54, -341.33, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

}
object { ActivityDiagram_hbu_e76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <192.50, -206.17, -430.67>;
#declare FOCUS = <192.50, -206.17, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
