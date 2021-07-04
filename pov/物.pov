/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 物
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { InitialPseudostate rotate -x*90 scale 16  translate <107.33, -128.00, 0.00> }
object { State rotate -x*90 scale 16  translate <256.67, -122.67, 0.00> }
 text { ttf "msgothic.ttc", "一時", 1, 0 scale 12 texture { T_Stone8 }
 translate <246.67, -146.67, -32.00> }
object { State rotate -x*90 scale 16  translate <416.67, -122.67, 0.00> }
 text { ttf "msgothic.ttc", "永続", 1, 0 scale 12 texture { T_Stone8 }
 translate <406.67, -146.67, -32.00> }
object { FinalState rotate -x*90 scale 16  translate <576.67, -128.00, 0.00> }
// Transition:/ instanciate
sphere_sweep { linear_spline, 2, 
<107.33, -128.00, 4.00>, 3.0
<256.67, -122.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Transition:CREATE
sphere_sweep { linear_spline, 2, 
<256.67, -122.67, 4.00>, 3.0
<416.67, -122.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Transition:UPDATE
torus { 36, 3.0 rotate x*90  translate <416.67, -86.67, 4.00>  texture { T_Yellow_Glass }
}
// Transition:DELETE
sphere_sweep { linear_spline, 2, 
<416.67, -122.67, 4.00>, 3.0
<576.67, -128.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
}
#declare EYE = <298.33, -76.65, -374.99>;
#declare FOCUS = <298.33, -76.65, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
