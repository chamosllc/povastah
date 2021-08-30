/**
 * astah* Diagram 3D Visualization
 * クラス図
 * created at 2021/08/30
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"

#local LRd = 3.2;
#local LOOPRd = 36.0;
#local TextScale = <16, 16, 2>;

// ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f
#local Class0_0 = <99.701, -75.333, 0.0>;
#local InstanceSpecification0_1 = <99.850, -260.000, 0.0>;
#local Interface0_2 = <64.517, -167.547, 0.0>;
#local Boundary0_3 = <409.850, -82.880, 0.0>;
#local Entity0_4 = <268.184, -82.880, 0.0>;
#local Control0_5 = <562.517, -82.880, 0.0>;
#local EntityInstance0_6 = <268.517, -267.547, 0.0>;
#local BoundaryInstance0_7 = <409.850, -267.547, 0.0>;
#local ControlInstance0_8 = <562.517, -267.547, 0.0>;
#local AssociationClass0_9 = <186.857, -159.857, 0.0>;

#declare ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f = union {
  object { Class rotate -x*90 scale 24.0 translate Class0_0 }
    object { Circle_Text(LabelFont, "Class",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_0, 30.0)  }
// AssociationClass
    sphere_sweep { cubic_spline, 5, Class0_0, LRd Class0_0, LRd <186.857, -159.857, 0.000>, LRd Entity0_4, LRd Entity0_4, LRd material { AssociationClassMaterial } no_shadow }
  object { InstanceSpecification rotate -x*90 scale 24.0 translate InstanceSpecification0_1 }
    object { Circle_Text(LabelFont, "InstanceSpecification:Class",  0.767, 0, 2, 1.833, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(InstanceSpecification0_1, 30.0)  }
  object { Interface rotate -x*90 scale 24.0 translate Interface0_2 }
    object { Circle_Text(LabelFont, "Interface",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Interface0_2, 30.0)  }
  object { Boundary rotate -x*90 scale 24.0 translate Boundary0_3 }
    object { Circle_Text(LabelFont, "Boundary",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Boundary0_3, 30.0)  }
  object { Entity rotate -x*90 scale 24.0 translate Entity0_4 }
    object { Circle_Text(LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Entity0_4, 30.0)  }
  object { Control rotate -x*90 scale 24.0 translate Control0_5 }
    object { Circle_Text(LabelFont, "Control",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Control0_5, 30.0)  }
  object { EntityInstance rotate -x*90 scale 24.0 translate EntityInstance0_6 }
    object { Circle_Text(LabelFont, "EntityInstance:Entity",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(EntityInstance0_6, 30.0)  }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate BoundaryInstance0_7 }
    object { Circle_Text(LabelFont, "BoundaryInstance:Boundary",  0.833, 0, 2, 1.767, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(BoundaryInstance0_7, 30.0)  }
  object { ControlInstance rotate -x*90 scale 24.0 translate ControlInstance0_8 }
    object { Circle_Text(LabelFont, "ControlInstance:Control",  0.900, 0, 2, 1.700, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ControlInstance0_8, 30.0)  }
  object { AssociationClass rotate -x*90 scale 24.0 translate AssociationClass0_9 }
    object { Circle_Text(LabelFont, "AssociationClas",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(AssociationClass0_9, 30.0)  }
}
object { ClassDiagram_l48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <320, -411, -403>;
#declare FOCUS = <320, -171, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
