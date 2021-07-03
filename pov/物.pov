/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 物
 * created at 2021/07/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "uml.inc"

#declare EYE = <444.33, 327.33, -771.67>;
#declare FOCUS = <444.33, 327.33, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <0, 128, -512> color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
union {
object { InitialPseudostate rotate -x*90 scale 16  translate <107.33, 643.67, 0.00> }
object { IState rotate -x*90 scale 16  translate <256.67, 649.00, -16.00> }
 text { ttf "msgothic.ttc", "一時", 1, 0 scale 12 texture { T_Stone8 }
 translate <246.67, 621.00, -32.00> }
object { IState rotate -x*90 scale 16  translate <416.67, 649.00, -16.00> }
 text { ttf "msgothic.ttc", "永続", 1, 0 scale 12 texture { T_Stone8 }
 translate <406.67, 621.00, -32.00> }
object { FinalState rotate -x*90 scale 16  translate <576.67, 643.67, 0.00> }
union {
  cylinder { <107.33, 643.67, 0.00>, <117.33, 633.67, 0.00>, 3.0 }
  cylinder { <117.33, 633.67, 0.00>, <256.67, 649.00, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <256.67, 649.00, 0.00>, <284.85, 633.68, 0.00>, 3.0 }
  cylinder { <284.85, 633.68, 0.00>, <416.67, 649.00, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
torus { 48, 3.0 rotate x*90  translate <416.67, 697.00, 0.00>  texture { T_Yellow_Glass }
}
union {
  cylinder { <416.67, 649.00, 0.00>, <444.85, 633.68, 0.00>, 3.0 }
  cylinder { <444.85, 633.68, 0.00>, <576.67, 643.67, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
}
