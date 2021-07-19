/**
 * astah* Diagram 3D Visualization
 * ロバストネス図 ロバストネス図
 * created at 2021/07/17
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_huf_1770b60079518ad3155bbc02190c9401 = union {
object { Entity rotate -x*90 scale 24  translate <497.33, -204.48, 0.00> }
 text { ttf LabelFont, "エンティティ", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <477.33, -240.48, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <360.67, -204.48, 0.00> }
 text { ttf LabelFont, "バウンダリ", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <330.67, -240.48, 30.00> }
object { Control rotate -x*90 scale 24  translate <420.67, -92.48, 0.00> }
 text { ttf LabelFont, "コントロール", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <400.67, -128.48, 30.00> }
object { Actor rotate -x*90 scale 24  translate <231.33, -204.48, 0.00> }
 text { ttf LabelFont, "アクター", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <211.33, -240.48, 30.00> }
sphere_sweep { linear_spline, 2, 
<420.67, -92.48, 4.00>, 3.0
<360.67, -204.48, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<360.67, -204.48, 4.00>, 3.0
<497.33, -204.48, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<420.67, -92.48, 4.00>, 3.0
<497.33, -204.48, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<231.33, -204.48, 4.00>, 3.0
<360.67, -204.48, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_huf_1770b60079518ad3155bbc02190c9401 }
#declare EYE = <370.83, -152.00, -554.83>;
#declare FOCUS = <370.83, -152.00, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
