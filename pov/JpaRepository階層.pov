/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 JpaRepository階層
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
object { Boundary rotate -x*90 scale 24  translate <168.00, -371.47, 0.00> }
 text { ttf "msgothic.ttc", "JpaRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <129.00, -407.47, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <371.67, -430.80, 0.00> }
 text { ttf "msgothic.ttc", "SimpleJpaRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <314.67, -466.80, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -440.80, 0.00> }
 text { ttf "msgothic.ttc", " JpaRepositoryImplementation", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <84.00, -476.80, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -304.80, 0.00> }
 text { ttf "msgothic.ttc", " CrudRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <123.00, -340.80, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -238.14, 0.00> }
 text { ttf "msgothic.ttc", " PagingAndSortingRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <87.00, -274.14, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -170.14, 0.00> }
 text { ttf "msgothic.ttc", " Repository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <135.00, -206.14, 30.00> }
// Generalization:
sphere_sweep { linear_spline, 2, 
<168.00, -440.80, 4.00>, 3.0
<168.00, -371.47, 4.00>, 3.0
  texture { LinkTecture }
}
// Realization:
sphere_sweep { linear_spline, 2, 
<168.00, -440.80, 4.00>, 3.0
<371.67, -430.80, 4.00>, 3.0
  texture { LinkTecture }
}
// Generalization:
sphere_sweep { linear_spline, 2, 
<168.00, -371.47, 4.00>, 3.0
<168.00, -304.80, 4.00>, 3.0
  texture { LinkTecture }
}
// Generalization:
sphere_sweep { linear_spline, 2, 
<168.00, -304.80, 4.00>, 3.0
<168.00, -238.14, 4.00>, 3.0
  texture { LinkTecture }
}
// Generalization:
sphere_sweep { linear_spline, 2, 
<168.00, -238.14, 4.00>, 3.0
<168.00, -170.14, 4.00>, 3.0
  texture { LinkTecture }
}
}
object { ClassDiagram0  }
#declare EYE = <296.83, -293.21, -590.04>;
#declare FOCUS = <296.83, -293.21, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
