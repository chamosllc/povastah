/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 2_概念モデル
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { Class rotate -x*90 scale 16  translate <-221.33, 26.67, 0.00> }
 text { ttf "msgothic.ttc", "物", 1, 0 scale 12 texture { T_Stone8 }
 translate <-226.33, 2.67, -32.00> }
}
#declare EYE = <-110.67, -20.79, 89.87>;
#declare FOCUS = <-110.67, -20.79, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
