/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan 4_JPAモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_1muq_6174cfd7c659288bc9badb700978b1e1 = union {
object { Entity rotate -x*90 scale 24  translate <358.29, -240.16, 0.00> }
 text { ttf LabelFont, "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <362.29, -276.16, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <232.82, -159.27, -32.00> }
 text { ttf LabelFont, "JpaRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <218.82, -195.27, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <232.82, -240.16, -0.00> }
 text { ttf LabelFont, "EntityRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <186.82, -276.16, 30.00> }
sphere_sweep { linear_spline, 2, 
<232.82, -240.16, 4.00>, 3.0
<358.29, -240.16, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<232.82, -240.16, 4.00>, 3.0
<232.82, -159.27, -28.00>, 3.0
  texture { GeneralizationTexture }}

}
object { ClassDiagram_1muq_6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <284.72, -204.79, -521.51>;
#declare FOCUS = <284.72, -204.79, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
