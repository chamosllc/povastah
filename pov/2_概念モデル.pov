/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 2_概念モデル
 * created at 2021/07/09
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare PlaneTexture = texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 }
#declare LabelTecture = texture { T_Grnt15 }
#declare LinkTecture = texture { Yellow_Glass }
#declare LabelFont = "msgothic.ttc"

#declare ClassDiagram0 = union {
object { Class rotate -x*90 scale 24  translate <-167.89, -20.79, 0.00> }
 text { ttf LabelFont, "物", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-173.89, -56.79, 30.00> }
}
object { ClassDiagram0  }
#declare EYE = <-46.67, 6.14, 52.81>;
#declare FOCUS = <-46.67, 6.14, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
