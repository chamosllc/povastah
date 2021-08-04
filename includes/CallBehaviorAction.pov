/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup CallBehaviorAction
 * created at 2021/08/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialNode rotate -x*90 scale 24.0 translate <87.00, -44.67, 0.00> }
  object { Action rotate -x*90 scale 24.0 translate <87.00, -94.21, 0.00> }
    object { Circle_Text( LabelFont, "Action", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <87.00, -94.21, 30.00> }
  object { ActivityFinal rotate -x*90 scale 24.0 translate <87.00, -144.00, 0.00> }
    sphere_sweep { linear_spline, 2, <87.00, -44.67, 4.00>, 3.0 <87.00, -94.21, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
    sphere_sweep { linear_spline, 2, <87.00, -94.21, 4.00>, 3.0 <87.00, -144.00, 4.00>, 3.0 texture { ControlFlow_ObjectFlowTexture }}
}
object { ActivityDiagram_uky48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <87.16, -274.17, -136.00>;
#declare FOCUS = <87.16, -94.17, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
