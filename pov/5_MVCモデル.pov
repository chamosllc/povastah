/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 5_MVCモデル
 * created at 2021/07/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "uml.inc"

#declare EYE = <155.17, 216.25, -371.42>;
#declare FOCUS = <155.17, 216.25, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <0, 128, -512> color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
union {
object { Boundary rotate -x*90 scale 16  translate <149.92, 148.67, 0.00> }
 text { ttf "msgothic.ttc", "EntityRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <69.92, 120.67, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <149.92, 252.17, 0.00> }
 text { ttf "msgothic.ttc", "entityView", 1, 0 scale 12 texture { T_Stone8 }
 translate <99.92, 224.17, -32.00> }
object { Control rotate -x*90 scale 16  translate <10.67, 193.08, 0.00> }
 text { ttf "msgothic.ttc", "EntityController", 1, 0 scale 12 texture { T_Stone8 }
 translate <-69.33, 165.08, -32.00> }
object { Entity rotate -x*90 scale 16  translate <303.02, 148.75, 0.00> }
 text { ttf "msgothic.ttc", "Entity", 1, 0 scale 12 texture { T_Stone8 }
 translate <273.02, 120.75, -32.00> }
union {
  cylinder { <10.67, 193.08, 0.00>, <30.67, 161.76, 0.00>, 3.0 }
  cylinder { <30.67, 161.76, 0.00>, <149.92, 252.17, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <10.67, 193.08, 0.00>, <30.67, 161.76, 0.00>, 3.0 }
  cylinder { <30.67, 161.76, 0.00>, <149.92, 148.67, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <149.92, 148.67, 0.00>, <179.92, 117.35, 0.00>, 3.0 }
  cylinder { <179.92, 117.35, 0.00>, <303.02, 148.75, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
}
