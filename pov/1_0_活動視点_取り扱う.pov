/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_0_活動視点_取り扱う
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { InitialNode rotate -x*90 scale 16  translate <178.54, -51.33, 0.00> }
object { Action rotate -x*90 scale 16  translate <114.00, -132.00, 0.00> }
 text { ttf "msgothic.ttc", "物を見る", 1, 0 scale 12 texture { T_Stone8 }
 translate <94.00, -156.00, -32.00> }
object { Action rotate -x*90 scale 16  translate <352.00, -132.00, 0.00> }
 text { ttf "msgothic.ttc", "物を変える", 1, 0 scale 12 texture { T_Stone8 }
 translate <327.00, -156.00, -32.00> }
object { Action rotate -x*90 scale 16  translate <123.09, -231.33, 0.00> }
 text { ttf "msgothic.ttc", "物を消す", 1, 0 scale 12 texture { T_Stone8 }
 translate <103.09, -255.33, -32.00> }
object { ActivityFinal rotate -x*90 scale 16  translate <178.54, -314.67, 0.00> }
// ControlFlow/ObjectFlow:[READ]
sphere_sweep { linear_spline, 2, 
<178.54, -51.33, 4.00>, 3.0
<114.00, -132.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:[UPDATE]
sphere_sweep { linear_spline, 3, 
<114.00, -132.00, 4.00>, 3.0
<294.67, -190.00, 4.00>, 3.0
<352.00, -132.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<352.00, -132.00, 4.00>, 3.0
<305.33, -90.67, 4.00>, 3.0
<114.00, -132.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:[DELETE]
sphere_sweep { linear_spline, 2, 
<114.00, -132.00, 4.00>, 3.0
<123.09, -231.33, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<123.09, -231.33, 4.00>, 3.0
<178.54, -314.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:[READ]
torus { 36, 3.0 rotate x*90  translate <114.00, -96.00, 4.00>  texture { T_Yellow_Glass }
}
}
#declare EYE = <250.54, -167.33, -417.87>;
#declare FOCUS = <250.54, -167.33, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
