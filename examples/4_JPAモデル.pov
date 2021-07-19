/**
 * astah* Diagram 3D Visualization
 * povastah 4_JPAモデル
 * created at 2021/07/16
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_1muq_6174cfd7c659288bc9badb700978b1e1 = union {
object { Boundary rotate -x*90 scale 24  translate <232.82, -248.65, -0.00> }
 text { ttf LabelFont, "EntityRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <184.82, -284.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <232.82, -167.76, -32.00> }
 text { ttf LabelFont, "JpaRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <193.82, -203.76, 30.00> }
object { Entity rotate -x*90 scale 24  translate <358.29, -248.65, 0.00> }
 text { ttf LabelFont, "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <340.29, -284.65, 30.00> }
sphere_sweep { linear_spline, 2, 
<232.82, -248.65, 4.00>, 3.0
<232.82, -167.76, -28.00>, 3.0
  texture { GeneralizationTexture }
}
sphere_sweep { linear_spline, 2, 
<232.82, -248.65, 4.00>, 3.0
<358.29, -248.65, 4.00>, 3.0
  texture { AssociationTexture }
}
}
object { ClassDiagram_1muq_6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <271.32, -213.29, -516.61>;
#declare FOCUS = <271.32, -213.29, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
