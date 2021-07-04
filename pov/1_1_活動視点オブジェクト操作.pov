/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_1_活動視点オブジェクト操作
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { InitialNode rotate -x*90 scale 16  translate <184.67, 26.67, 0.00> }
object { Action rotate -x*90 scale 16  translate <120.00, -46.67, 0.00> }
 text { ttf "msgothic.ttc", "物を作る", 1, 0 scale 12 texture { T_Stone8 }
 translate <100.00, -70.67, -32.00> }
object { Action rotate -x*90 scale 16  translate <320.67, -77.33, 0.00> }
 text { ttf "msgothic.ttc", "物を見る", 1, 0 scale 12 texture { T_Stone8 }
 translate <300.67, -101.33, -32.00> }
object { Action rotate -x*90 scale 16  translate <465.33, -77.33, 0.00> }
 text { ttf "msgothic.ttc", "物を変える", 1, 0 scale 12 texture { T_Stone8 }
 translate <440.33, -101.33, -32.00> }
object { Action rotate -x*90 scale 16  translate <630.00, -77.33, 0.00> }
 text { ttf "msgothic.ttc", "物を消す", 1, 0 scale 12 texture { T_Stone8 }
 translate <610.00, -101.33, -32.00> }
object { ActivityFinal rotate -x*90 scale 16  translate <685.33, -184.67, 0.00> }
object { ObjectNode rotate -x*90 scale 16  translate <433.00, -198.00, 0.00> }
 text { ttf "msgothic.ttc", " : 物", 1, 0 scale 12 texture { T_Stone8 }
 translate <413.00, -222.00, -32.00> }
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<184.67, 26.67, 4.00>, 3.0
<120.00, -46.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<120.00, -46.67, 4.00>, 3.0
<289.33, -105.33, 4.00>, 3.0
<320.67, -77.33, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<120.00, -46.67, 4.00>, 3.0
<459.33, -45.33, 4.00>, 3.0
<465.33, -77.33, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<465.33, -77.33, 4.00>, 3.0
<493.33, -17.33, 4.00>, 3.0
<120.00, -46.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<320.67, -77.33, 4.00>, 3.0
<290.67, -77.33, 4.00>, 3.0
<120.00, -46.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<120.00, -46.67, 4.00>, 3.0
<470.67, 18.00, 4.00>, 3.0
<630.00, -77.33, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<630.00, -77.33, 4.00>, 3.0
<685.33, -184.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:/ CREATE
sphere_sweep { linear_spline, 3, 
<120.00, -46.67, 4.00>, 3.0
<300.67, -159.33, 4.00>, 3.0
<433.00, -198.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:/ READ
sphere_sweep { linear_spline, 2, 
<320.67, -77.33, 4.00>, 3.0
<433.00, -198.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:/ UPDATE
sphere_sweep { linear_spline, 4, 
<465.33, -77.33, 4.00>, 3.0
<536.67, -135.33, 4.00>, 3.0
<515.33, -174.00, 4.00>, 3.0
<433.00, -198.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:/ DELETE
sphere_sweep { linear_spline, 3, 
<630.00, -77.33, 4.00>, 3.0
<640.67, -150.00, 4.00>, 3.0
<433.00, -198.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
}
#declare EYE = <380.45, -101.99, -482.44>;
#declare FOCUS = <380.45, -101.99, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
