/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SocialDB_1_0_概念モデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_9ciz_db2b352456412da4142b91cc0cdde115 = union {
object { Class rotate -x*90 scale 24  translate <569.34, -162.81, 0.00> }
 text { ttf LabelFont, "雇用保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <529.00, -198.81, 30.00> }
object { Class rotate -x*90 scale 24  translate <111.33, -427.23, 0.00> }
 text { ttf LabelFont, "源泉徴収税", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <64.33, -463.23, 30.00> }
}
object { ClassDiagram_9ciz_db2b352456412da4142b91cc0cdde115 }
#declare EYE = <340.83, -302.67, -675.50>;
#declare FOCUS = <340.83, -302.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
