/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 4_JPAモデル
 * created at 2021/07/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "uml.inc"

#declare EYE = <271.32, 213.29, -484.61>;
#declare FOCUS = <271.32, 213.29, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <0, 128, -512> color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
union {
object { Boundary rotate -x*90 scale 16  translate <202.82, 281.43, 0.00> }
 text { ttf "msgothic.ttc", "EntityRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <122.82, 253.43, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <222.82, 352.32, 0.00> }
 text { ttf "msgothic.ttc", "JpaRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <157.82, 324.32, -32.00> }
object { Entity rotate -x*90 scale 16  translate <338.29, 281.43, 0.00> }
 text { ttf "msgothic.ttc", "Entity", 1, 0 scale 12 texture { T_Stone8 }
 translate <308.29, 253.43, -32.00> }
union {
  cylinder { <202.82, 281.43, 0.00>, <232.82, 339.53, 0.00>, 3.0 }
  cylinder { <232.82, 339.53, 0.00>, <222.82, 352.32, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <202.82, 281.43, 0.00>, <232.82, 250.11, 0.00>, 3.0 }
  cylinder { <232.82, 250.11, 0.00>, <338.29, 281.43, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
}
