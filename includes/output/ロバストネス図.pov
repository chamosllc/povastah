/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup ロバストネス図
 * created at 2021/08/09
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ClassDiagram_2rn48e854451c4ee75ae849d72474c5eb8f = union {
  object { Boundary rotate -x*90 scale 24.0 translate <287.333, -100.214, 0.000> }
    object { Circle_Text( LabelFont, "Boundary",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <287.333, -100.214, 30.000> }
  object { Entity rotate -x*90 scale 24.0 translate <96.667, -100.214, 0.000> }
    object { Circle_Text( LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <96.667, -100.214, 30.000> }
  object { Control rotate -x*90 scale 24.0 translate <480.000, -100.214, 0.000> }
    object { Circle_Text( LabelFont, "Control",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <480.000, -100.214, 30.000> }
  object { EntityInstance rotate -x*90 scale 24.0 translate <96.667, -205.547, 0.000> }
    object { Circle_Text( LabelFont, "EntityInstance:Entity",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <96.667, -205.547, 30.000> }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate <288.000, -205.547, 0.000> }
    object { Circle_Text( LabelFont, "BoundaryInstance:Boundary",  0.833, 0, 2, 1.767, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <288.000, -205.547, 30.000> }
  object { ControlInstance rotate -x*90 scale 24.0 translate <480.000, -205.547, 0.000> }
    object { Circle_Text( LabelFont, "ControlInstance:Control",  0.900, 0, 2, 1.700, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <480.000, -205.547, 30.000> }
}
object { ClassDiagram_2rn48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <293.395, -392.667, -398.062>;
#declare FOCUS = <293.395, -152.667, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
