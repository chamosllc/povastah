/**
 * astah* Diagram 3D Visualization
 * クラス図/クラス継承階層
 * created at 2021/09/08
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

// hierachy depth: {JpaRepository=2, CrudRepository=3, EntityRepository=1, Repository=5, PagingAndSortingRepository=4}
// #declare Depth = -32.0;

#declare ClassDiagram_1muq6174cfd7c659288bc9badb700978b1e1 = union {
#local Boundary0_0 = <221.484, -257.818, -0.0>;
#local Boundary0_1 = <221.484, -174.266, -32.0>;
#local Entity0_2 = <477.622, -257.818, 0.0>;
#local Boundary0_3 = <221.484, 86.680, -128.0>;
#local Boundary0_4 = <221.484, 1.346, -96.0>;
#local Boundary0_5 = <221.484, -86.654, -64.0>;

  object { Boundary rotate -x*90 scale 24.0 translate Boundary0_0 }
    object { Circle_Text(LabelFont, "EntityRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Boundary0_0, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Boundary0_0, 4.0), LRd  vert(Entity0_2, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Boundary0_0, 4.0), LRd  vert(Entity0_2, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
// Generalization
    sphere_sweep { linear_spline, 2, Boundary0_0, LRd Boundary0_1, LRd material { GeneralizationMaterial } no_shadow }
  object { Boundary rotate -x*90 scale 24.0 translate Boundary0_1 }
    object { Circle_Text(LabelFont, "JpaRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Boundary0_1, 62.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Boundary0_1, LRd Boundary0_5, LRd material { GeneralizationMaterial } no_shadow }
  object { Entity rotate -x*90 scale 24.0 translate Entity0_2 }
    object { Circle_Text(LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Entity0_2, 30.0)  no_shadow }
  object { Boundary rotate -x*90 scale 24.0 translate Boundary0_3 }
    object { Circle_Text(LabelFont, "Repository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Boundary0_3, 158.0)  no_shadow }
  object { Boundary rotate -x*90 scale 24.0 translate Boundary0_4 }
    object { Circle_Text(LabelFont, "PagingAndSortingRepository",  0.800, 0, 2, 1.800, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Boundary0_4, 126.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Boundary0_4, LRd Boundary0_3, LRd material { GeneralizationMaterial } no_shadow }
  object { Boundary rotate -x*90 scale 24.0 translate Boundary0_5 }
    object { Circle_Text(LabelFont, "CrudRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Boundary0_5, 94.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Boundary0_5, LRd Boundary0_4, LRd material { GeneralizationMaterial } no_shadow }
}
object { ClassDiagram_1muq6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <298, -330, -300>;
#declare FOCUS = <298, -90, 0>;
camera { location EYE direction 0.75*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
