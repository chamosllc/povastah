/**
 * astah* Diagram 3D Visualization
 * povastah 5_MVCモデル
 * created at 2021/07/16
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_1ppa_6174cfd7c659288bc9badb700978b1e1 = union {
object { Boundary rotate -x*90 scale 24  translate <179.92, -268.22, 0.00> }
 text { ttf LabelFont, "EntityRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <131.92, -304.22, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <179.92, -164.72, 0.00> }
 text { ttf LabelFont, "entityView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <149.92, -200.72, 30.00> }
object { Control rotate -x*90 scale 24  translate <30.67, -223.80, 0.00> }
 text { ttf LabelFont, "EntityController", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-17.33, -259.80, 30.00> }
object { Entity rotate -x*90 scale 24  translate <323.02, -268.14, 0.00> }
 text { ttf LabelFont, "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <305.02, -304.14, 30.00> }
sphere_sweep { linear_spline, 2, 
<30.67, -223.80, 4.00>, 3.0
<179.92, -164.72, 4.00>, 3.0
  texture { AssociationTexture }
}
sphere_sweep { linear_spline, 2, 
<30.67, -223.80, 4.00>, 3.0
<179.92, -268.22, 4.00>, 3.0
  texture { AssociationTexture }
}
sphere_sweep { linear_spline, 2, 
<179.92, -268.22, 4.00>, 3.0
<323.02, -268.14, 4.00>, 3.0
  texture { AssociationTexture }
}
}
object { ClassDiagram_1ppa_6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <155.17, -216.25, -403.42>;
#declare FOCUS = <155.17, -216.25, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
