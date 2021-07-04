/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 6_画面遷移
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { InitialPseudostate rotate -x*90 scale 16  translate <159.11, -123.81, 0.00> }
object { State rotate -x*90 scale 16  translate <234.83, -100.67, 0.00> }
 text { ttf "msgothic.ttc", "管理者操作", 1, 0 scale 12 texture { T_Stone8 }
 translate <209.83, -124.67, -32.00> }
object { SubmachineState rotate -x*90 scale 16  translate <450.33, -96.67, 0.00> }
 text { ttf "msgothic.ttc", "Entity", 1, 0 scale 12 texture { T_Stone8 }
 translate <420.33, -120.67, -32.00> }
// Transition:[entity]
sphere_sweep { linear_spline, 2, 
<234.83, -100.67, 4.00>, 3.0
<450.33, -96.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Transition:
sphere_sweep { linear_spline, 2, 
<159.11, -123.81, 4.00>, 3.0
<234.83, -100.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
}
#declare EYE = <312.98, -85.47, -398.45>;
#declare FOCUS = <312.98, -85.47, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
