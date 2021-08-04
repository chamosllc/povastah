/**
 * astah* Diagram 3D Visualization
 * povastah ロバストネス図_インスタンス
 * created at 2021/08/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ClassDiagram_bj3d6ceec00a507a2b70caaa0df577508a = union {
  object { Boundary rotate -x*90 scale 24.0 translate <179.92, -265.39, 0.00> }
    object { Circle_Text( LabelFont, "EntityRepository", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <179.92, -265.39, 30.00> }
  object { Control rotate -x*90 scale 24.0 translate <61.33, -182.31, 0.00> }
    object { Circle_Text( LabelFont, "EntityController", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <61.33, -182.31, 30.00> }
  object { Entity rotate -x*90 scale 24.0 translate <350.36, -265.31, 0.00> }
    object { Circle_Text( LabelFont, "Entity", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <350.36, -265.31, 30.00> }
  object { ControlInstance rotate -x*90 scale 24.0 translate <61.44, -377.31, 0.00> }
    object { Circle_Text( LabelFont, ":EntityController", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <61.44, -377.31, 30.00> }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate <180.11, -446.64, 0.00> }
    object { Circle_Text( LabelFont, ":EntityRepository", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <180.11, -446.64, 30.00> }
  object { EntityInstance rotate -x*90 scale 24.0 translate <350.11, -446.64, 0.00> }
    object { Circle_Text( LabelFont, ":Entity", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <350.11, -446.64, 30.00> }
    sphere_sweep { linear_spline, 2, <61.33, -182.31, 4.00>, 3.0 <179.92, -265.39, 4.00>, 3.0 texture { AssociationTexture }}
    sphere_sweep { linear_spline, 2, <179.92, -265.39, 4.00>, 3.0 <350.36, -265.31, 4.00>, 3.0 texture { AssociationTexture }}
    sphere_sweep { linear_spline, 2, <61.44, -377.31, 4.00>, 3.0 <180.11, -446.64, 4.00>, 3.0 texture { LinkTexture }}
    sphere_sweep { linear_spline, 2, <180.11, -446.64, 4.00>, 3.0 <350.11, -446.64, 4.00>, 3.0 texture { LinkTexture }}
}
object { ClassDiagram_bj3d6ceec00a507a2b70caaa0df577508a }
#declare EYE = <186.23, -494.49, -412.71>;
#declare FOCUS = <186.23, -314.49, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
