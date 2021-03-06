/**
 * astah* Diagram 3D Visualization
 * ステートマシン図
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
#local InitialPseudostate1_0 = <163.000, -183.000, 0.0>;
#local State1_1 = <238.500, -183.047, 0.0>;
#local FinalState1_2 = <303.000, -183.000, 0.0>;

  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate1_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate1_0, 4.0), LRd  vert(State1_1, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate1_0, 4.0), LRd  vert(State1_1, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State1_1 }
    object { Circle_Text(LabelFont, "state",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State1_1, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(State1_1, 4.0), LRd  vert(FinalState1_2, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State1_1, 4.0), LRd  vert(FinalState1_2, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { FinalState rotate -x*90 scale 24.0 translate FinalState1_2 }
}
#declare StateMachineDiagram_98248e854451c4ee75ae849d72474c5eb8f = union {
#local InitialPseudostate0_0 = <80.667, -105.333, 0.0>;
#local State0_1 = <180.833, -105.380, 0.0>;
#local SubmachineState0_2 = <669.312, -237.060, 0.0>;
#local State0_3 = <297.833, -256.620, 0.0>;
#local State0_4 = <205.500, -224.714, 0.0>;
#local ChoicePseudostate0_5 = <279.333, -107.333, 0.0>;
#local FinalState0_6 = <581.333, -318.000, 0.0>;
#local InitialPseudostate0_7 = <140.667, -224.667, 0.0>;
#local FinalState0_8 = <260.667, -276.667, 0.0>;
#local ForkPseudostate0_9 = <382.333, -89.833, 0.0>;
#local ForkPseudostate0_10 = <479.833, -94.333, 0.0>;
#local JoinPseudostate0_11 = <578.333, -91.833, 0.0>;
#local JoinPseudostate0_12 = <655.167, -89.667, 0.0>;
#local JunctionPseudostate0_13 = <364.833, -225.500, 0.0>;
#local ShallowHistoryPseudostate0_14 = <166.000, -296.000, 0.0>;
#local DeepHistoryPseudostate0_15 = <434.000, -304.000, 0.0>;
#local State0_16 = <434.150, -225.380, 0.0>;

  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate0_0 }
    object { Circle_Text(LabelFont, "InitialPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(InitialPseudostate0_0, 30.0)  no_shadow }
  object { State rotate -x*90 scale 24.0 translate State0_1 }
    object { Circle_Text(LabelFont, "State",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State0_1, 30.0)  no_shadow }
  #local SubmachineState0_2_SCALE = 0.84184;
  #local SubmachineState0_2_sub = SubmachineState0_2 + <-249.000, 183.000, -32>*SubmachineState0_2_SCALE;
  object { StateMachineDiagram_46566ef5a77024f23ff251e80bb9d0c7efa scale SubmachineState0_2_SCALE translate SubmachineState0_2_sub }
  object { SubmachineState scale <165.000, 59.188, 20.000> translate SubmachineState0_2 }
    text { ttf LabelFont, "SubmachineState", 1, 0 scale TextScale texture { LabelTecture } translate vertex(SubmachineState0_2, <-72.500, 21.594, 0.000>) no_shadow }

  difference {
    object { StateInternal scale<413.667, 180.094, 20.00> translate vert(State0_3, -4.0)  }
    object { StateInternal scale<221.807, 174.691, 20.00> translate vertex(State0_3, <-92.500, 0.000, -4.500>) }
    object { StateInternal scale<179.450, 174.691, 20.00> translate vertex(State0_3, <114.333, 0.000, -4.500>) }
  }
    text { ttf LabelFont, "StateInternal", 1, 0 scale TextScale texture { LabelTecture } translate vertex(State0_3, <-194.833, 74.047, 20.000>) no_shadow }

  object { State rotate -x*90 scale 24.0 translate State0_4 }
    object { Circle_Text(LabelFont, "State",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State0_4, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(State0_4, 4.0), LRd  vert(FinalState0_8, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State0_4, 4.0), LRd  vert(FinalState0_8, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
    union{
    sphere_sweep { linear_spline, 2,  vert(State0_4, 4.0), LRd  vert(JunctionPseudostate0_13, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State0_4, 4.0), LRd  vert(JunctionPseudostate0_13, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { ChoicePseudostate rotate -x*90 scale 24.0 translate ChoicePseudostate0_5 }
    object { Circle_Text(LabelFont, "ChoicePseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ChoicePseudostate0_5, 30.0)  no_shadow }
  object { FinalState rotate -x*90 scale 24.0 translate FinalState0_6 }
    object { Circle_Text(LabelFont, "FinalState",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(FinalState0_6, 30.0)  no_shadow }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate0_7 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_7, 4.0), LRd  vert(State0_4, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_7, 4.0), LRd  vert(State0_4, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { FinalState rotate -x*90 scale 24.0 translate FinalState0_8 }
  object { ForkPseudostate rotate -x*90 scale 24.0 translate ForkPseudostate0_9 }
    object { Circle_Text(LabelFont, "ForkPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ForkPseudostate0_9, 30.0)  no_shadow }
  object { ForkPseudostate rotate -x*90 scale 24.0 translate ForkPseudostate0_10 }
    object { Circle_Text(LabelFont, "ForkPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ForkPseudostate0_10, 30.0)  no_shadow }
  object { JoinPseudostate rotate -x*90 scale 24.0 translate JoinPseudostate0_11 }
    object { Circle_Text(LabelFont, "JoinPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(JoinPseudostate0_11, 30.0)  no_shadow }
  object { JoinPseudostate rotate -x*90 scale 24.0 translate JoinPseudostate0_12 }
    object { Circle_Text(LabelFont, "JoinPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(JoinPseudostate0_12, 30.0)  no_shadow }
  object { JunctionPseudostate rotate -x*90 scale 24.0 translate JunctionPseudostate0_13 }
    object { Circle_Text(LabelFont, "JunctionPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(JunctionPseudostate0_13, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(JunctionPseudostate0_13, 4.0), LRd  vert(State0_16, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(JunctionPseudostate0_13, 4.0), LRd  vert(State0_16, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { ShallowHistoryPseudostate rotate -x*90 scale 24.0 translate ShallowHistoryPseudostate0_14 }
    object { Circle_Text(LabelFont, "ShallowHistoryPseudostate",  0.833, 0, 2, 1.767, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(ShallowHistoryPseudostate0_14, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(ShallowHistoryPseudostate0_14, 4.0), LRd  vert(State0_4, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(ShallowHistoryPseudostate0_14, 4.0), LRd  vert(State0_4, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { DeepHistoryPseudostate rotate -x*90 scale 24.0 translate DeepHistoryPseudostate0_15 }
    object { Circle_Text(LabelFont, "DeepHistoryPseudostate",  0.933, 0, 2, 1.667, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(DeepHistoryPseudostate0_15, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(DeepHistoryPseudostate0_15, 4.0), LRd  vert(State0_16, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(DeepHistoryPseudostate0_15, 4.0), LRd  vert(State0_16, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State0_16 }
    object { Circle_Text(LabelFont, "State",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State0_16, 30.0)  no_shadow }
}
object { StateMachineDiagram_98248e854451c4ee75ae849d72474c5eb8f }
box { <0, 0, 0>, <1, 1, 1> pigment { image_map { jpeg  "./povastah-Lineup/statemachine.jpg" map_type 0 } rotate x*180 } scale <917, -402, 1> scale 0.8 translate <40, 300, 31> }
#declare EYE = <404.667, -40, -700>;
#declare FOCUS = <404.667, -40, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.000, -1000.000, -3000.000> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
