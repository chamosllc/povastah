/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup ロバストネス図
 * created at 2021/08/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ClassDiagram_2rn48e854451c4ee75ae849d72474c5eb8f = union {
  object { Boundary rotate -x*90 scale 24.0 translate <287.33, -100.21, 0.00> }
    object { Circle_Text( LabelFont, "Boundary", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <287.33, -100.21, 30.00> }
  object { Entity rotate -x*90 scale 24.0 translate <96.67, -100.21, 0.00> }
    object { Circle_Text( LabelFont, "Entity", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <96.67, -100.21, 30.00> }
  object { Control rotate -x*90 scale 24.0 translate <480.00, -100.21, 0.00> }
    object { Circle_Text( LabelFont, "Control", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <480.00, -100.21, 30.00> }
  object { EntityInstance rotate -x*90 scale 24.0 translate <96.67, -205.55, 0.00> }
    object { Circle_Text( LabelFont, "EntityInstance:Entity", 0.9666666666666667, 0, 2, 1.6333333333333335, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <96.67, -205.55, 30.00> }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate <288.00, -205.55, 0.00> }
    object { Circle_Text( LabelFont, "BoundaryInstance:Boundary", 0.8333333333333334, 0, 2, 1.7666666666666668, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <288.00, -205.55, 30.00> }
  object { ControlInstance rotate -x*90 scale 24.0 translate <480.00, -205.55, 0.00> }
    object { Circle_Text( LabelFont, "ControlInstance:Control", 0.9, 0, 2, 1.7000000000000002, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <480.00, -205.55, 30.00> }
}
object { ClassDiagram_2rn48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <293.40, -392.67, -398.06>;
#declare FOCUS = <293.40, -152.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
