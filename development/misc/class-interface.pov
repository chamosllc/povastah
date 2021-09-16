/**
 * astah* Diagram 3D Visualization
 * クラス図/クラスとインタフェース
 * created at 2021/09/15
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

#declare ClassDiagram_zm36174cfd7c659288bc9badb700978b1e1 = union {
#local Interface0_0 = <140.087, -152.974, 0.0>;
#local Entity0_1 = <139.552, -250.115, 0.0>;

  object { Interface rotate -x*90 scale 24.0 translate Interface0_0 }
    object { Circle_Text(LabelFont, "Serializable",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Interface0_0, 30.0)  no_shadow }
// Realization
    union{
    sphere_sweep { linear_spline, 2,  vert(Interface0_0, 4.0), LRd  vert(Entity0_1, 4.0), LRd material { RealizationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Interface0_0, 4.0), LRd  vert(Entity0_1, 4.0), 0.0 material { ShadowRealizationMaterial } no_image }
    }
  object { Entity rotate -x*90 scale 24.0 translate Entity0_1 }
    object { Circle_Text(LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Entity0_1, 30.0)  no_shadow }
}

#declare ClassDiagram_ideal = union {
#local Interface0_0 = <230, -250.115, 0.0>;
#local Entity0_1 = <230, -250.115, 0.0>;

  object { Interface rotate -x*90 scale 24.0 translate Interface0_0 }
    object { Circle_Text(LabelFont, "Serializable",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Interface0_0, 0.0)  no_shadow }
  object { Entity rotate -x*90 scale 24.0 translate Entity0_1 }
    object { Circle_Text(LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Entity0_1, 30.0)  no_shadow }
}

object { ClassDiagram_zm36174cfd7c659288bc9badb700978b1e1 }
object {ClassDiagram_ideal}
#declare EYE = <180, -340, -200>;
#declare FOCUS = <180, -220, 0>;
camera { location EYE direction 1.4*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
