/**
 * astah* Diagram 3D Visualization
 * povastah ロバストネス図_インスタンス
 * created at 2021/08/08
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ClassDiagram_bj3d6ceec00a507a2b70caaa0df577508a = union {
  object { Boundary rotate -x*90 scale 24.0 translate <179.917, -265.391, 0.000> }
    object { Circle_Text( LabelFont, "EntityRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <179.917, -265.391, 30.000> }
  object { Control rotate -x*90 scale 24.0 translate <61.333, -182.307, 0.000> }
    object { Circle_Text( LabelFont, "EntityController",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <61.333, -182.307, 30.000> }
  object { Entity rotate -x*90 scale 24.0 translate <350.357, -265.307, 0.000> }
    object { Circle_Text( LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <350.357, -265.307, 30.000> }
  object { ControlInstance rotate -x*90 scale 24.0 translate <61.442, -377.307, 0.000> }
    object { Circle_Text( LabelFont, ":EntityController",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <61.442, -377.307, 30.000> }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate <180.109, -446.641, 0.000> }
    object { Circle_Text( LabelFont, ":EntityRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <180.109, -446.641, 30.000> }
  object { EntityInstance rotate -x*90 scale 24.0 translate <350.109, -446.641, 0.000> }
    object { Circle_Text( LabelFont, ":Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <350.109, -446.641, 30.000> }
    sphere_sweep { linear_spline, 2, <61.333, -182.307, 4.000>, 3.0 <179.917, -265.391, 4.000>, 3.0 texture { AssociationTexture }}
    sphere_sweep { linear_spline, 2, <179.917, -265.391, 4.000>, 3.0 <350.357, -265.307, 4.000>, 3.0 texture { AssociationTexture }}
    sphere_sweep { linear_spline, 2, <61.442, -377.307, 4.000>, 3.0 <180.109, -446.641, 4.000>, 3.0 texture { LinkTexture }}
    sphere_sweep { linear_spline, 2, <180.109, -446.641, 4.000>, 3.0 <350.109, -446.641, 4.000>, 3.0 texture { LinkTexture }}
}
object { ClassDiagram_bj3d6ceec00a507a2b70caaa0df577508a }
#declare EYE = <186.227, -554.487, -452.714>;
#declare FOCUS = <186.227, -314.487, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.000, -1000.000, -3000.000> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
