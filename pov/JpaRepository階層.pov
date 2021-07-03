/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 JpaRepository階層
 * created at 2021/07/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "uml.inc"

#declare EYE = <249.50, 305.67, -555.17>;
#declare FOCUS = <249.50, 305.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <0, 128, -512> color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
union {
object { Boundary rotate -x*90 scale 16  translate <158.00, 219.17, 0.00> }
 text { ttf "msgothic.ttc", "JpaRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <93.00, 191.17, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <341.67, 169.83, 0.00> }
 text { ttf "msgothic.ttc", "SimpleJpaRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <246.67, 141.83, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <158.00, 149.83, 0.00> }
 text { ttf "msgothic.ttc", " JpaRepositoryImplementation", 1, 0 scale 12 texture { T_Stone8 }
 translate <18.00, 121.83, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <158.00, 285.83, 0.00> }
 text { ttf "msgothic.ttc", " CrudRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <83.00, 257.83, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <158.00, 352.50, 0.00> }
 text { ttf "msgothic.ttc", " PagingAndSortingRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <23.00, 324.50, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <158.00, 420.50, 0.00> }
 text { ttf "msgothic.ttc", " Repository", 1, 0 scale 12 texture { T_Stone8 }
 translate <103.00, 392.50, -32.00> }
union {
  cylinder { <158.00, 149.83, 0.00>, <168.00, 206.37, 0.00>, 3.0 }
  cylinder { <168.00, 206.37, 0.00>, <158.00, 219.17, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <158.00, 149.83, 0.00>, <168.00, 137.04, 0.00>, 3.0 }
  cylinder { <168.00, 137.04, 0.00>, <341.67, 169.83, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <158.00, 219.17, 0.00>, <168.00, 273.04, 0.00>, 3.0 }
  cylinder { <168.00, 273.04, 0.00>, <158.00, 285.83, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <158.00, 285.83, 0.00>, <168.00, 339.71, 0.00>, 3.0 }
  cylinder { <168.00, 339.71, 0.00>, <158.00, 352.50, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <158.00, 352.50, 0.00>, <168.00, 407.71, 0.00>, 3.0 }
  cylinder { <168.00, 407.71, 0.00>, <158.00, 420.50, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
}
