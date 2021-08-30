/**
 * astah* Diagram 3D Visualization
 * CallBehaviorAction
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

// ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f
#local InitialNode0_0 = <87.004, -44.667, 0.0>;
#local Action0_1 = <87.004, -131.547, 0.0>;
#local ActivityFinal0_2 = <87.004, -220.000, 0.0>;

#declare ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate InitialNode0_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(Action0_1, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialNode0_0, 4.0), LRd  vert(Action0_1, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { Action rotate -x*90 scale 24.0 translate Action0_1 }
    object { Circle_Text(LabelFont, "Action",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Action0_1, 30.0)  }
    union{
    sphere_sweep { linear_spline, 2,  vert(Action0_1, 4.0), LRd  vert(ActivityFinal0_2, 4.0), LRd material { ControlFlowObjectFlowMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Action0_1, 4.0), LRd  vert(ActivityFinal0_2, 4.0), 0.0 material { ShadowControlFlowObjectFlowMaterial } no_image }
    }
  object { ActivityFinal rotate -x*90 scale 24.0 translate ActivityFinal0_2 }
}
object { ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <87, -372, -131>;
#declare FOCUS = <87, -132, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ActivityDiagramTexture }}
