/**
 * astah* Diagram 3D Visualization
 * povastah JpaRepository階層
 * created at 2021/07/16
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_8rky_d8fb62e8a03ae894146a303b8f6f1f5e = union {
object { Boundary rotate -x*90 scale 24  translate <168.00, -371.47, -32.00> }
 text { ttf LabelFont, "JpaRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <129.00, -407.47, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <371.67, -430.80, 0.00> }
 text { ttf LabelFont, "SimpleJpaRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <314.67, -466.80, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -440.80, -0.00> }
 text { ttf LabelFont, " JpaRepositoryImplementation", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <84.00, -476.80, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -304.80, -64.00> }
 text { ttf LabelFont, " CrudRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <123.00, -340.80, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -238.14, -96.00> }
 text { ttf LabelFont, " PagingAndSortingRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <87.00, -274.14, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -170.14, -128.00> }
 text { ttf LabelFont, " Repository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <135.00, -206.14, 30.00> }
sphere_sweep { linear_spline, 2, 
<168.00, -440.80, 4.00>, 3.0
<168.00, -371.47, -28.00>, 3.0
  texture { GeneralizationTexture }
}
sphere_sweep { linear_spline, 2, 
<168.00, -440.80, 4.00>, 3.0
<371.67, -430.80, 4.00>, 3.0
  texture { RealizationTexture }
}
sphere_sweep { linear_spline, 2, 
<168.00, -371.47, -28.00>, 3.0
<168.00, -304.80, -60.00>, 3.0
  texture { GeneralizationTexture }
}
sphere_sweep { linear_spline, 2, 
<168.00, -304.80, -60.00>, 3.0
<168.00, -238.14, -92.00>, 3.0
  texture { GeneralizationTexture }
}
sphere_sweep { linear_spline, 2, 
<168.00, -238.14, -92.00>, 3.0
<168.00, -170.14, -124.00>, 3.0
  texture { GeneralizationTexture }
}
}
object { ClassDiagram_8rky_d8fb62e8a03ae894146a303b8f6f1f5e }
#declare EYE = <249.50, -305.67, -587.17>;
#declare FOCUS = <249.50, -305.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
