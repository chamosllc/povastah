/**
 * astah* Diagram 3D Visualization
 * 3.外部設計/02クラス図/02_0.5集配業務システム
 * created at 2021/09/03
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

// hierachy depth: {配達担当者=1, 運搬車=2, 配達車=1, 収集担当者=1, 収集車=1, 運転者=2}
// #declare Depth = -32.0;

#declare ClassDiagram_1d33a6b1030ad474f166f77483c46088db1cd3ae93b99127db = union {
#local Actor0_0 = <267.833, -58.594, -32.0>;
#local Class0_1 = <267.508, -164.094, -32.0>;
#local Actor0_2 = <142.167, -58.594, 0.0>;
#local Class0_3 = <437.981, -58.594, 0.0>;
#local Actor0_4 = <431.921, -164.094, -0.0>;
#local Actor0_5 = <119.754, -164.094, -0.0>;
#local Actor0_6 = <2.833, -58.594, 0.0>;
#local Class0_7 = <119.754, -268.594, -0.0>;
#local Class0_8 = <431.921, -268.594, -0.0>;

  object { Actor rotate -x*90 scale 24.0 translate Actor0_0 }
    object { Circle_Text(LabelFont, "運転者",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Actor0_0, 62.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Actor0_0, 4.0), LRd  vert(Class0_1, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Actor0_0, 4.0), LRd  vert(Class0_1, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Class rotate -x*90 scale 24.0 translate Class0_1 }
    object { Circle_Text(LabelFont, "運搬車",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_1, 62.0)  no_shadow }
  object { Actor rotate -x*90 scale 24.0 translate Actor0_2 }
    object { Circle_Text(LabelFont, "運送会社",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Actor0_2, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Actor0_2, 4.0), LRd  vert(Actor0_0, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Actor0_2, 4.0), LRd  vert(Actor0_0, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Class rotate -x*90 scale 24.0 translate Class0_3 }
    object { Circle_Text(LabelFont, "集配所",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_3, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Class0_3, 4.0), LRd  vert(Actor0_0, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Class0_3, 4.0), LRd  vert(Actor0_0, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Actor rotate -x*90 scale 24.0 translate Actor0_4 }
    object { Circle_Text(LabelFont, "収集担当者",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Actor0_4, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Actor0_4, LRd Actor0_0, LRd material { GeneralizationMaterial } no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Actor0_4, 4.0), LRd  vert(Class0_8, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Actor0_4, 4.0), LRd  vert(Class0_8, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Actor rotate -x*90 scale 24.0 translate Actor0_5 }
    object { Circle_Text(LabelFont, "配達担当者",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Actor0_5, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Actor0_5, LRd Actor0_0, LRd material { GeneralizationMaterial } no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Actor0_5, 4.0), LRd  vert(Class0_7, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Actor0_5, 4.0), LRd  vert(Class0_7, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Actor rotate -x*90 scale 24.0 translate Actor0_6 }
    object { Circle_Text(LabelFont, "荷送人",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Actor0_6, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Actor0_6, 4.0), LRd  vert(Actor0_2, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Actor0_6, 4.0), LRd  vert(Actor0_2, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Class rotate -x*90 scale 24.0 translate Class0_7 }
    object { Circle_Text(LabelFont, "配達車",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_7, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Class0_7, LRd Class0_1, LRd material { GeneralizationMaterial } no_shadow }
  object { Class rotate -x*90 scale 24.0 translate Class0_8 }
    object { Circle_Text(LabelFont, "収集車",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_8, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Class0_8, LRd Class0_1, LRd material { GeneralizationMaterial } no_shadow }
}
object { ClassDiagram_1d33a6b1030ad474f166f77483c46088db1cd3ae93b99127db }
#declare EYE = <240, -500, -200>;
#declare FOCUS = <240, -240, 0>;
camera { location EYE direction 1*z right <16/9,0,0> look_at FOCUS }
light_source { <-1000, -2000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
