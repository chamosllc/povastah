/**
 * astah* Diagram 3D Visualization
 * povastah クラスとインタフェース
 * created at 2021/08/09
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

 #declare ClassDiagram_zm36174cfd7c659288bc9badb700978b1e1 = union {  
  object { Interface rotate -x*90 scale 24.0 translate <140.087, -152.974, 0.000> } 
  
    object { Circle_Text( LabelFont, "Serializable",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <140.087, -152.974, 30.000> }
  object { Entity rotate -x*90 scale 24.0 translate <139.552, -250.115, 0.000> }
    object { Circle_Text( LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <139.552, -250.115, 30.000> }
    sphere_sweep { linear_spline, 2, <140.087, -152.974, 4.000>, 3.0 <139.552, -250.115, 4.000>, 3.0 material { RealizationMaterial }}
}
object { ClassDiagram_zm36174cfd7c659288bc9badb700978b1e1 }

#declare EYE = <139.491, -460.154, -311.645>;
#declare FOCUS = <139.491, -220.154, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
