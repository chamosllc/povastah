/**
 * astah* Diagram 3D Visualization
 * サブステートマシン図
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

#local RAISE = -48;

#declare StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f = union {
#local State0_0 = <371.167, -243.380, 0.0>;
#local InitialPseudostate0_1 = <291.667, -243.380, 0.0>;
#local FinalState0_2 = <450.333, -243.380, 0.0>;

  object { State rotate -x*90 scale 24.0 translate State0_0 }
    object { Circle_Text(LabelFont, "State",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State0_0, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(State0_0, 4.0), LRd  vert(FinalState0_2, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State0_0, 4.0), LRd  vert(FinalState0_2, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate0_1 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_1, 4.0), LRd  vert(State0_0, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_1, 4.0), LRd  vert(State0_0, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { FinalState rotate -x*90 scale 24.0 translate FinalState0_2 }
}
object { StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <371, -483, -526>;
#declare FOCUS = <371, -243, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { StateMachineDiagramTexture }}
