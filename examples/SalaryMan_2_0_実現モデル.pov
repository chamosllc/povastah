/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SalaryMan_2_0_実現モデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_d2ct_338bf1264de4800e684dbe1e6b16aebb = union {
object { Entity rotate -x*90 scale 24  translate <51.17, -205.26, 0.00> }
 text { ttf LabelFont, "Member", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <7.17, -241.26, 30.00> }
object { Entity rotate -x*90 scale 24  translate <182.51, -373.73, 0.00> }
 text { ttf LabelFont, "MemberDependents", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <103.83, -409.73, 30.00> }
object { Entity rotate -x*90 scale 24  translate <388.00, -351.04, 0.00> }
 text { ttf LabelFont, "MemberInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <288.00, -387.04, 30.00> }
object { Entity rotate -x*90 scale 24  translate <584.67, -358.83, 0.00> }
 text { ttf LabelFont, "ResidentTax", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <513.67, -394.83, 30.00> }
object { Entity rotate -x*90 scale 24  translate <600.60, -225.28, 0.00> }
 text { ttf LabelFont, "AdditiveFee", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <541.93, -261.28, 30.00> }
object { Entity rotate -x*90 scale 24  translate <593.51, -97.95, 0.00> }
 text { ttf LabelFont, "Reward", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <554.83, -133.95, 30.00> }
}
object { ClassDiagram_d2ct_338bf1264de4800e684dbe1e6b16aebb }
#declare EYE = <323.17, -232.17, -587.33>;
#declare FOCUS = <323.17, -232.17, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
