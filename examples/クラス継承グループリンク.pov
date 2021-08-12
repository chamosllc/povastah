/**
 * astah* Diagram 3D Visualization
 * povastah クラス継承グループリンク
 * created at 2021/08/12
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare LRd = 3.2;
#declare LOOPRd = 36.0;
#declare TextScale = <16, 16, 2>;

// hierachy depth: {クラス0=2, クラス2=1, クラス1=1}
// #declare Depth = -32.0;

#declare ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 = union {
  object { Class rotate -x*90 scale 24.0 translate <216.167, -82.154, -64.0> }
    object { Circle_Text( LabelFont, "クラス0",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <216.167, -82.154, 30.0> }
  object { Class rotate -x*90 scale 24.0 translate <127.500, -239.487, -32.0> }
    object { Circle_Text( LabelFont, "クラス1",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <127.500, -239.487, 30.0> }
  object { Class rotate -x*90 scale 24.0 translate <310.833, -239.487, -32.0> }
    object { Circle_Text( LabelFont, "クラス2",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <310.833, -239.487, 30.0> }
    sphere_sweep { linear_spline, 2, <127.500, -239.487, -28.0>, LRd <216.167, -82.154, -60.0>, LRd material { GeneralizationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <310.833, -239.487, -28.0>, LRd <216.167, -82.154, -60.0>, LRd material { GeneralizationMaterial } no_shadow }
}
object { ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 }
#declare EYE = <219, -400, -435>;
#declare FOCUS = <219, -160, 0>;
camera { location EYE direction 1.5*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
