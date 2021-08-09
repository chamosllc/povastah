/**
 * astah* Diagram 3D Visualization
 * povastah ロバストネス図
 * created at 2021/08/09
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ClassDiagram_1ppa6174cfd7c659288bc9badb700978b1e1 = union {
  object { Boundary rotate -x*90 scale 24.0 translate <179.917, -265.391, 0.000> }
    object { Circle_Text( LabelFont, "EntityRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <179.917, -265.391, 30.000> }
  object { Control rotate -x*90 scale 24.0 translate <61.333, -182.307, 0.000> }
    object { Circle_Text( LabelFont, "EntityController",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <61.333, -182.307, 30.000> }
  object { Entity rotate -x*90 scale 24.0 translate <350.357, -265.307, 0.000> }
    object { Circle_Text( LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <350.357, -265.307, 30.000> }
    sphere_sweep { linear_spline, 2, <61.333, -182.307, 4.000>, 3.0 <179.917, -265.391, 4.000>, 3.0 material { AssociationMaterial }}
    sphere_sweep { linear_spline, 2, <179.917, -265.391, 4.000>, 3.0 <350.357, -265.307, 4.000>, 3.0 material { AssociationMaterial }}
}
object { ClassDiagram_1ppa6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <184.333, -463.987, -360.320>;
#declare FOCUS = <184.333, -223.987, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
