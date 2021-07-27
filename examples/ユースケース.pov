/**
 * astah* Diagram 3D Visualization
 * povastah ユースケース
 * created at 2021/07/27
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare UseCaseDiagram_3rj_6174cfd7c659288bc9badb700978b1e1 = union {
cylinder {-z, z 1 texture { T_Wood10 } scale <1.6, 0.6000000000000001, 0.05> 
 texture { pigment { object { union { 
  text { ttf LabelFont "ユースケース", 1, 0 translate <-1, -0, 0> }
 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
 finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-0.375, -0.5, -2>
 } scale 64  translate <348.56, -233.67, 0.00>}
object { Actor rotate -x*90 scale 24  translate <89.33, -240.71, 0.00> }
 text { ttf LabelFont, "アクター", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <70.13, -276.71, 30.00> }
sphere_sweep { linear_spline, 2, 
<89.33, -240.71, 4.00>, 3.0
<348.56, -233.67, 4.00>, 3.0
  texture { AssociationTexture }}
}
object { UseCaseDiagram_3rj_6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <250.83, -238.83, -521.67>;
#declare FOCUS = <250.83, -238.83, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { UseCaseDiagramTexture }}
