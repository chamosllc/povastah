/**
 * astah* Diagram 3D Visualization
 * povastah クラス継承グループリンク
 * created at 2021/08/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

// hierachy depth: {クラス0=2, クラス2=1, クラス1=1}
// #declare Depth = -32.0;

#declare ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 = union {
  object { Class rotate -x*90 scale 24.0 translate <216.17, -82.15, -64.00> }
    object { Circle_Text( LabelFont, "クラス0", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <216.17, -82.15, 30.00> }
  object { Class rotate -x*90 scale 24.0 translate <127.50, -239.49, -32.00> }
    object { Circle_Text( LabelFont, "クラス1", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <127.50, -239.49, 30.00> }
  object { Class rotate -x*90 scale 24.0 translate <310.83, -239.49, -32.00> }
    object { Circle_Text( LabelFont, "クラス2", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <310.83, -239.49, 30.00> }
    sphere_sweep { linear_spline, 2, <127.50, -239.49, -28.00>, 3.0 <216.17, -82.15, -60.00>, 3.0 texture { GeneralizationTexture }}
    sphere_sweep { linear_spline, 2, <310.83, -239.49, -28.00>, 3.0 <216.17, -82.15, -60.00>, 3.0 texture { GeneralizationTexture }}
}
object { ClassDiagram_az488dd3ba7186d4a0d516cbeb00eb6449 }
#declare EYE = <219.00, -400.83, -427.83>;
#declare FOCUS = <219.00, -160.83, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
