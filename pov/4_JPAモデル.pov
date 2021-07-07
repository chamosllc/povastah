/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 4_JPAモデル
 * created at 2021/07/07
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare PlaneTexture = texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 }
#declare LabelTecture = texture { T_Grnt15 }
#declare LinkTecture = texture { Yellow_Glass }

#declare ClassDiagram0 = union {
object { Boundary rotate -x*90 scale 24  translate <232.82, -248.65, 0.00> }
 text { ttf "msgothic.ttc", "EntityRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <184.82, -284.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <232.82, -167.76, 0.00> }
 text { ttf "msgothic.ttc", "JpaRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <193.82, -203.76, 30.00> }
object { Entity rotate -x*90 scale 24  translate <358.29, -248.65, 0.00> }
 text { ttf "msgothic.ttc", "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <340.29, -284.65, 30.00> }
// Generalization:
sphere_sweep { linear_spline, 2, 
<232.82, -248.65, 4.00>, 3.0
<232.82, -167.76, 4.00>, 3.0
  texture { LinkTecture }
}
// Association:
sphere_sweep { linear_spline, 2, 
<232.82, -248.65, 4.00>, 3.0
<358.29, -248.65, 4.00>, 3.0
  texture { LinkTecture }
}
}
object { ClassDiagram0  }
#declare EYE = <255.89, -156.59, -412.48>;
#declare FOCUS = <255.89, -156.59, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
