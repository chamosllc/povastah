/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_0_活動視点_取り扱う
 * created at 2021/07/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "uml.inc"

#declare EYE = <229.17, 190.67, -419.83>;
#declare FOCUS = <229.17, 190.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <0, 128, -512> color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
union {
object { InitialNode rotate -x*90 scale 16  translate <178.54, 368.50, 0.00> }
object { Action rotate -x*90 scale 16  translate <114.00, 287.83, 0.00> }
 text { ttf "msgothic.ttc", "物を見る", 1, 0 scale 12 texture { T_Stone8 }
 translate <94.00, 259.83, -32.00> }
object { Action rotate -x*90 scale 16  translate <352.00, 287.83, 0.00> }
 text { ttf "msgothic.ttc", "物を変える", 1, 0 scale 12 texture { T_Stone8 }
 translate <327.00, 259.83, -32.00> }
object { Action rotate -x*90 scale 16  translate <123.09, 188.50, 0.00> }
 text { ttf "msgothic.ttc", "物を消す", 1, 0 scale 12 texture { T_Stone8 }
 translate <103.09, 160.50, -32.00> }
object { ActivityFinal rotate -x*90 scale 16  translate <178.54, 105.17, 0.00> }
union {
  cylinder { <178.54, 368.50, 0.00>, <188.54, 358.50, 0.00>, 3.0 }
  cylinder { <188.54, 358.50, 0.00>, <114.00, 287.83, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <114.00, 287.83, 0.00>, <188.54, 272.51, 0.00>, 3.0 }
  cylinder { <188.54, 272.51, 0.00>, <294.67, 229.83, 0.00>, 3.0 }
  cylinder { <294.67, 229.83, 0.00>, <352.00, 287.83, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <352.00, 287.83, 0.00>, <426.54, 272.51, 0.00>, 3.0 }
  cylinder { <426.54, 272.51, 0.00>, <305.33, 329.17, 0.00>, 3.0 }
  cylinder { <305.33, 329.17, 0.00>, <114.00, 287.83, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <114.00, 287.83, 0.00>, <188.54, 272.51, 0.00>, 3.0 }
  cylinder { <188.54, 272.51, 0.00>, <123.09, 188.50, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <123.09, 188.50, 0.00>, <188.54, 173.18, 0.00>, 3.0 }
  cylinder { <188.54, 173.18, 0.00>, <178.54, 105.17, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
torus { 48, 3.0 rotate x*90  translate <114.00, 335.83, 0.00>  texture { T_Yellow_Glass }
}
}
