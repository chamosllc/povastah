/**
 * astah* Diagram 3D Visualization
 * クラス図
 * created at 2021/09/16
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

#declare ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f = union {
#local Class0_0 = <108.701, -76.380, 0.0>;
#local InstanceSpecification0_1 = <115.184, -260.107, 0.0>;
#local Interface0_2 = <8.517, -186.880, 0.0>;
#local Boundary0_3 = <448.517, -83.927, 0.0>;
#local Entity0_4 = <307.184, -83.927, 0.0>;
#local Control0_5 = <601.184, -83.927, 0.0>;
#local EntityInstance0_6 = <307.184, -263.201, 0.0>;
#local BoundaryInstance0_7 = <448.517, -263.201, 0.0>;
#local ControlInstance0_8 = <601.184, -263.201, 0.0>;
#local AssociationClass0_9 = <210.190, -149.190, 0.0>;
#local AbstractClass0_10 = <8.266, -106.047, 0.0>;

  object { Class rotate -x*90 scale 24.0 translate Class0_0 }
    object { Circle_Text(LabelFont, "Class",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_0, 30.0)  no_shadow }
// AssociationClass
    sphere_sweep { cubic_spline, 5, Class0_0, LRd Class0_0, LRd <210.190, -149.190, 0.000>, LRd Entity0_4, LRd Entity0_4, LRd material { AssociationClassMaterial } no_shadow }
  object { InstanceSpecification rotate -x*90 scale 24.0 translate InstanceSpecification0_1 }
    object { Circle_Text(LabelFont, "InstanceSpecification:Class",  0.767, 0, 2, 1.833, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(InstanceSpecification0_1, 30.0)  no_shadow }
  object { Interface rotate -x*90 scale 24.0 translate Interface0_2 }
    object { Circle_Text(LabelFont, "Interface",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Interface0_2, 30.0)  no_shadow }
  object { Boundary rotate -x*90 scale 24.0 translate Boundary0_3 }
    object { Circle_Text(LabelFont, "Boundary",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Boundary0_3, 30.0)  no_shadow }
  object { Entity rotate -x*90 scale 24.0 translate Entity0_4 }
    object { Circle_Text(LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Entity0_4, 30.0)  no_shadow }
  object { Control rotate -x*90 scale 24.0 translate Control0_5 }
    object { Circle_Text(LabelFont, "Control",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Control0_5, 30.0)  no_shadow }
  object { EntityInstance rotate -x*90 scale 24.0 translate EntityInstance0_6 }
    object { Circle_Text(LabelFont, "EntityInstance:Entity",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(EntityInstance0_6, 30.0)  no_shadow }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate BoundaryInstance0_7 }
    object { Circle_Text(LabelFont, "BoundaryInstance:Boundary",  0.833, 0, 2, 1.767, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(BoundaryInstance0_7, 30.0)  no_shadow }
  object { ControlInstance rotate -x*90 scale 24.0 translate ControlInstance0_8 }
    object { Circle_Text(LabelFont, "ControlInstance:Control",  0.900, 0, 2, 1.700, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ControlInstance0_8, 30.0)  no_shadow }
  object { AssociationClass rotate -x*90 scale 24.0 translate AssociationClass0_9 }
    object { Circle_Text(LabelFont, "AssociationClas",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(AssociationClass0_9, 30.0)  no_shadow }
  object { AbstractClass rotate -x*90 scale 24.0 translate AbstractClass0_10 }
    object { Circle_Text(LabelFont, "AbstractClass",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(AbstractClass0_10, 30.0)  no_shadow }
}
object { ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <312, -410, -394>;
#declare FOCUS = <312, -170, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
