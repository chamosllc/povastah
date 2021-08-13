/**
 * astah* Diagram 3D Visualization
 * 関連クラス
 * created at 2021/08/13
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

#declare ClassDiagram_1ppa6174cfd7c659288bc9badb700978b1e1 = union {
  object { Entity rotate -x*90 scale 24.0 translate <109.024, -185.467, 0.0> }
    object { Circle_Text( LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <109.024, -185.467, 30.0> }
    sphere_sweep { cubic_spline, 5, <109.024, -185.467, 4.0>, LRd <109.024, -185.467, 4.0>, LRd <229.345, -304.814, 0.0>, LRd <376.833, -174.147, 4.0>, LRd <376.833, -174.147, 4.0>, LRd material { AssociationClassMaterial } no_shadow }
  object { Class rotate -x*90 scale 24.0 translate <376.833, -174.147, 0.0> }
    object { Circle_Text( LabelFont, "Domain",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <376.833, -174.147, 30.0> }
  object { AssociationClass rotate -x*90 scale 24.0 translate <229.345, -304.814, 0.0> }
    object { Circle_Text( LabelFont, "Context",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <229.345, -304.814, 30.0> }
}
object { ClassDiagram_1ppa6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <252, -477, -401>;
#declare FOCUS = <252, -237, 0>;
camera { location EYE direction 1.8*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
