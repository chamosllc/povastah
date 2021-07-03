/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_0_活動視点
 * created at 2021/07/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "uml.inc"

#declare EYE = <192.50, 206.17, -398.67>;
#declare FOCUS = <192.50, 206.17, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <0, 128, -512> color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
union {
object { InitialNode rotate -x*90 scale 16  translate <182.54, 338.00, 0.00> }
object { Action rotate -x*90 scale 16  translate <118.00, 266.67, 0.00> }
 text { ttf "msgothic.ttc", "物を作る", 1, 0 scale 12 texture { T_Stone8 }
 translate <98.00, 238.67, -32.00> }
object { ActivityFinal rotate -x*90 scale 16  translate <182.54, 67.33, 0.00> }
object { CallBehaviorAction rotate -x*90 scale 16  translate <128.00, 184.67, 0.00> }
 text { ttf "msgothic.ttc", "物を取り扱う", 1, 0 scale 12 texture { T_Stone8 }
 translate <98.00, 156.67, -32.00> }
union {
  cylinder { <182.54, 338.00, 0.00>, <192.54, 328.00, 0.00>, 3.0 }
  cylinder { <192.54, 328.00, 0.00>, <118.00, 266.67, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <118.00, 266.67, 0.00>, <192.54, 251.35, 0.00>, 3.0 }
  cylinder { <192.54, 251.35, 0.00>, <128.00, 184.67, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <128.00, 184.67, 0.00>, <192.54, 161.85, 0.00>, 3.0 }
  cylinder { <192.54, 161.85, 0.00>, <182.54, 67.33, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
}
