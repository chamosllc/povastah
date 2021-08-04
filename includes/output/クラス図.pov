/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup クラス図
 * created at 2021/08/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f = union {
  object { Class rotate -x*90 scale 24.0 translate <94.33, -122.38, 0.00> }
    object { Circle_Text( LabelFont, "Class", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <94.33, -122.38, 30.00> }
  object { InstanceSpecification rotate -x*90 scale 24.0 translate <293.18, -122.21, 0.00> }
    object { Circle_Text( LabelFont, "InstanceSpecification:Class", 0.7666666666666666, 0, 2, 1.8333333333333335, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <293.18, -122.21, 30.00> }
  object { Interface rotate -x*90 scale 24.0 translate <476.00, -129.55, 0.00> }
    object { Circle_Text( LabelFont, "Interface", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <476.00, -129.55, 30.00> }
}
object { ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <284.66, -364.33, -361.00>;
#declare FOCUS = <284.66, -124.33, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
