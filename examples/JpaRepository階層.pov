/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan JpaRepository階層
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_8rky_d8fb62e8a03ae894146a303b8f6f1f5e = union {
object { Boundary rotate -x*90 scale 24  translate <168.00, -161.65, -128.00> }
 text { ttf LabelFont, " Repository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <162.00, -197.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -229.65, -96.00> }
 text { ttf LabelFont, " PagingAndSortingRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <98.00, -265.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -296.31, -64.00> }
 text { ttf LabelFont, " CrudRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <146.00, -332.31, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -432.31, -0.00> }
 text { ttf LabelFont, " JpaRepositoryImplementation", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <94.00, -468.31, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <371.67, -422.31, 0.00> }
 text { ttf LabelFont, "SimpleJpaRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <313.67, -458.31, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <168.00, -362.98, -32.00> }
 text { ttf LabelFont, "JpaRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <154.00, -398.98, 30.00> }
sphere_sweep { linear_spline, 2, 
<168.00, -229.65, -92.00>, 3.0
<168.00, -161.65, -124.00>, 3.0
  texture { GeneralizationTexture }}

sphere_sweep { linear_spline, 2, 
<168.00, -296.31, -60.00>, 3.0
<168.00, -229.65, -92.00>, 3.0
  texture { GeneralizationTexture }}

sphere_sweep { linear_spline, 2, 
<168.00, -362.98, -28.00>, 3.0
<168.00, -296.31, -60.00>, 3.0
  texture { GeneralizationTexture }}

sphere_sweep { linear_spline, 2, 
<168.00, -432.31, 4.00>, 3.0
<371.67, -422.31, 4.00>, 3.0
  texture { RealizationTexture }}

sphere_sweep { linear_spline, 2, 
<168.00, -432.31, 4.00>, 3.0
<168.00, -362.98, -28.00>, 3.0
  texture { GeneralizationTexture }}

}
object { ClassDiagram_8rky_d8fb62e8a03ae894146a303b8f6f1f5e }
#declare EYE = <256.44, -297.17, -585.61>;
#declare FOCUS = <256.44, -297.17, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
