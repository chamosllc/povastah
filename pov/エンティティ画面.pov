/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 エンティティ画面
 * created at 2021/07/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "uml.inc"

#declare EYE = <315.17, 70.36, -385.53>;
#declare FOCUS = <315.17, 70.36, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <0, 128, -512> color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
union {
object { InitialPseudostate rotate -x*90 scale 16  translate <78.67, 264.19, 0.00> }
object { State rotate -x*90 scale 16  translate <167.33, 393.53, 0.00> }
 text { ttf "msgothic.ttc", "entity.html", 1, 0 scale 12 texture { T_Stone8 }
 translate <112.33, 365.53, -32.00> }
object { State rotate -x*90 scale 16  translate <406.00, 393.53, 0.00> }
 text { ttf "msgothic.ttc", "entityEntry.html", 1, 0 scale 12 texture { T_Stone8 }
 translate <326.00, 365.53, -32.00> }
object { State rotate -x*90 scale 16  translate <327.33, 262.86, 0.00> }
 text { ttf "msgothic.ttc", "entityList.html", 1, 0 scale 12 texture { T_Stone8 }
 translate <252.33, 234.86, -32.00> }
object { ChoicePseudostate rotate -x*90 scale 16  translate <160.00, 262.86, 0.00> }
 text { ttf "msgothic.ttc", "選択疑似状態0", 1, 0 scale 12 texture { T_Stone8 }
 translate <125.00, 234.86, -32.00> }
union {
  cylinder { <78.67, 264.19, 0.00>, <88.67, 254.19, 0.00>, 3.0 }
  cylinder { <88.67, 254.19, 0.00>, <160.00, 262.86, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <160.00, 262.86, 0.00>, <167.50, 255.36, 0.00>, 3.0 }
  cylinder { <167.50, 255.36, 0.00>, <167.33, 393.53, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <167.33, 393.53, 0.00>, <218.76, 371.71, 0.00>, 3.0 }
  cylinder { <218.76, 371.71, 0.00>, <406.00, 393.53, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <406.00, 393.53, 0.00>, <478.64, 371.71, 0.00>, 3.0 }
  cylinder { <478.64, 371.71, 0.00>, <160.00, 262.86, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
torus { 48, 3.0 rotate x*90  translate <167.33, 441.53, 0.00>  texture { T_Yellow_Glass }
}
union {
  cylinder { <167.33, 393.53, 0.00>, <218.76, 371.71, 0.00>, 3.0 }
  cylinder { <218.76, 371.71, 0.00>, <159.33, 329.19, 0.00>, 3.0 }
  cylinder { <159.33, 329.19, 0.00>, <160.00, 262.86, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <327.33, 262.86, 0.00>, <392.90, 241.04, 0.00>, 3.0 }
  cylinder { <392.90, 241.04, 0.00>, <160.00, 262.86, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <160.00, 262.86, 0.00>, <167.50, 255.36, 0.00>, 3.0 }
  cylinder { <167.50, 255.36, 0.00>, <258.67, 200.53, 0.00>, 3.0 }
  cylinder { <258.67, 200.53, 0.00>, <327.33, 262.86, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
}
