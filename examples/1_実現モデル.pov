/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan 1_実現モデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_zm3_6174cfd7c659288bc9badb700978b1e1 = union {
object { Entity rotate -x*90 scale 24  translate <114.38, -235.02, 0.00> }
 text { ttf LabelFont, "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <100.03, -271.02, 30.00> }
object { Interface rotate -x*90 scale 24  translate <140.09, -147.31, 0.00> }
 text { ttf LabelFont, "Serializable", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <130.09, -183.31, 30.00> }
sphere_sweep { linear_spline, 2, 
<140.09, -147.31, 4.00>, 3.0
<114.38, -235.02, 4.00>, 3.0
  texture { RealizationTexture }}

}
object { ClassDiagram_zm3_6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <124.53, -199.33, -355.86>;
#declare FOCUS = <124.53, -199.33, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
