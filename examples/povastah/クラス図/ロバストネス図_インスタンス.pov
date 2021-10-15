/**
 * astah* Diagram 3D Visualization
 * クラス図/ロバストネス図_インスタンス
 * created at 2021/10/06
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"

#local LRd = 3.2;
#local LOOPRd = 36.0;
#local TextScale = <16, 16, 2>;

#declare ClassDiagram_bj3d6ceec00a507a2b70caaa0df577508a = union {
#local Boundary0_0 = <179.917, -265.391, 0.0>;
#local Control0_1 = <61.333, -182.307, 0.0>;
#local Entity0_2 = <350.357, -265.307, 0.0>;
#local ControlInstance0_3 = <61.442, -377.307, 0.0>;
#local BoundaryInstance0_4 = <180.109, -446.641, 0.0>;
#local EntityInstance0_5 = <350.109, -446.641, 0.0>;

  object { Boundary rotate -x*90 scale 24.0 translate Boundary0_0 }
    object { Circle_Text(LabelFont, "EntityRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Boundary0_0, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Boundary0_0, 4.0), LRd  vert(Entity0_2, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Boundary0_0, 4.0), LRd  vert(Entity0_2, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Control rotate -x*90 scale 24.0 translate Control0_1 }
    object { Circle_Text(LabelFont, "EntityController",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Control0_1, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Control0_1, 4.0), LRd  vert(Boundary0_0, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Control0_1, 4.0), LRd  vert(Boundary0_0, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Entity rotate -x*90 scale 24.0 translate Entity0_2 }
    object { Circle_Text(LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Entity0_2, 30.0)  no_shadow }
  object { ControlInstance rotate -x*90 scale 24.0 translate ControlInstance0_3 }
    object { Circle_Text(LabelFont, ":EntityController",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ControlInstance0_3, 30.0)  no_shadow }
// Link
    sphere_sweep { linear_spline, 2,  vert(ControlInstance0_3, 4.0), LRd  vert(BoundaryInstance0_4, 4.0), LRd material { LinkMaterial } no_shadow }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate BoundaryInstance0_4 }
    object { Circle_Text(LabelFont, ":EntityRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(BoundaryInstance0_4, 30.0)  no_shadow }
// Link
    sphere_sweep { linear_spline, 2,  vert(BoundaryInstance0_4, 4.0), LRd  vert(EntityInstance0_5, 4.0), LRd material { LinkMaterial } no_shadow }
  object { EntityInstance rotate -x*90 scale 24.0 translate EntityInstance0_5 }
    object { Circle_Text(LabelFont, ":Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(EntityInstance0_5, 30.0)  no_shadow }
}
object { ClassDiagram_bj3d6ceec00a507a2b70caaa0df577508a }
#declare EYE = <186, -554, -412>;
#declare FOCUS = <186, -314, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
