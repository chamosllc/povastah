/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SocialDB_5_1_MVCモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_61bh_7b3f8aabb373497c0c74819905586e47 = union {
}
object { ClassDiagram_61bh_7b3f8aabb373497c0c74819905586e47 }
#declare EYE = <0.00, -0.00, -256.00>;
#declare FOCUS = <0.00, -0.00, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
