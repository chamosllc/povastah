/**
 * astah* Diagram 3D Visualization
 * アクティビティ図/ライフサイクル
 * created at 2021/08/19
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"

#declare LRd = 3.2;
#declare LOOPRd = 36.0;
#declare TextScale = <16, 16, 2>;

#declare ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <194.667, 34.667, 0.00> }
    union{
    sphere_sweep { linear_spline, 2, <194.667, 34.667, 4.00>, LRd <194.540, -77.320, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <194.667, 34.667, 4.00>, LRd/0.25 <194.540, -77.320, 4.00>, LRd/0.5 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate <194.540, -77.320, 0.00> }
    object { Circle_Text( LabelFont, "物を作る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <194.540, -77.320, 30.00> }
    union{
    sphere_sweep { cubic_spline, 3, <194.540, -77.320, 4.00>, LRd <266.667, -11.333, 0.00>, LRd <377.450, -77.320, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 3, <194.540, -77.320, 4.00>, LRd/0.25 <266.667, -11.333, 0.00>, LRd/0.5 <377.450, -77.320, 4.00>, LRd/1.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 3, <194.540, -77.320, 4.00>, LRd <300.667, -159.333, 0.00>, LRd <459.666, -230.987, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 3, <194.540, -77.320, 4.00>, LRd/0.25 <300.667, -159.333, 0.00>, LRd/0.5 <459.666, -230.987, 4.00>, LRd/1.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate <377.450, -77.320, 0.00> }
    object { Circle_Text( LabelFont, "物を見る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <377.450, -77.320, 30.00> }
    union{
    sphere_sweep { cubic_spline, 2, <377.450, -77.320, 4.00>, LRd <459.666, -230.987, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 2, <377.450, -77.320, 4.00>, LRd/0.25 <459.666, -230.987, 4.00>, LRd/0.5 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 2, <377.450, -77.320, 4.00>, LRd <471.000, -1.333, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 2, <377.450, -77.320, 4.00>, LRd/0.25 <471.000, -1.333, 4.00>, LRd/0.5 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Process rotate -x*90 scale 24.0 translate <583.873, -77.320, 0.00> }
    object { Circle_Text( LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <583.873, -77.320, 30.00> }
    union{
    sphere_sweep { cubic_spline, 3, <583.873, -77.320, 4.00>, LRd <465.333, -138.667, 0.00>, LRd <377.450, -77.320, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 3, <583.873, -77.320, 4.00>, LRd/0.25 <465.333, -138.667, 0.00>, LRd/0.5 <377.450, -77.320, 4.00>, LRd/1.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2, <583.873, -77.320, 4.00>, LRd <459.666, -230.987, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <583.873, -77.320, 4.00>, LRd/0.25 <459.666, -230.987, 4.00>, LRd/0.5 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate <756.117, -77.320, 0.00> }
    object { Circle_Text( LabelFont, "物を消す",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <756.117, -77.320, 30.00> }
    union{
    sphere_sweep { cubic_spline, 2, <756.117, -77.320, 4.00>, LRd <756.117, -194.667, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 2, <756.117, -77.320, 4.00>, LRd/0.25 <756.117, -194.667, 4.00>, LRd/0.5 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 3, <756.117, -77.320, 4.00>, LRd <640.667, -150.000, 0.00>, LRd <459.666, -230.987, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 3, <756.117, -77.320, 4.00>, LRd/0.25 <640.667, -150.000, 0.00>, LRd/0.5 <459.666, -230.987, 4.00>, LRd/1.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <756.117, -194.667, 0.00> }
  object { ObjectNode rotate -x*90 scale 24.0 translate <459.666, -230.987, 0.00> }
    object { Circle_Text( LabelFont, ":物",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <459.666, -230.987, 30.00> }
  object { DecisionNodeMergeNode rotate -x*90 scale 24.0 translate <471.000, -1.333, 0.00> }
    union{
    sphere_sweep { cubic_spline, 3, <471.000, -1.333, 4.00>, LRd <613.333, 3.667, 0.00>, LRd <756.117, -77.320, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 3, <471.000, -1.333, 4.00>, LRd/0.25 <613.333, 3.667, 0.00>, LRd/0.5 <756.117, -77.320, 4.00>, LRd/1.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2, <471.000, -1.333, 4.00>, LRd <583.873, -77.320, 4.00>, LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <471.000, -1.333, 4.00>, LRd/0.25 <583.873, -77.320, 4.00>, LRd/0.5 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
}
object { ActivityDiagram_iewe76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <471, -341, -484>;
#declare FOCUS = <471, -101, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
