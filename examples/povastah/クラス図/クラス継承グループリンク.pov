/**
 * astah* Diagram 3D Visualization
 * クラス図/クラス継承グループリンク
 * created at 2021/09/02
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

// hierachy depth: {ActivityDiagram=1, ClassDiagram=1, Diagram=2, StateMachineDiagram=1}
// #declare Depth = -32.0;

#declare ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 = union {
#local Class0_0 = <310.833, -88.820, -64.0>;
#local Class0_1 = <127.500, -239.487, -32.0>;
#local Class0_2 = <310.833, -239.487, -32.0>;
#local Class0_3 = <521.500, -239.487, -32.0>;

  object { Class rotate -x*90 scale 24.0 translate Class0_0 }
    object { Circle_Text(LabelFont, "Diagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_0, 94.0)  no_shadow }
  object { Class rotate -x*90 scale 24.0 translate Class0_1 }
    object { Circle_Text(LabelFont, "ClassDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_1, 62.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 4, Class0_1, LRd  vertex(Class0_1, <0.000, 68.000, 0.000>), LRd  vertex(Class0_1, <183.333, 68.000, 0.000>), LRd Class0_0, LRd material { GeneralizationMaterial } no_shadow }
  object { Class rotate -x*90 scale 24.0 translate Class0_2 }
    object { Circle_Text(LabelFont, "ActivityDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_2, 62.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 4, Class0_2, LRd  vertex(Class0_2, <0.000, 68.000, 0.000>), LRd  vertex(Class0_2, <0.000, 68.000, 0.000>), LRd Class0_0, LRd material { GeneralizationMaterial } no_shadow }
  object { Class rotate -x*90 scale 24.0 translate Class0_3 }
    object { Circle_Text(LabelFont, "StateMachineDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_3, 62.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 4, Class0_3, LRd  vertex(Class0_3, <0.000, 68.000, 0.000>), LRd  vertex(Class0_3, <-210.667, 68.000, 0.000>), LRd Class0_0, LRd material { GeneralizationMaterial } no_shadow }
}
object { ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 rotate z*20}
#declare EYE = <341, -360, -240>;
#declare FOCUS = <341, -120, 0>;
camera { location EYE direction 0.9*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}