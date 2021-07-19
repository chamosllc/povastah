/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SocialDB_2_0_実現モデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_bn8y_38ac8c559eb4c0334ac53e29c1c85735 = union {
object { Entity rotate -x*90 scale 24  translate <154.29, -239.90, 0.00> }
 text { ttf LabelFont, "EmploymentInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <47.79, -275.90, 30.00> }
object { Entity rotate -x*90 scale 24  translate <341.67, -254.99, 0.00> }
 text { ttf LabelFont, "WithholdTax", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <269.81, -290.99, 30.00> }
}
object { ClassDiagram_bn8y_38ac8c559eb4c0334ac53e29c1c85735 }
#declare EYE = <246.79, -255.17, -533.96>;
#declare FOCUS = <246.79, -255.17, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
