/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan ABC_A_1_概念モデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_663_d1720ea1a76588fd96aa2623c119cd20 = union {
object { Class rotate -x*90 scale 24  translate <159.82, -183.60, 0.00> }
 text { ttf LabelFont, "厚生年金保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <99.14, -219.60, 30.00> }
}
object { ClassDiagram_663_d1720ea1a76588fd96aa2623c119cd20 }
#declare EYE = <159.64, -183.46, -375.10>;
#declare FOCUS = <159.64, -183.46, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
