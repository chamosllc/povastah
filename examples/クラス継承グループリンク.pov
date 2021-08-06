/**
 * astah* Diagram 3D Visualization
 * povastah クラス継承グループリンク
 * created at 2021/08/06
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

// hierachy depth: {クラス1=1, クラス0=2, クラス2=1}
// #declare Depth = -32.0;

#declare ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 = union {
  object { Class rotate -x*90 scale 24.0 translate <216.167, -82.154, -64.000> }
    object { Circle_Text( LabelFont, "クラス0",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <216.167, -82.154, 30.000> }
  object { Class rotate -x*90 scale 24.0 translate <127.500, -239.487, -32.000> }
    object { Circle_Text( LabelFont, "クラス1",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <127.500, -239.487, 30.000> }
  object { Class rotate -x*90 scale 24.0 translate <310.833, -239.487, -32.000> }
    object { Circle_Text( LabelFont, "クラス2",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <310.833, -239.487, 30.000> }
    sphere_sweep { linear_spline, 2, <127.500, -239.487, -28.000>, 3.0 <216.167, -82.154, -60.000>, 3.0 texture { GeneralizationTexture }}
    sphere_sweep { linear_spline, 2, <310.833, -239.487, -28.000>, 3.0 <216.167, -82.154, -60.000>, 3.0 texture { GeneralizationTexture }}
}
object { ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 }
#declare EYE = <219.000, -400.833, -427.833>;
#declare FOCUS = <219.000, -160.833, 0.000>;
camera { location EYE direction 1.6*z look_at FOCUS }
light_source { <-1000.000, -1000.000, -3000.000> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
