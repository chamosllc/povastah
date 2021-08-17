/**
 * astah* Diagram 3D Visualization
 * クラス図
 * created at 2021/08/17
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"

#declare LRd = 3.2;
#declare LOOPRd = 36.0;
#declare TextScale = <16, 16, 2>;

#declare ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f = union {
  object { Class rotate -x*90 scale 24.0 translate <99.701, -75.333, 0.00> }
    object { Circle_Text( LabelFont, "Class",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <99.701, -75.333, 30.00> }
    sphere_sweep { cubic_spline, 5, <99.701, -75.333, 4.00>, LRd <99.701, -75.333, 4.00>, LRd <186.857, -159.857, 0.00>, LRd <268.184, -82.880, 4.00>, LRd <268.184, -82.880, 4.00>, LRd material { AssociationClassMaterial } no_shadow }
  object { InstanceSpecification rotate -x*90 scale 24.0 translate <99.850, -260.000, 0.00> }
    object { Circle_Text( LabelFont, "InstanceSpecification:Class",  0.767, 0, 2, 1.833, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <99.850, -260.000, 30.00> }
  object { Interface rotate -x*90 scale 24.0 translate <64.517, -167.547, 0.00> }
    object { Circle_Text( LabelFont, "Interface",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <64.517, -167.547, 30.00> }
  object { Boundary rotate -x*90 scale 24.0 translate <409.850, -82.880, 0.00> }
    object { Circle_Text( LabelFont, "Boundary",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <409.850, -82.880, 30.00> }
  object { Entity rotate -x*90 scale 24.0 translate <268.184, -82.880, 0.00> }
    object { Circle_Text( LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <268.184, -82.880, 30.00> }
  object { Control rotate -x*90 scale 24.0 translate <562.517, -82.880, 0.00> }
    object { Circle_Text( LabelFont, "Control",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <562.517, -82.880, 30.00> }
  object { EntityInstance rotate -x*90 scale 24.0 translate <268.517, -267.547, 0.00> }
    object { Circle_Text( LabelFont, "EntityInstance:Entity",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <268.517, -267.547, 30.00> }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate <409.850, -267.547, 0.00> }
    object { Circle_Text( LabelFont, "BoundaryInstance:Boundary",  0.833, 0, 2, 1.767, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <409.850, -267.547, 30.00> }
  object { ControlInstance rotate -x*90 scale 24.0 translate <562.517, -267.547, 0.00> }
    object { Circle_Text( LabelFont, "ControlInstance:Control",  0.900, 0, 2, 1.700, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <562.517, -267.547, 30.00> }
  object { AssociationClass rotate -x*90 scale 24.0 translate <186.857, -159.857, 0.00> }
    object { Circle_Text( LabelFont, "AssociationClas",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <186.857, -159.857, 30.00> }
}
object { ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <320, -411, -403>;
#declare FOCUS = <320, -171, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
