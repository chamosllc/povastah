/**
 * astah* Diagram 3D Visualization
 * クラス図/関連クラス
 * created at 2021/09/08
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"

#local LRd = 3.2;
#local LOOPRd = 36.0;
#local TextScale = <16, 16, 2>;

#declare ClassDiagram_1ppa6174cfd7c659288bc9badb700978b1e1 = union {
#local Entity0_0 = <109.024, -185.467, 0.0>;
#local Class0_1 = <376.833, -174.147, 0.0>;
#local AssociationClass0_2 = <229.345, -304.814, 0.0>;

  object { Entity rotate -x*90 scale 24.0 translate Entity0_0 }
    object { Circle_Text(LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Entity0_0, 30.0)  no_shadow }
// AssociationClass
    sphere_sweep { cubic_spline, 5, Entity0_0, LRd Entity0_0, LRd <229.345, -304.814, 0.000>, LRd Class0_1, LRd Class0_1, LRd material { AssociationClassMaterial } no_shadow }
  object { Class rotate -x*90 scale 24.0 translate Class0_1 }
    object { Circle_Text(LabelFont, "Domain",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_1, 30.0)  no_shadow }
  object { AssociationClass rotate -x*90 scale 24.0 translate AssociationClass0_2 }
    object { Circle_Text(LabelFont, "Context",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(AssociationClass0_2, 30.0)  no_shadow }
}
object { ClassDiagram_1ppa6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <252, -477, -401>;
#declare FOCUS = <252, -237, 0>;
camera { location EYE direction 1.8*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
