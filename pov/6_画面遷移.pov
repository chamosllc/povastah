/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 6_画面遷移
 * created at 2021/07/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "uml.inc"

#declare EYE = <392.61, 133.67, -526.28>;
#declare FOCUS = <392.61, 133.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <0, 128, -512> color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
union {
object { InitialPseudostate rotate -x*90 scale 16  translate <159.11, 402.47, 0.00> }
object { State rotate -x*90 scale 16  translate <234.83, 425.61, 0.00> }
 text { ttf "msgothic.ttc", "管理者操作", 1, 0 scale 12 texture { T_Stone8 }
 translate <209.83, 397.61, -32.00> }
object { SubmachineState rotate -x*90 scale 16  translate <450.33, 429.61, 0.00> }
 text { ttf "msgothic.ttc", "Entity", 1, 0 scale 12 texture { T_Stone8 }
 translate <420.33, 401.61, -32.00> }
union {
  cylinder { <234.83, 425.61, 0.00>, <298.87, 392.47, 0.00>, 3.0 }
  cylinder { <298.87, 392.47, 0.00>, <450.33, 429.61, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <159.11, 402.47, 0.00>, <169.11, 392.47, 0.00>, 3.0 }
  cylinder { <169.11, 392.47, 0.00>, <234.83, 425.61, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
}
