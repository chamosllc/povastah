/**
 * astah* Diagram 3D Visualization
 * povastah ライフサイクル
 * created at 2021/08/05
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <194.67, 34.67, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <194.67, 34.67, 30.00> }
  object { Process rotate -x*90 scale 24.0 translate <194.54, -77.32, 0.00> }
    object { Circle_Text( LabelFont, "物を作る", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <194.54, -77.32, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <377.45, -77.32, 0.00> }
    object { Circle_Text( LabelFont, "物を見る", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <377.45, -77.32, 30.00> }
  object { Process rotate -x*90 scale 24.0 translate <583.87, -77.32, 0.00> }
    object { Circle_Text( LabelFont, "物を変える", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <583.87, -77.32, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <756.12, -77.32, 0.00> }
    object { Circle_Text( LabelFont, "物を消す", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <756.12, -77.32, 30.00> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <756.12, -194.67, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <756.12, -194.67, 30.00> }
  object { ObjectNode rotate -x*90 scale 24.0 translate <459.67, -230.99, 0.00> }
    object { Circle_Text( LabelFont, ":物", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <459.67, -230.99, 30.00> }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate <471.00, -1.33, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <471.00, -1.33, 30.00> }
    sphere_sweep { linear_spline, 2, <194.67, 34.67, 4.00>, 3.0 <194.54, -77.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <194.54, -77.32, 4.00>, 3.0 <194.54, -77.32, 4.00>, 3.0 <266.67, -11.33, 4.00>, 3.0 <377.45, -77.32, 4.00>, 3.0 <377.45, -77.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <471.00, -1.33, 4.00>, 3.0 <471.00, -1.33, 4.00>, 3.0 <540.67, -45.33, 4.00>, 3.0 <583.87, -77.32, 4.00>, 3.0 <583.87, -77.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <583.87, -77.32, 4.00>, 3.0 <583.87, -77.32, 4.00>, 3.0 <465.33, -138.67, 4.00>, 3.0 <377.45, -77.32, 4.00>, 3.0 <377.45, -77.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <471.00, -1.33, 4.00>, 3.0 <471.00, -1.33, 4.00>, 3.0 <613.33, 3.67, 4.00>, 3.0 <756.12, -77.32, 4.00>, 3.0 <756.12, -77.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <756.12, -77.32, 4.00>, 3.0 <756.12, -194.67, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <194.54, -77.32, 4.00>, 3.0 <194.54, -77.32, 4.00>, 3.0 <300.67, -159.33, 4.00>, 3.0 <459.67, -230.99, 4.00>, 3.0 <459.67, -230.99, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <377.45, -77.32, 4.00>, 3.0 <459.67, -230.99, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { b_spline, 6, <583.87, -77.32, 4.00>, 3.0 <583.87, -77.32, 4.00>, 3.0 <536.67, -135.33, 4.00>, 3.0 <515.33, -174.00, 4.00>, 3.0 <459.67, -230.99, 4.00>, 3.0 <459.67, -230.99, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <756.12, -77.32, 4.00>, 3.0 <756.12, -77.32, 4.00>, 3.0 <640.67, -150.00, 4.00>, 3.0 <459.67, -230.99, 4.00>, 3.0 <459.67, -230.99, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <377.45, -77.32, 4.00>, 3.0 <471.00, -1.33, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
}
object { ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <471.54, -341.33, -524.87>;
#declare FOCUS = <471.54, -101.33, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
