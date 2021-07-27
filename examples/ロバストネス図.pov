/**
 * astah* Diagram 3D Visualization
 * povastah ロバストネス図
 * created at 2021/07/27
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

// hierachy depth: {JpaRepository=2}
// #declare Depth = -32.0;

#declare ClassDiagram_1ppa_6174cfd7c659288bc9badb700978b1e1 = union {
object { Boundary rotate -x*90 scale 24  translate <179.92, -265.39, 0.00> }
 text { ttf LabelFont, "EntityRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <133.92, -301.39, 30.00> }
object { Control rotate -x*90 scale 24  translate <61.33, -182.31, 0.00> }
 text { ttf LabelFont, "EntityController", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <25.33, -218.31, 30.00> }
object { Entity rotate -x*90 scale 24  translate <350.36, -265.31, 0.00> }
 text { ttf LabelFont, "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <354.36, -301.31, 30.00> }
sphere_sweep { linear_spline, 2, 
<61.33, -182.31, 4.00>, 3.0
<179.92, -265.39, 4.00>, 3.0
  texture { AssociationTexture }}
sphere_sweep { linear_spline, 2, 
<179.92, -265.39, 4.00>, 3.0
<350.36, -265.31, 4.00>, 3.0
  texture { AssociationTexture }}
}
object { ClassDiagram_1ppa_6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <184.33, -223.99, -536.32>;
#declare FOCUS = <184.33, -223.99, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
