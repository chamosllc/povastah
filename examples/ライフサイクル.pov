/**
 * astah* Diagram 3D Visualization
 * povastah ライフサイクル
 * created at 2021/08/06
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <194.667, 34.667, 0.000> }
    object { Circle_Text( LabelFont, " ",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <194.667, 34.667, 30.000> }
  object { Process rotate -x*90 scale 24.0 translate <194.540, -77.320, 0.000> }
    object { Circle_Text( LabelFont, "物を作る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <194.540, -77.320, 30.000> }
  object { Action rotate -x*90 scale 24.0 translate <377.450, -77.320, 0.000> }
    object { Circle_Text( LabelFont, "物を見る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <377.450, -77.320, 30.000> }
  object { Process rotate -x*90 scale 24.0 translate <583.873, -77.320, 0.000> }
    object { Circle_Text( LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <583.873, -77.320, 30.000> }
  object { Action rotate -x*90 scale 24.0 translate <756.117, -77.320, 0.000> }
    object { Circle_Text( LabelFont, "物を消す",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <756.117, -77.320, 30.000> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <756.117, -194.667, 0.000> }
    object { Circle_Text( LabelFont, " ",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <756.117, -194.667, 30.000> }
  object { ObjectNode rotate -x*90 scale 24.0 translate <459.666, -230.987, 0.000> }
    object { Circle_Text( LabelFont, ":物",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <459.666, -230.987, 30.000> }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate <471.000, -1.333, 0.000> }
    object { Circle_Text( LabelFont, " ",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <471.000, -1.333, 30.000> }
    sphere_sweep { linear_spline, 2, <194.667, 34.667, 4.000>, 3.0 <194.540, -77.320, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <194.540, -77.320, 4.000>, 3.0 <194.540, -77.320, 4.000>, 3.0 <266.667, -11.333, 4.000>, 3.0 <377.450, -77.320, 4.000>, 3.0 <377.450, -77.320, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <471.000, -1.333, 4.000>, 3.0 <471.000, -1.333, 4.000>, 3.0 <540.667, -45.333, 4.000>, 3.0 <583.873, -77.320, 4.000>, 3.0 <583.873, -77.320, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <583.873, -77.320, 4.000>, 3.0 <583.873, -77.320, 4.000>, 3.0 <465.333, -138.667, 4.000>, 3.0 <377.450, -77.320, 4.000>, 3.0 <377.450, -77.320, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <471.000, -1.333, 4.000>, 3.0 <471.000, -1.333, 4.000>, 3.0 <613.333, 3.667, 4.000>, 3.0 <756.117, -77.320, 4.000>, 3.0 <756.117, -77.320, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <756.117, -77.320, 4.000>, 3.0 <756.117, -194.667, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <194.540, -77.320, 4.000>, 3.0 <194.540, -77.320, 4.000>, 3.0 <300.667, -159.333, 4.000>, 3.0 <459.666, -230.987, 4.000>, 3.0 <459.666, -230.987, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <377.450, -77.320, 4.000>, 3.0 <459.666, -230.987, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { b_spline, 6, <583.873, -77.320, 4.000>, 3.0 <583.873, -77.320, 4.000>, 3.0 <536.667, -135.333, 4.000>, 3.0 <515.333, -174.000, 4.000>, 3.0 <459.666, -230.987, 4.000>, 3.0 <459.666, -230.987, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <756.117, -77.320, 4.000>, 3.0 <756.117, -77.320, 4.000>, 3.0 <640.667, -150.000, 4.000>, 3.0 <459.666, -230.987, 4.000>, 3.0 <459.666, -230.987, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <377.450, -77.320, 4.000>, 3.0 <471.000, -1.333, 4.000>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
}
object { ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <471.540, -341.333, -524.873>;
#declare FOCUS = <471.540, -101.333, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.000, -1000.000, -3000.000> color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
