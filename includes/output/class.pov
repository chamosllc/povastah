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
  object { Class rotate -x*90 scale 24.0 translate <99.70, -75.33, 0.00> }
    object { Circle_Text( LabelFont, "Class", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <99.70, -75.33, 30.00> }
  object { InstanceSpecification rotate -x*90 scale 24.0 translate <99.85, -260.00, 0.00> }
    object { Circle_Text( LabelFont, "InstanceSpecification:Class", 0.7666666666666666, 0, 2, 1.8333333333333335, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <99.85, -260.00, 30.00> }
  object { Interface rotate -x*90 scale 24.0 translate <99.85, -167.55, 0.00> }
    object { Circle_Text( LabelFont, "Interface", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <99.85, -167.55, 30.00> }
  object { Boundary rotate -x*90 scale 24.0 translate <386.52, -82.88, 0.00> }
    object { Circle_Text( LabelFont, "Boundary", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <386.52, -82.88, 30.00> }
  object { Entity rotate -x*90 scale 24.0 translate <238.18, -82.88, 0.00> }
    object { Circle_Text( LabelFont, "Entity", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <238.18, -82.88, 30.00> }
  object { Control rotate -x*90 scale 24.0 translate <539.18, -82.88, 0.00> }
    object { Circle_Text( LabelFont, "Control", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <539.18, -82.88, 30.00> }
  object { EntityInstance rotate -x*90 scale 24.0 translate <238.52, -267.55, 0.00> }
    object { Circle_Text( LabelFont, "EntityInstance:Entity", 0.9666666666666667, 0, 2, 1.6333333333333335, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <238.52, -267.55, 30.00> }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate <386.52, -267.55, 0.00> }
    object { Circle_Text( LabelFont, "BoundaryInstance:Boundary", 0.8333333333333334, 0, 2, 1.7666666666666668, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <386.52, -267.55, 30.00> }
  object { ControlInstance rotate -x*90 scale 24.0 translate <539.18, -267.55, 0.00> }
    object { Circle_Text( LabelFont, "ControlInstance:Control", 0.9, 0, 2, 1.7000000000000002, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <539.18, -267.55, 30.00> }
}
object { ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f }
box { <0, 0, 0>, <1, 1, 1> pigment { image_map { jpeg  "./povastah-Lineup/class.jpg" map_type 0 } rotate x*180 } scale <822, -248, 1> scale 0.77 translate <0, 150, 31> }
#declare EYE = <308.85, -80, -480>;
#declare FOCUS = <308.85, -80, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
