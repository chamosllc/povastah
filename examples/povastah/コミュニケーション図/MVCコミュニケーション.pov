/**
 * astah* Diagram 3D Visualization
 * コミュニケーション図/MVCコミュニケーション
 * created at 2021/08/27
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

// CommunicationDiagram_aye91724ef1f5857cbf37de84b739c5e16
#local ControlInstance0_0 = <332.929, -122.807, 0.0>;
#local EntityInstance0_1 = <210.929, -268.807, 0.0>;
#local BoundaryInstance0_2 = <452.262, -268.807, 0.0>;
#local Message0_3 = <246.266, -178.534, 0.0>;

#declare CommunicationDiagram_aye91724ef1f5857cbf37de84b739c5e16 = union {
  object { ControlInstance rotate -x*90 scale 24.0 translate ControlInstance0_0 }
    object { Circle_Text(LabelFont, " : EntityController",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ControlInstance0_0, 30.0)  }
    sphere_sweep { linear_spline, 2,  vert(ControlInstance0_0, 4.0), LRd  vert(BoundaryInstance0_2, 4.0), LRd material { LifelineLinkMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ControlInstance0_0, 4.0), LRd  vert(ControlInstance0_0, 4.0), LRd  vertex(ControlInstance0_0, <-87.595, -46.526, 4.000>), LRd  vert(EntityInstance0_1, 4.0), LRd  vert(EntityInstance0_1, 4.0), LRd material { LifelineLinkMaterial } no_shadow }
  object { EntityInstance rotate -x*90 scale 24.0 translate EntityInstance0_1 }
    object { Circle_Text(LabelFont, " : Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(EntityInstance0_1, 30.0)  }
  object { BoundaryInstance rotate -x*90 scale 24.0 translate BoundaryInstance0_2 }
    object { Circle_Text(LabelFont, " : EntityRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(BoundaryInstance0_2, 30.0)  }
    sphere_sweep { linear_spline, 2,  vert(BoundaryInstance0_2, 4.0), LRd  vert(EntityInstance0_1, 4.0), LRd material { LifelineLinkMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ControlInstance0_0, 4.0), LRd  vert(ControlInstance0_0, 4.0), LRd/1.0  vertex(ControlInstance0_0, <-87.595, -46.526, 4.000>), LRd/2.0  vert(EntityInstance0_1, 4.0), LRd/4.0  vert(EntityInstance0_1, 4.0), 0.0 material { ShadowLifelineLinkMaterial } no_image }
    object { Circle_Text(LabelFont, "1: setAttribute(attribute)",  0.800, 0, 2, 1.800, 1, Align_Center, -90) scale TextScale texture { MessageLabelTecture } translate vert(Message0_3, 30.0)  }
}
object { CommunicationDiagram_aye91724ef1f5857cbf37de84b739c5e16 }
#declare EYE = <353, -435, -460>;
#declare FOCUS = <353, -195, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { CommunicationDiagramTexture }}
