/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SocialDB_0_0_社会保険・源泉徴収税
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare UseCaseDiagram_li1_6b3ee63ed9e4a8ea99bfcc65422fdc6f = union {
cylinder {-z, z 1 texture { T_Wood10 } scale <2.6, 0.6000000000000001, 0.05> 
 texture { pigment { object { union { 
  text { ttf LabelFont "雇用保険料率を登録する", 1, 0 translate <-1, -0, 0> }
 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
 finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-1.4666666666666666, -0.5, -2>
 } scale 64  translate <383.00, -256.00, 0.00>}
cylinder {-z, z 1 texture { T_Wood10 } scale <2.6, 0.6000000000000001, 0.05> 
 texture { pigment { object { union { 
  text { ttf LabelFont "源泉徴収税額を登録する", 1, 0 translate <-1, -0, 0> }
 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
 finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-1.4666666666666666, -0.5, -2>
 } scale 64  translate <383.00, -346.67, 0.00>}
}
object { UseCaseDiagram_li1_6b3ee63ed9e4a8ea99bfcc65422fdc6f }
#declare EYE = <383.00, -301.33, -716.33>;
#declare FOCUS = <383.00, -301.33, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { UseCaseDiagramTexture }}
