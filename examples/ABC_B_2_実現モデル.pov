/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan ABC_B_2_実現モデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_izi_d1720ea1a76588fd96aa2623c119cd20 = union {
object { Entity rotate -x*90 scale 24  translate <110.83, -245.69, 0.00> }
 text { ttf LabelFont, "AnnuityInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <38.49, -281.69, 30.00> }
object { Entity rotate -x*90 scale 24  translate <334.68, -260.78, 0.00> }
 text { ttf LabelFont, "HealthInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <200.01, -296.78, 30.00> }
}
object { ClassDiagram_izi_d1720ea1a76588fd96aa2623c119cd20 }
#declare EYE = <255.99, -261.00, -548.99>;
#declare FOCUS = <255.99, -261.00, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
