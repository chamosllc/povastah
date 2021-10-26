/**
 * astah* Diagram 3D Visualization
 * サブステートマシン
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

#declare StateMachineDiagram_46566ef5a77024f23ff251e80bb9d0c7efa = union {
#local InitialPseudostate0_0 = <163.000, -183.000, 0.0>;
#local State0_1 = <238.500, -183.047, 0.0>;
#local FinalState0_2 = <303.000, -183.000, 0.0>;

  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate0_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_0, 4.0), LRd  vert(State0_1, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_0, 4.0), LRd  vert(State0_1, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State0_1 }
    object { Circle_Text(LabelFont, "state",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State0_1, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(State0_1, 4.0), LRd  vert(FinalState0_2, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State0_1, 4.0), LRd  vert(FinalState0_2, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { FinalState rotate -x*90 scale 24.0 translate FinalState0_2 }
}
object { StateMachineDiagram_46566ef5a77024f23ff251e80bb9d0c7efa }
#declare EYE = <233, -423, -328>;
#declare FOCUS = <233, -183, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { StateMachineDiagramTexture }}
