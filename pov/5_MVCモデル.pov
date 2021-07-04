/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 5_MVCモデル
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { Boundary rotate -x*90 scale 16  translate <149.92, -222.75, 0.00> }
 text { ttf "msgothic.ttc", "EntityRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <69.92, -246.75, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <149.92, -119.25, 0.00> }
 text { ttf "msgothic.ttc", "entityView", 1, 0 scale 12 texture { T_Stone8 }
 translate <99.92, -143.25, -32.00> }
object { Control rotate -x*90 scale 16  translate <10.67, -178.33, 0.00> }
 text { ttf "msgothic.ttc", "EntityController", 1, 0 scale 12 texture { T_Stone8 }
 translate <-69.33, -202.33, -32.00> }
object { Entity rotate -x*90 scale 16  translate <303.02, -222.67, 0.00> }
 text { ttf "msgothic.ttc", "Entity", 1, 0 scale 12 texture { T_Stone8 }
 translate <273.02, -246.67, -32.00> }
// Association:
sphere_sweep { linear_spline, 2, 
<10.67, -178.33, 4.00>, 3.0
<149.92, -119.25, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Association:
sphere_sweep { linear_spline, 2, 
<10.67, -178.33, 4.00>, 3.0
<149.92, -222.75, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Association:
sphere_sweep { linear_spline, 2, 
<149.92, -222.75, 4.00>, 3.0
<303.02, -222.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
}
#declare EYE = <155.10, -156.85, -311.94>;
#declare FOCUS = <155.10, -156.85, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
