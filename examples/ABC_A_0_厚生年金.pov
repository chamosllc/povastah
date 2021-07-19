/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan ABC_A_0_厚生年金
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare UseCaseDiagram_1sl2_d1720ea1a76588fd96aa2623c119cd20 = union {
cylinder {-z, z 1 texture { T_Wood10 } scale <2.8000000000000003, 0.6000000000000001, 0.05> 
 texture { pigment { object { union { 
  text { ttf LabelFont "厚生年金保険料を登録する", 1, 0 translate <-1, -0, 0> }
 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
 finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-1.6, -0.5, -2>
 } scale 64  translate <318.67, -200.48, 0.00>}
object { Actor rotate -x*90 scale 24  translate <131.67, -222.48, 0.00> }
 text { ttf LabelFont, "管理者", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <113.67, -258.48, 30.00> }
sphere_sweep { linear_spline, 2, 
<318.67, -200.48, 4.00>, 3.0
<131.67, -222.48, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { UseCaseDiagram_1sl2_d1720ea1a76588fd96aa2623c119cd20 }
#declare EYE = <267.67, -220.28, -519.94>;
#declare FOCUS = <267.67, -220.28, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { UseCaseDiagramTexture }}
