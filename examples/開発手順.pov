/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan 開発手順
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ActivityDiagram_jc7_d3ef73fcab51f5a157b1a46aa726f8d9 = union {
object { InitialNode rotate -x*90 scale 24.0 translate <130.00, -87.33, 0.00> }
object { Action rotate -x*90 scale 24.0 translate <245.55, -87.59, 0.00> }
 text { ttf LabelFont, "課題", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <233.55, -123.59, 30.00> }
 text { ttf LabelFont, "0.ユースケース図", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <233.55, -139.59, 30.00> }
object { Action rotate -x*90 scale 24.0 translate <425.56, -88.93, 0.00> }
 text { ttf LabelFont, "概念モデル", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <395.56, -124.93, 30.00> }
 text { ttf LabelFont, "1.概念クラス図", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <395.56, -140.93, 30.00> }
object { Action rotate -x*90 scale 24.0 translate <245.55, -171.26, 0.00> }
 text { ttf LabelFont, "実現モデル", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <215.55, -207.26, 30.00> }
 text { ttf LabelFont, "2.クラス図／3.ER図", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <215.55, -223.26, 30.00> }
object { Action rotate -x*90 scale 24.0 translate <425.56, -171.26, 0.00> }
 text { ttf LabelFont, "JPAモデル", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <398.56, -207.26, 30.00> }
 text { ttf LabelFont, "4.ロバストネス図", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <398.56, -223.26, 30.00> }
object { Action rotate -x*90 scale 24.0 translate <587.47, -171.26, 0.00> }
 text { ttf LabelFont, "MVCモデル", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <560.47, -207.26, 30.00> }
 text { ttf LabelFont, "5.ロバストネス図", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <560.47, -223.26, 30.00> }
object { Action rotate -x*90 scale 24.0 translate <425.56, -254.26, 0.00> }
 text { ttf LabelFont, "実装", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <413.56, -290.26, 30.00> }
 text { ttf LabelFont, "6.画面遷移／コード", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <413.56, -306.26, 30.00> }
object { ActivityFinal rotate -x*90 scale 24.0 translate <590.81, -257.33, 0.00> }
// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<130.00, -87.33, 4.00>, 3.0
<245.55, -87.59, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<245.55, -87.59, 4.00>, 3.0
<425.56, -88.93, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<425.56, -88.93, 4.00>, 3.0
<245.55, -171.26, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<245.55, -171.26, 4.00>, 3.0
<425.56, -171.26, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<425.56, -171.26, 4.00>, 3.0
<587.47, -171.26, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<587.47, -171.26, 4.00>, 3.0
<425.56, -254.26, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<425.56, -254.26, 4.00>, 3.0
<590.81, -257.33, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }}

}
object { ActivityDiagram_jc7_d3ef73fcab51f5a157b1a46aa726f8d9 }
#declare EYE = <395.00, -163.50, -590.50>;
#declare FOCUS = <395.00, -163.50, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
