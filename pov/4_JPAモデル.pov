/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 4_JPAモデル
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { Boundary rotate -x*90 scale 16  translate <202.82, -203.18, 0.00> }
 text { ttf "msgothic.ttc", "EntityRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <122.82, -227.18, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <222.82, -132.29, 0.00> }
 text { ttf "msgothic.ttc", "JpaRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <157.82, -156.29, -32.00> }
object { Entity rotate -x*90 scale 16  translate <338.29, -203.18, 0.00> }
 text { ttf "msgothic.ttc", "Entity", 1, 0 scale 12 texture { T_Stone8 }
 translate <308.29, -227.18, -32.00> }
// Generalization:
sphere_sweep { linear_spline, 2, 
<202.82, -203.18, 4.00>, 3.0
<222.82, -132.29, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Association:
sphere_sweep { linear_spline, 2, 
<202.82, -203.18, 4.00>, 3.0
<338.29, -203.18, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
}
#declare EYE = <191.89, -147.06, -338.95>;
#declare FOCUS = <191.89, -147.06, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
