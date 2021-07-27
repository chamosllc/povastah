/**
 * astah* Diagram 3D Visualization
 * povastah ライフサイクル
 * created at 2021/07/27
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ActivityDiagram_iew_e76362ca895e31cbb57906ea3ad6f99f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <194.67, 16.67, 0.00> }
  object { Action rotate -x*90 scale 24.0 translate <194.54, -61.99, 0.00> }
   text { ttf LabelFont, "物を作る", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <170.54, -97.99, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <386.12, -92.65, 0.00> }
   text { ttf LabelFont, "物を見る", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <362.12, -128.65, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <539.87, -92.65, 0.00> }
   text { ttf LabelFont, "物を変える", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <509.87, -128.65, 30.00> }
  object { Action rotate -x*90 scale 24.0 translate <695.45, -92.65, 0.00> }
   text { ttf LabelFont, "物を消す", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <671.45, -128.65, 30.00> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <695.33, -194.67, 0.00> }
  object { ObjectNode rotate -x*90 scale 24.0 translate <459.67, -214.32, 0.00> }
   text { ttf LabelFont, " : 物", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <444.67, -250.32, 30.00> }
    sphere_sweep { linear_spline, 2, <194.67, 16.67, 4.00>, 3.0 <194.54, -61.99, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <194.54, -61.99, 4.00>, 3.0 <194.54, -61.99, 4.00>, 3.0 <289.33, -105.33, 4.00>, 3.0 <386.12, -92.65, 4.00>, 3.0 <386.12, -92.65, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <194.54, -61.99, 4.00>, 3.0 <194.54, -61.99, 4.00>, 3.0 <459.33, -45.33, 4.00>, 3.0 <539.87, -92.65, 4.00>, 3.0 <539.87, -92.65, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <539.87, -92.65, 4.00>, 3.0 <539.87, -92.65, 4.00>, 3.0 <493.33, -17.33, 4.00>, 3.0 <194.54, -61.99, 4.00>, 3.0 <194.54, -61.99, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <386.12, -92.65, 4.00>, 3.0 <386.12, -92.65, 4.00>, 3.0 <290.67, -77.33, 4.00>, 3.0 <194.54, -61.99, 4.00>, 3.0 <194.54, -61.99, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <194.54, -61.99, 4.00>, 3.0 <194.54, -61.99, 4.00>, 3.0 <470.67, 18.00, 4.00>, 3.0 <695.45, -92.65, 4.00>, 3.0 <695.45, -92.65, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <695.45, -92.65, 4.00>, 3.0 <695.33, -194.67, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <194.54, -61.99, 4.00>, 3.0 <194.54, -61.99, 4.00>, 3.0 <300.67, -159.33, 4.00>, 3.0 <459.67, -214.32, 4.00>, 3.0 <459.67, -214.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <386.12, -92.65, 4.00>, 3.0 <459.67, -214.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 6, <539.87, -92.65, 4.00>, 3.0 <539.87, -92.65, 4.00>, 3.0 <536.67, -135.33, 4.00>, 3.0 <515.33, -174.00, 4.00>, 3.0 <459.67, -214.32, 4.00>, 3.0 <459.67, -214.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { cubic_spline, 5, <695.45, -92.65, 4.00>, 3.0 <695.45, -92.65, 4.00>, 3.0 <640.67, -150.00, 4.00>, 3.0 <459.67, -214.32, 4.00>, 3.0 <459.67, -214.32, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
}
object { ActivityDiagram_iew_e76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <440.50, -101.83, -574.33>;
#declare FOCUS = <440.50, -101.83, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
