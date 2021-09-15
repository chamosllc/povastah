/**
 * astah* Diagram 3D Visualization
 * クラス図/クラス継承グループリンク
 * created at 2021/09/15
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

// hierachy depth: {Diagram=3, ActivityDiagram=1, HierarchyDiagram=2, CommunicationDiagram=1, ClassDiagram=2, UseCaseDiagram=1, StateMachineDiagram=1}
// #declare Depth = -32.0;

#declare ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 = union {
#local AbstractClass0_0 = <522.849, -101.320, -64.0>;
#local Class0_1 = <361.756, -212.339, -32.0>;
#local Class0_2 = <452.735, -352.044, -0.0>;
#local AbstractClass0_3 = <706.341, -212.339, -32.0>;
#local Class0_4 = <821.892, -352.044, -0.0>;
#local Class0_5 = <627.763, -352.044, -0.0>;
#local Class0_6 = <242.167, -352.044, -0.0>;

  object { AbstractClass rotate -x*90 scale 24.0 translate AbstractClass0_0 }
    object { Circle_Text(LabelFont, "Diagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(AbstractClass0_0, 94.0)  no_shadow }
  object { Class rotate -x*90 scale 24.0 translate Class0_1 }
    object { Circle_Text(LabelFont, "ClassDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_1, 62.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Class0_1, LRd AbstractClass0_0, LRd material { GeneralizationMaterial } no_shadow }
  object { Class rotate -x*90 scale 24.0 translate Class0_2 }
    object { Circle_Text(LabelFont, "UseCaseDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_2, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 4, Class0_2, LRd  vertex(Class0_2, <0.000, 63.967, 0.000>), LRd  vertex(Class0_2, <-90.978, 63.967, 0.000>), LRd Class0_1, LRd material { GeneralizationMaterial } no_shadow }
  object { AbstractClass rotate -x*90 scale 24.0 translate AbstractClass0_3 }
    object { Circle_Text(LabelFont, "HierarchyDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(AbstractClass0_3, 62.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, AbstractClass0_3, LRd AbstractClass0_0, LRd material { GeneralizationMaterial } no_shadow }
  object { Class rotate -x*90 scale 24.0 translate Class0_4 }
    object { Circle_Text(LabelFont, "StateMachineDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_4, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 4, Class0_4, LRd  vertex(Class0_4, <0.000, 51.344, 0.000>), LRd  vertex(Class0_4, <-115.551, 51.344, 0.000>), LRd AbstractClass0_3, LRd material { GeneralizationMaterial } no_shadow }
  object { Class rotate -x*90 scale 24.0 translate Class0_5 }
    object { Circle_Text(LabelFont, "ActivityDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_5, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 4, Class0_5, LRd  vertex(Class0_5, <0.000, 51.344, 0.000>), LRd  vertex(Class0_5, <78.578, 51.344, 0.000>), LRd AbstractClass0_3, LRd material { GeneralizationMaterial } no_shadow }
  object { Class rotate -x*90 scale 24.0 translate Class0_6 }
    object { Circle_Text(LabelFont, "CommunicationDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_6, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 4, Class0_6, LRd  vertex(Class0_6, <0.000, 63.967, 0.000>), LRd  vertex(Class0_6, <119.590, 63.967, 0.000>), LRd Class0_1, LRd material { GeneralizationMaterial } no_shadow }
}
object { ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 }
#declare EYE = <527, -466, -665>;
#declare FOCUS = <527, -226, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
