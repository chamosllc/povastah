/**
 * astah* Diagram 3D Visualization
 * povastah 0_課題
 * created at 2021/07/16
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare UseCaseDiagram_32x_e76362ca895e31cbb57906ea3ad6f99f = union {
cylinder {-z, z 1 texture { T_Wood10 } scale <1.6, 0.6000000000000001, 0.05> 
 texture { pigment { object { union { 
  text { ttf LabelFont "物を取り扱う", 1, 0 translate <-1, -0, 0> }
 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
 finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-0.8, -0.5, -2>
 } scale 64  translate <233.67, -160.00, 0.00>}
}
object { UseCaseDiagram_32x_e76362ca895e31cbb57906ea3ad6f99f }
#declare EYE = <233.50, -160.00, -425.50>;
#declare FOCUS = <233.50, -160.00, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { UseCaseDiagramTexture }}
