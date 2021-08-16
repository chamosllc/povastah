/**
 * astah* Diagram 3D Visualization
 * MVCコミュニケーション
 * created at 2021/08/15
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

#declare CommunicationDiagram_aye91724ef1f5857cbf37de84b739c5e16 = union {
  object { ControlInstance rotate -x*90 scale 24.0 translate <332.929, -122.807, 0.00> }
    object { Circle_Text( LabelFont, " : EntityController",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <332.929, -122.807, 30.00> }
    sphere_sweep { linear_spline, 2, <332.929, -122.807, 4.00>, LRd <452.262, -268.807, 4.00>, LRd material { LifelineLinkMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <332.929, -122.807, 4.00>, LRd <332.929, -122.807, 4.00>, LRd <245.333, -169.333, 4.00>, LRd <210.929, -268.807, 4.00>, LRd <210.929, -268.807, 4.00>, LRd material { LifelineLinkMaterial } no_shadow }
  object { EntityInstance rotate -x*90 scale 24.0 translate <210.929, -268.807, 0.00> }
    object { Circle_Text( LabelFont, " : Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <210.929, -268.807, 30.00> }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate <452.262, -268.807, 0.00> }
    object { Circle_Text( LabelFont, " : EntityRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <452.262, -268.807, 30.00> }
    sphere_sweep { linear_spline, 2, <452.262, -268.807, 4.00>, LRd <210.929, -268.807, 4.00>, LRd material { LifelineLinkMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <332.929, -122.807, 4.00>, LRd <332.929, -122.807, 4.00>, LRd <245.333, -169.333, 4.00>, LRd/2.0 <210.929, -268.807, 4.00>, 0.0 <210.929, -268.807, 4.00>, 0.0 material { ShadowLifelineLinkMaterial } no_image }
    object { Circle_Text( LabelFont, "1: setAttribute(attribute)",  0.800, 0, 2, 1.800, 1, Align_Center, -90) scale TextScale texture { MessageLabelTecture } translate <246.266, -178.534, 30.00> }
}
object { CommunicationDiagram_aye91724ef1f5857cbf37de84b739c5e16 }
#declare EYE = <353, -500, -300>;
#declare FOCUS = <353, -200, 0>;
camera { location EYE direction 1.4*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { CommunicationDiagramTexture }}
