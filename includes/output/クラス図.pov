/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup クラス図
 * created at 2021/08/06
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f = union {
  object { Class rotate -x*90 scale 24.0 translate <99.701, -75.333, 0.000> }
    object { Circle_Text( LabelFont, "Class",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <99.701, -75.333, 30.000> }
  object { InstanceSpecification rotate -x*90 scale 24.0 translate <99.850, -260.000, 0.000> }
    object { Circle_Text( LabelFont, "InstanceSpecification:Class",  0.767, 0, 2, 1.833, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <99.850, -260.000, 30.000> }
  object { Interface rotate -x*90 scale 24.0 translate <99.850, -167.547, 0.000> }
    object { Circle_Text( LabelFont, "Interface",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <99.850, -167.547, 30.000> }
  object { Boundary rotate -x*90 scale 24.0 translate <386.517, -82.880, 0.000> }
    object { Circle_Text( LabelFont, "Boundary",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <386.517, -82.880, 30.000> }
  object { Entity rotate -x*90 scale 24.0 translate <238.184, -82.880, 0.000> }
    object { Circle_Text( LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <238.184, -82.880, 30.000> }
  object { Control rotate -x*90 scale 24.0 translate <539.184, -82.880, 0.000> }
    object { Circle_Text( LabelFont, "Control",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <539.184, -82.880, 30.000> }
  object { EntityInstance rotate -x*90 scale 24.0 translate <238.517, -267.547, 0.000> }
    object { Circle_Text( LabelFont, "EntityInstance:Entity",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <238.517, -267.547, 30.000> }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate <386.517, -267.547, 0.000> }
    object { Circle_Text( LabelFont, "BoundaryInstance:Boundary",  0.833, 0, 2, 1.767, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <386.517, -267.547, 30.000> }
  object { ControlInstance rotate -x*90 scale 24.0 translate <539.184, -267.547, 0.000> }
    object { Circle_Text( LabelFont, "ControlInstance:Control",  0.900, 0, 2, 1.700, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <539.184, -267.547, 30.000> }
}
object { ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <308.850, -414.786, -435.637>;
#declare FOCUS = <308.850, -174.786, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.000, -1000.000, -3000.000> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
