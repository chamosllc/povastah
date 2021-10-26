/**
 * astah* Diagram 3D Visualization
 * ロバストネス図
 * created at 2021/10/26
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

#declare ClassDiagram_2rn48e854451c4ee75ae849d72474c5eb8f = union {
#local Boundary0_0 = <287.333, -100.214, 0.0>;
#local Entity0_1 = <96.667, -100.214, 0.0>;
#local Control0_2 = <480.000, -100.214, 0.0>;
#local EntityInstance0_3 = <96.667, -205.547, 0.0>;
#local BoundaryInstance0_4 = <288.000, -205.547, 0.0>;
#local ControlInstance0_5 = <480.000, -205.547, 0.0>;

  object { Boundary rotate -x*90 scale 24.0 translate Boundary0_0 }
    object { Circle_Text(LabelFont, "Boundary",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Boundary0_0, 30.0)  no_shadow }
  object { Entity rotate -x*90 scale 24.0 translate Entity0_1 }
    object { Circle_Text(LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Entity0_1, 30.0)  no_shadow }
  object { Control rotate -x*90 scale 24.0 translate Control0_2 }
    object { Circle_Text(LabelFont, "Control",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Control0_2, 30.0)  no_shadow }
  object { EntityInstance rotate -x*90 scale 24.0 translate EntityInstance0_3 }
    object { Circle_Text(LabelFont, "EntityInstance:Entity",  0.967, 0, 2, 1.633, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(EntityInstance0_3, 30.0)  no_shadow }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate BoundaryInstance0_4 }
    object { Circle_Text(LabelFont, "BoundaryInstance:Boundary",  0.833, 0, 2, 1.767, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(BoundaryInstance0_4, 30.0)  no_shadow }
  object { ControlInstance rotate -x*90 scale 24.0 translate ControlInstance0_5 }
    object { Circle_Text(LabelFont, "ControlInstance:Control",  0.900, 0, 2, 1.700, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ControlInstance0_5, 30.0)  no_shadow }
}
object { ClassDiagram_2rn48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <293, -392, -357>;
#declare FOCUS = <293, -152, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
