/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_実現モデル
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { Class rotate -x*90 scale 16  translate <130.09, -120.33, 0.00> }
 text { ttf "msgothic.ttc", "Serializable", 1, 0 scale 12 texture { T_Stone8 }
 translate <70.09, -144.33, -32.00> }
object { Entity rotate -x*90 scale 16  translate <76.03, -191.33, 0.00> }
 text { ttf "msgothic.ttc", "Entity", 1, 0 scale 12 texture { T_Stone8 }
 translate <46.03, -215.33, -32.00> }
// Realization:
sphere_sweep { linear_spline, 2, 
<130.09, -120.33, 4.00>, 3.0
<76.03, -191.33, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
}
#declare EYE = <101.54, -154.45, -255.99>;
#declare FOCUS = <101.54, -154.45, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
