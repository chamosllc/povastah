/**
 * astah* Diagram 3D Visualization
 * povastah ロバストネス図
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

#declare ClassDiagram_1ppa6174cfd7c659288bc9badb700978b1e1 = union {
  object { Boundary rotate -x*90 scale 24.0 translate <179.917, -265.391, 0.0> }
    object { Circle_Text( LabelFont, "EntityRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <179.917, -265.391, 30.0> }
  object { Control rotate -x*90 scale 24.0 translate <61.333, -182.307, 0.0> }
    object { Circle_Text( LabelFont, "EntityController",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <61.333, -182.307, 30.0> }
  object { Entity rotate -x*90 scale 24.0 translate <350.357, -265.307, 0.0> }
    object { Circle_Text( LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <350.357, -265.307, 30.0> }
    sphere_sweep { linear_spline, 2, <61.333, -182.307, 4.0>, LRd <179.917, -265.391, 4.0>, LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <61.333, -182.307, 4.0>, LRd <179.917, -265.391, 4.0>, 0.0 material { AssociationMaterial } no_image }
    sphere_sweep { linear_spline, 2, <179.917, -265.391, 4.0>, LRd <350.357, -265.307, 4.0>, LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <179.917, -265.391, 4.0>, LRd <350.357, -265.307, 4.0>, 0.0 material { AssociationMaterial } no_image }
}
object { ClassDiagram_1ppa6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <200, -500, -240>;
#declare FOCUS = <200, -240, 0>;
camera { location EYE direction 1.2*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
