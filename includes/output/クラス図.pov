/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup クラス図
 * created at 2021/08/05
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f = union {
  object { Class rotate -x*90 scale 24.0 translate <94.333, -122.380, 0.000> }
    object { Circle_Text( LabelFont, "Class",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <94.333, -122.380, 30.000> }
  object { InstanceSpecification rotate -x*90 scale 24.0 translate <293.184, -122.214, 0.000> }
    object { Circle_Text( LabelFont, "InstanceSpecification:Class",  0.767, 0, 2, 1.833, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <293.184, -122.214, 30.000> }
  object { Interface rotate -x*90 scale 24.0 translate <476.000, -129.547, 0.000> }
    object { Circle_Text( LabelFont, "Interface",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <476.000, -129.547, 30.000> }
}
object { ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <284.662, -364.333, -360.996>;
#declare FOCUS = <284.662, -124.333, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.000, -1000.000, -3000.000> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
