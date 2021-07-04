/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 JpaRepository階層
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { Boundary rotate -x*90 scale 16  translate <158.00, -336.00, 0.00> }
 text { ttf "msgothic.ttc", "JpaRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <93.00, -360.00, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <341.67, -385.33, 0.00> }
 text { ttf "msgothic.ttc", "SimpleJpaRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <246.67, -409.33, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <158.00, -405.33, 0.00> }
 text { ttf "msgothic.ttc", " JpaRepositoryImplementation", 1, 0 scale 12 texture { T_Stone8 }
 translate <18.00, -429.33, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <158.00, -269.33, 0.00> }
 text { ttf "msgothic.ttc", " CrudRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <83.00, -293.33, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <158.00, -202.67, 0.00> }
 text { ttf "msgothic.ttc", " PagingAndSortingRepository", 1, 0 scale 12 texture { T_Stone8 }
 translate <23.00, -226.67, -32.00> }
object { Boundary rotate -x*90 scale 16  translate <158.00, -134.67, 0.00> }
 text { ttf "msgothic.ttc", " Repository", 1, 0 scale 12 texture { T_Stone8 }
 translate <103.00, -158.67, -32.00> }
// Generalization:
sphere_sweep { linear_spline, 2, 
<158.00, -405.33, 4.00>, 3.0
<158.00, -336.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Realization:
sphere_sweep { linear_spline, 2, 
<158.00, -405.33, 4.00>, 3.0
<341.67, -385.33, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Generalization:
sphere_sweep { linear_spline, 2, 
<158.00, -336.00, 4.00>, 3.0
<158.00, -269.33, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Generalization:
sphere_sweep { linear_spline, 2, 
<158.00, -269.33, 4.00>, 3.0
<158.00, -202.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Generalization:
sphere_sweep { linear_spline, 2, 
<158.00, -202.67, 4.00>, 3.0
<158.00, -134.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
}
#declare EYE = <232.83, -238.14, -470.97>;
#declare FOCUS = <232.83, -238.14, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
