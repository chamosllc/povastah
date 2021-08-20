/**
 * astah* Diagram 3D Visualization
 * クラス図/クラスとインタフェース
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

#declare ClassDiagram_zm36174cfd7c659288bc9badb700978b1e1 = union {
  object { Interface rotate -x*90 scale 24.0 translate <140.087, -152.974, 0.00> }
    object { Circle_Text( LabelFont, "Serializable",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <140.087, -152.974, 30.00> }
    union{
    sphere_sweep { linear_spline, 2, <140.087, -152.974, 4.00>, LRd <139.552, -250.115, 4.00>, LRd material { RealizationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <140.087, -152.974, 4.00>, LRd/0.25 <139.552, -250.115, 4.00>, LRd/0.5 material { ShadowRealizationMaterial } no_image }
    }
  object { Entity rotate -x*90 scale 24.0 translate <139.552, -250.115, 0.00> }
    object { Circle_Text( LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <139.552, -250.115, 30.00> }
}
object { ClassDiagram_zm36174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <139, -460, -271>;
#declare FOCUS = <139, -220, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
