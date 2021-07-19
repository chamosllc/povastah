/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan ABC_B_1_概念モデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_ttq_d1720ea1a76588fd96aa2623c119cd20 = union {
object { Class rotate -x*90 scale 24  translate <159.82, -183.60, 0.00> }
 text { ttf LabelFont, "厚生年金保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <99.14, -219.60, 30.00> }
object { Class rotate -x*90 scale 24  translate <164.00, -289.69, 0.00> }
 text { ttf LabelFont, "健康保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <115.00, -325.69, 30.00> }
object { Class rotate -x*90 scale 24  translate <500.67, -289.69, 0.00> }
 text { ttf LabelFont, "都道府県", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <474.67, -325.69, 30.00> }
sphere_sweep { linear_spline, 2, 
<500.67, -289.69, 4.00>, 3.0
<164.00, -289.69, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_ttq_d1720ea1a76588fd96aa2623c119cd20 }
#declare EYE = <321.00, -240.46, -593.46>;
#declare FOCUS = <321.00, -240.46, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
