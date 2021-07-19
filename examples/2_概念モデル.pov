/**
 * astah* Diagram 3D Visualization
 * povastah 2_概念モデル
 * created at 2021/07/16
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_oow_6174cfd7c659288bc9badb700978b1e1 = union {
object { Class rotate -x*90 scale 24  translate <-167.89, -20.79, 0.00> }
 text { ttf LabelFont, "物", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-173.89, -56.79, 30.00> }
}
object { ClassDiagram_oow_6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <-167.83, -20.83, -256.00>;
#declare FOCUS = <-167.83, -20.83, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
