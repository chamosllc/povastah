/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_実現モデル
 * created at 2021/07/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "uml.inc"

#declare EYE = <139.53, 214.83, -354.36>;
#declare FOCUS = <139.53, 214.83, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <0, 128, -512> color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
union {
object { Class rotate -x*90 scale 16  translate <130.09, 234.03, 0.00> }
 text { ttf "msgothic.ttc", "Serializable", 1, 0 scale 12 texture { T_Stone8 }
 translate <70.09, 206.03, -32.00> }
object { Entity rotate -x*90 scale 16  translate <76.03, 163.03, 0.00> }
 text { ttf "msgothic.ttc", "Entity", 1, 0 scale 12 texture { T_Stone8 }
 translate <46.03, 135.03, -32.00> }
union {
  cylinder { <130.09, 234.03, 0.00>, <140.09, 221.23, 0.00>, 3.0 }
  cylinder { <140.09, 221.23, 0.00>, <76.03, 163.03, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
}
