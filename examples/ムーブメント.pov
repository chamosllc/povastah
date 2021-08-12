/**
 * astah* Diagram 3D Visualization
 * povastah ムーブメント
 * created at 2021/08/12
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare LRd = 3.2;
#declare LOOPRd = 36.0;
#declare TextScale = <16, 16, 2>;

#declare ActivityDiagram_ei16c82e3456575d0ee46bca982933226e = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <188.540, -61.333, 0.0> }
  object { Action rotate -x*90 scale 24.0 translate <188.540, -147.320, 0.0> }
    object { Circle_Text( LabelFont, "物を見る",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <188.540, -147.320, 30.0> }
  object { Action rotate -x*90 scale 24.0 translate <426.540, -147.320, 0.0> }
    object { Circle_Text( LabelFont, "物を変える",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <426.540, -147.320, 30.0> }
  object { Action rotate -x*90 scale 24.0 translate <188.540, -246.654, 0.0> }
    object { Circle_Text( LabelFont, "物を消す",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <188.540, -246.654, 30.0> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <188.540, -324.667, 0.0> }
    sphere_sweep { linear_spline, 2, <188.540, -61.333, 4.0>, LRd <188.540, -147.320, 4.0>, LRd material { ControlFlow_ObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <188.540, -61.333, 4.0>, LRd <188.540, -147.320, 4.0>, 0.0 material { ControlFlow_ObjectFlowMaterial } no_image }
    sphere_sweep { cubic_spline, 5, <188.540, -147.320, 4.0>, LRd <188.540, -147.320, 4.0>, LRd <294.667, -190.000, 4.0>, LRd <426.540, -147.320, 4.0>, LRd <426.540, -147.320, 4.0>, LRd material { ControlFlow_ObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <188.540, -147.320, 4.0>, LRd <188.540, -147.320, 4.0>, LRd <294.667, -190.000, 4.0>, LRd/2.0 <426.540, -147.320, 4.0>, 0.0 <426.540, -147.320, 4.0>, 0.0 material { ControlFlow_ObjectFlowMaterial } no_image }
    sphere_sweep { cubic_spline, 5, <426.540, -147.320, 4.0>, LRd <426.540, -147.320, 4.0>, LRd <305.333, -90.667, 4.0>, LRd <188.540, -147.320, 4.0>, LRd <188.540, -147.320, 4.0>, LRd material { ControlFlow_ObjectFlowMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <426.540, -147.320, 4.0>, LRd <426.540, -147.320, 4.0>, LRd <305.333, -90.667, 4.0>, LRd/2.0 <188.540, -147.320, 4.0>, 0.0 <188.540, -147.320, 4.0>, 0.0 material { ControlFlow_ObjectFlowMaterial } no_image }
    sphere_sweep { linear_spline, 2, <188.540, -147.320, 4.0>, LRd <188.540, -246.654, 4.0>, LRd material { ControlFlow_ObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <188.540, -147.320, 4.0>, LRd <188.540, -246.654, 4.0>, 0.0 material { ControlFlow_ObjectFlowMaterial } no_image }
    sphere_sweep { linear_spline, 2, <188.540, -246.654, 4.0>, LRd <188.540, -324.667, 4.0>, LRd material { ControlFlow_ObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <188.540, -246.654, 4.0>, LRd <188.540, -324.667, 4.0>, 0.0 material { ControlFlow_ObjectFlowMaterial } no_image }
    torus { LOOPRd, LRd translate<188.54000000000002, -147.3203125, 4.0 - LOOPRd> material { ControlFlow_ObjectFlowMaterial } no_shadow }
}
object { ActivityDiagram_ei16c82e3456575d0ee46bca982933226e }
#declare EYE = <280, -480, -300>;
#declare FOCUS = <280, -240, 0>;
camera { location EYE direction 1.5*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
