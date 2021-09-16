/**
 * astah* Diagram 3D Visualization
 * design/model
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

// hierachy depth: {INodePresentation=1, ILinkPresentation=1, IPresentation=2}
// #declare Depth = -32.0;

#declare ClassDiagram_is4715fcce7cbf196cd0ab12d6d24ad939d = union {
#local AbstractClass0_0 = <284.717, -194.855, 0.0>;
#local Class0_1 = <171.718, -303.958, 0.0>;
#local Class0_2 = <406.771, -303.958, 0.0>;
#local Interface0_3 = <29.167, -206.176, 0.0>;
#local Interface0_4 = <406.771, -452.745, -0.0>;
#local Interface0_5 = <171.718, -452.745, -0.0>;
#local Interface0_6 = <29.167, -110.176, 0.0>;
#local Class0_7 = <284.717, -98.855, 0.0>;
#local Interface0_8 = <284.717, -354.745, -32.0>;

  object { AbstractClass rotate -x*90 scale 24.0 translate AbstractClass0_0 }
    object { Circle_Text(LabelFont, "Diagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(AbstractClass0_0, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(AbstractClass0_0, 4.0), LRd  vert(Class0_1, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(AbstractClass0_0, 4.0), LRd  vert(Class0_1, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(AbstractClass0_0, 4.0), LRd  vert(Interface0_3, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(AbstractClass0_0, 4.0), LRd  vert(Interface0_3, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(AbstractClass0_0, 4.0), LRd  vert(Class0_2, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(AbstractClass0_0, 4.0), LRd  vert(Class0_2, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Class rotate -x*90 scale 24.0 translate Class0_1 }
    object { Circle_Text(LabelFont, "Node",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_1, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Class0_1, 4.0), LRd  vert(Interface0_5, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Class0_1, 4.0), LRd  vert(Interface0_5, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Class rotate -x*90 scale 24.0 translate Class0_2 }
    object { Circle_Text(LabelFont, "LineSort",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_2, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Class0_2, 4.0), LRd  vert(Interface0_4, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Class0_2, 4.0), LRd  vert(Interface0_4, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Interface rotate -x*90 scale 24.0 translate Interface0_3 }
    object { Circle_Text(LabelFont, "IDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Interface0_3, 30.0)  no_shadow }
  object { Interface rotate -x*90 scale 24.0 translate Interface0_4 }
    object { Circle_Text(LabelFont, "ILinkPresentation",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Interface0_4, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Interface0_4, LRd Interface0_8, LRd material { GeneralizationMaterial } no_shadow }
  object { Interface rotate -x*90 scale 24.0 translate Interface0_5 }
    object { Circle_Text(LabelFont, "INodePresentation",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Interface0_5, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Interface0_5, LRd Interface0_8, LRd material { GeneralizationMaterial } no_shadow }
  object { Interface rotate -x*90 scale 24.0 translate Interface0_6 }
    object { Circle_Text(LabelFont, "ProjectAccessor",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Interface0_6, 30.0)  no_shadow }
  object { Class rotate -x*90 scale 24.0 translate Class0_7 }
    object { Circle_Text(LabelFont, "SceneProducer",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_7, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Class0_7, 4.0), LRd  vert(Interface0_6, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Class0_7, 4.0), LRd  vert(Interface0_6, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Class0_7, 4.0), LRd  vert(AbstractClass0_0, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Class0_7, 4.0), LRd  vert(AbstractClass0_0, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Interface rotate -x*90 scale 24.0 translate Interface0_8 }
    object { Circle_Text(LabelFont, "IPresentation",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Interface0_8, 62.0)  no_shadow }
}
object { ClassDiagram_is4715fcce7cbf196cd0ab12d6d24ad939d }
#declare EYE = <240, -480, -400>;
#declare FOCUS = <240, -320, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
