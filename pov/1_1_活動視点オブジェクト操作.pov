/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_1_活動視点オブジェクト操作
 * created at 2021/07/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "uml.inc"

#declare EYE = <440.50, 101.83, -542.33>;
#declare FOCUS = <440.50, 101.83, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <0, 128, -512> color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
union {
object { InitialNode rotate -x*90 scale 16  translate <184.67, 569.00, 0.00> }
object { Action rotate -x*90 scale 16  translate <120.00, 495.67, 0.00> }
 text { ttf "msgothic.ttc", "物を作る", 1, 0 scale 12 texture { T_Stone8 }
 translate <100.00, 467.67, -32.00> }
object { Action rotate -x*90 scale 16  translate <320.67, 465.00, 0.00> }
 text { ttf "msgothic.ttc", "物を見る", 1, 0 scale 12 texture { T_Stone8 }
 translate <300.67, 437.00, -32.00> }
object { Action rotate -x*90 scale 16  translate <465.33, 465.00, 0.00> }
 text { ttf "msgothic.ttc", "物を変える", 1, 0 scale 12 texture { T_Stone8 }
 translate <440.33, 437.00, -32.00> }
object { Action rotate -x*90 scale 16  translate <630.00, 465.00, 0.00> }
 text { ttf "msgothic.ttc", "物を消す", 1, 0 scale 12 texture { T_Stone8 }
 translate <610.00, 437.00, -32.00> }
object { ActivityFinal rotate -x*90 scale 16  translate <685.33, 357.67, 0.00> }
object { ObjectNode rotate -x*90 scale 16  translate <433.00, 344.33, 0.00> }
 text { ttf "msgothic.ttc", " : 物", 1, 0 scale 12 texture { T_Stone8 }
 translate <413.00, 316.33, -32.00> }
union {
  cylinder { <184.67, 569.00, 0.00>, <194.67, 559.00, 0.00>, 3.0 }
  cylinder { <194.67, 559.00, 0.00>, <120.00, 495.67, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <120.00, 495.67, 0.00>, <194.54, 480.35, 0.00>, 3.0 }
  cylinder { <194.54, 480.35, 0.00>, <289.33, 437.00, 0.00>, 3.0 }
  cylinder { <289.33, 437.00, 0.00>, <320.67, 465.00, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <120.00, 495.67, 0.00>, <194.54, 480.35, 0.00>, 3.0 }
  cylinder { <194.54, 480.35, 0.00>, <459.33, 497.00, 0.00>, 3.0 }
  cylinder { <459.33, 497.00, 0.00>, <465.33, 465.00, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <465.33, 465.00, 0.00>, <539.87, 449.68, 0.00>, 3.0 }
  cylinder { <539.87, 449.68, 0.00>, <493.33, 525.00, 0.00>, 3.0 }
  cylinder { <493.33, 525.00, 0.00>, <120.00, 495.67, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <320.67, 465.00, 0.00>, <386.12, 449.68, 0.00>, 3.0 }
  cylinder { <386.12, 449.68, 0.00>, <290.67, 465.00, 0.00>, 3.0 }
  cylinder { <290.67, 465.00, 0.00>, <120.00, 495.67, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <120.00, 495.67, 0.00>, <194.54, 480.35, 0.00>, 3.0 }
  cylinder { <194.54, 480.35, 0.00>, <470.67, 560.33, 0.00>, 3.0 }
  cylinder { <470.67, 560.33, 0.00>, <630.00, 465.00, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <630.00, 465.00, 0.00>, <695.45, 449.68, 0.00>, 3.0 }
  cylinder { <695.45, 449.68, 0.00>, <685.33, 357.67, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <120.00, 495.67, 0.00>, <194.54, 480.35, 0.00>, 3.0 }
  cylinder { <194.54, 480.35, 0.00>, <300.67, 383.00, 0.00>, 3.0 }
  cylinder { <300.67, 383.00, 0.00>, <433.00, 344.33, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <320.67, 465.00, 0.00>, <386.12, 449.68, 0.00>, 3.0 }
  cylinder { <386.12, 449.68, 0.00>, <433.00, 344.33, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <465.33, 465.00, 0.00>, <539.87, 449.68, 0.00>, 3.0 }
  cylinder { <539.87, 449.68, 0.00>, <536.67, 407.00, 0.00>, 3.0 }
  cylinder { <536.67, 407.00, 0.00>, <515.33, 368.33, 0.00>, 3.0 }
  cylinder { <515.33, 368.33, 0.00>, <433.00, 344.33, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <630.00, 465.00, 0.00>, <695.45, 449.68, 0.00>, 3.0 }
  cylinder { <695.45, 449.68, 0.00>, <640.67, 392.33, 0.00>, 3.0 }
  cylinder { <640.67, 392.33, 0.00>, <433.00, 344.33, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
}
