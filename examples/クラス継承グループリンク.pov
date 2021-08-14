/**
 * astah* Diagram 3D Visualization
 * クラス継承グループリンク
 * created at 2021/08/14
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"

#declare LRd = 3.2;
#declare LOOPRd = 36.0;
#declare TextScale = <16, 16, 2>;

// hierachy depth: {Diagram=2, ActivityDiagram=1, StateMachineDiagram=1, ClassDiagram=1}
// #declare Depth = -32.0;

#declare ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 = union {
  object { Class rotate -x*90 scale 24.0 translate <310.833, -88.820, -64.0> }
    object { Circle_Text( LabelFont, "Diagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <310.833, -88.820, 30.0> }
  object { Class rotate -x*90 scale 24.0 translate <127.500, -239.487, -32.0> }
    object { Circle_Text( LabelFont, "ClassDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <127.500, -239.487, 30.0> }
    sphere_sweep { linear_spline, 4, <127.500, -239.487, -28.0>, LRd <310.833, -171.487, -38.7>, LRd <127.500, -171.487, -49.3>, LRd <310.833, -88.820, -60.0>, LRd material { GeneralizationMaterial } no_shadow }
  object { Class rotate -x*90 scale 24.0 translate <310.833, -239.487, -32.0> }
    object { Circle_Text( LabelFont, "ActivityDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <310.833, -239.487, 30.0> }
    sphere_sweep { linear_spline, 4, <310.833, -239.487, -28.0>, LRd <310.833, -171.487, -38.7>, LRd <310.833, -171.487, -49.3>, LRd <310.833, -88.820, -60.0>, LRd material { GeneralizationMaterial } no_shadow }
  object { Class rotate -x*90 scale 24.0 translate <521.500, -239.487, -32.0> }
    object { Circle_Text( LabelFont, "StateMachineDiagram",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <521.500, -239.487, 30.0> }
    sphere_sweep { linear_spline, 4, <521.500, -239.487, -28.0>, LRd <310.833, -171.487, -38.7>, LRd <521.500, -171.487, -49.3>, LRd <310.833, -88.820, -60.0>, LRd material { GeneralizationMaterial } no_shadow }
}
object { ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 }
#declare EYE = <341, -404, -561>;
#declare FOCUS = <341, -164, 0>;
camera { location EYE direction 1.5*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
