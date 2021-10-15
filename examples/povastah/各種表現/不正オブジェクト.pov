/**
 * astah* Diagram 3D Visualization
 * 各種表現/不正オブジェクト
 * created at 2021/10/06
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

#declare ClassDiagram_5vga0290fd175e96d71338b24081029707b = union {
#local ConflictClass0_0 = <431.073, -293.474, 0.0>;
#local NoInstanceSpecification0_1 = <252.222, -293.320, 0.0>;

  object { ConflictClass rotate -x*90 scale 24.0 translate ConflictClass0_0 }
    object { Circle_Text(LabelFont, "ABSInterface",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ConflictClass0_0, 30.0)  no_shadow }
  object { NoInstanceSpecification rotate -x*90 scale 24.0 translate NoInstanceSpecification0_1 }
    object { Circle_Text(LabelFont, "nonsence:Diagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(NoInstanceSpecification0_1, 30.0)  no_shadow }
}
object { ClassDiagram_5vga0290fd175e96d71338b24081029707b }
#declare EYE = <329, -533, -534>;
#declare FOCUS = <329, -293, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
