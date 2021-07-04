/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_0_活動視点
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { InitialNode rotate -x*90 scale 16  translate <182.54, -60.67, 0.00> }
object { Action rotate -x*90 scale 16  translate <118.00, -132.00, 0.00> }
 text { ttf "msgothic.ttc", "物を作る", 1, 0 scale 12 texture { T_Stone8 }
 translate <98.00, -156.00, -32.00> }
object { ActivityFinal rotate -x*90 scale 16  translate <182.54, -331.33, 0.00> }
object { CallBehaviorAction rotate -x*90 scale 16  translate <128.00, -214.00, 0.00> }
 text { ttf "msgothic.ttc", "物を取り扱う", 1, 0 scale 12 texture { T_Stone8 }
 translate <98.00, -238.00, -32.00> }
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<182.54, -60.67, 4.00>, 3.0
<118.00, -132.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<118.00, -132.00, 4.00>, 3.0
<128.00, -214.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:[DELETE]
sphere_sweep { linear_spline, 2, 
<128.00, -214.00, 4.00>, 3.0
<182.54, -331.33, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
}
#declare EYE = <133.54, -175.67, -309.21>;
#declare FOCUS = <133.54, -175.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
