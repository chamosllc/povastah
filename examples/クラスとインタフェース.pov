/**
 * astah* Diagram 3D Visualization
 * povastah クラスとインタフェース
 * created at 2021/07/29
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ClassDiagram_zm36174cfd7c659288bc9badb700978b1e1 = union {
  object { Interface rotate -x*90 scale 24.0 translate <140.09, -152.97, 0.00> }
  text { ttf LabelFont, "Serializable", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <130.09, -188.97, 30.00> }
  object { Entity rotate -x*90 scale 24.0 translate <139.55, -250.11, 0.00> }
  text { ttf LabelFont, "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <99.49, -286.11, 30.00> }
    sphere_sweep { linear_spline, 2, <140.09, -152.97, 4.00>, 3.0 <139.55, -250.11, 4.00>, 3.0 texture { RealizationTexture }}
}
object { ClassDiagram_zm36174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <139.49, -220.15, -191.65>;
#declare FOCUS = <139.49, -220.15, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
