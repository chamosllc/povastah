/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan 5_MVCモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_1ppa_6174cfd7c659288bc9badb700978b1e1 = union {
object { Entity rotate -x*90 scale 24  translate <323.02, -259.65, 0.00> }
 text { ttf LabelFont, "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <327.02, -295.65, 30.00> }
object { Control rotate -x*90 scale 24  translate <30.67, -215.31, 0.00> }
 text { ttf LabelFont, "EntityController", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-5.33, -251.31, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <179.92, -156.23, 0.00> }
 text { ttf LabelFont, "entityView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <157.92, -192.23, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <179.92, -259.73, 0.00> }
 text { ttf LabelFont, "EntityRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <133.92, -295.73, 30.00> }
sphere_sweep { linear_spline, 2, 
<179.92, -259.73, 4.00>, 3.0
<323.02, -259.65, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<30.67, -215.31, 4.00>, 3.0
<179.92, -259.73, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<30.67, -215.31, 4.00>, 3.0
<179.92, -156.23, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_1ppa_6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <176.67, -207.75, -416.42>;
#declare FOCUS = <176.67, -207.75, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
