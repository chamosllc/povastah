/**
 * astah* Diagram 3D Visualization
 * ステートマシン図/リスト画面
 * created at 2021/09/02
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

#declare StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 = union {
#local InitialPseudostate0_0 = <130.000, -89.333, 0.0>;
#local State0_1 = <232.569, -89.154, 0.0>;
#local State0_2 = <540.000, -115.846, 0.0>;
#local State0_3 = <243.667, -253.667, 0.0>;
#local FinalState0_4 = <466.000, -324.000, 0.0>;
#local InitialPseudostate0_5 = <439.333, -97.154, 0.0>;
#local State0_6 = <539.902, -97.154, 0.0>;
#local InitialPseudostate0_7 = <439.333, -165.820, 0.0>;
#local State0_8 = <539.902, -165.820, 0.0>;
#local FinalState0_9 = <630.667, -97.154, 0.0>;
#local FinalState0_10 = <628.667, -165.820, 0.0>;
#local State0_11 = <318.569, -263.820, 0.0>;
#local State0_12 = <175.902, -263.820, 0.0>;
#local ChoicePseudostate0_13 = <318.667, -120.667, 0.0>;
#local ForkPseudostate0_14 = <243.667, -226.500, 0.0>;
#local JoinPseudostate0_15 = <247.667, -309.833, 0.0>;

  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate0_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_0, 4.0), LRd  vert(State0_1, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_0, 4.0), LRd  vert(State0_1, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State0_1 }
    object { Circle_Text(LabelFont, "find",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State0_1, 30.0)  no_shadow }
    torus { LOOPRd, LRd translate vert(<232.569, -89.154, 0.000>, - LOOPRd) material { TransitionMaterial } no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(State0_1, 4.0), LRd  vert(ChoicePseudostate0_13, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State0_1, 4.0), LRd  vert(ChoicePseudostate0_13, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  difference {
    object { StateInternal scale<252.000, 180.307, 20.00> translate vert(State0_2, -4.0)  }
    object { StateInternal scale<244.440, 100.183, 20.00> translate vertex(State0_2, <0.000, 38.513, -4.500>) }
    object { StateInternal scale<244.440, 74.715, 20.00> translate vertex(State0_2, <0.000, -51.641, -4.500>) }
  }
    text { ttf LabelFont, "show", 1, 0 scale TextScale texture { LabelTecture } translate vertex(State0_2, <-102.000, 66.154, 0.000>) no_shadow }

  difference {
    sphere_sweep { cubic_spline, 5,  vert(State0_2, 4.0), LRd  vert(State0_2, 4.0), LRd  vertex(State0_2, <-224.667, 74.513, 4.000>), LRd  vert(State0_1, 4.0), LRd  vert(State0_1, 4.0), LRd material { TransitionMaterial }  }
    object { StateInternal scale<244.440, 174.898, 20.00> translate vert(State0_2, -4.0) }
    no_shadow }
  difference {    sphere_sweep { cubic_spline, 5,  vert(State0_2, 4.0), LRd  vert(State0_2, 4.0), LRd/1.0  vertex(State0_2, <-224.667, 74.513, 4.000>), LRd/2.0  vert(State0_1, 4.0), LRd/4.0  vert(State0_1, 4.0), 0.0 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<244.440, 174.898, 20.00> translate vert(State0_2, -4.0) }
    no_image }
  difference {
    object { StateInternal scale<227.333, 161.281, 20.00> translate vert(State0_3, -4.0)  }
    object { StateInternal scale<220.513, 156.443, 20.00> translate vertex(State0_3, <0.000, 0.000, -4.500>) }
  }
    text { ttf LabelFont, "select", 1, 0 scale TextScale texture { LabelTecture } translate vertex(State0_3, <-89.667, 56.641, 0.000>) no_shadow }

  object { FinalState rotate -x*90 scale 24.0 translate FinalState0_4 }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate0_5 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_5, 4.0), LRd  vert(State0_6, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_5, 4.0), LRd  vert(State0_6, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State0_6 }
    object { Circle_Text(LabelFont, "entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State0_6, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(State0_6, 4.0), LRd  vert(FinalState0_9, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State0_6, 4.0), LRd  vert(FinalState0_9, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate0_7 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_7, 4.0), LRd  vert(State0_8, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_7, 4.0), LRd  vert(State0_8, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State0_8 }
    object { Circle_Text(LabelFont, "type",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State0_8, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(State0_8, 4.0), LRd  vert(FinalState0_10, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State0_8, 4.0), LRd  vert(FinalState0_10, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  difference {
    sphere_sweep { cubic_spline, 6,  vert(State0_8, 4.0), LRd  vert(State0_8, 4.0), LRd  vert(vertex(State0_8, <-51.618, -33.090, 4.000>), -28.0), LRd  vertex(State0_3, <193.000, 21.667, 4.000>), LRd  vert(State0_3, 4.0), LRd  vert(State0_3, 4.0), LRd material { TransitionMaterial }  }
    object { StateInternal scale<220.513, 156.443, 20.00> translate vert(State0_3, -4.0) }
    no_shadow }
  difference {    sphere_sweep { cubic_spline, 6,  vert(State0_8, 4.0), LRd  vert(State0_8, 4.0), LRd/1.0  vert(vertex(State0_8, <-51.618, -33.090, 4.000>), -28.0), LRd/2.0  vertex(State0_3, <193.000, 21.667, 4.000>), LRd/4.0  vert(State0_3, 4.0), LRd/8.0  vert(State0_3, 4.0), 0.0 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<220.513, 156.443, 20.00> translate vert(State0_3, -4.0) }
    no_image }
  object { FinalState rotate -x*90 scale 24.0 translate FinalState0_9 }
  object { FinalState rotate -x*90 scale 24.0 translate FinalState0_10 }
  object { State rotate -x*90 scale 24.0 translate State0_11 }
    object { Circle_Text(LabelFont, "do",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State0_11, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(State0_11, 4.0), LRd  vert(State0_11, 4.0), LRd  vertCenter(State0_11, JoinPseudostate0_15, -28.0), LRd  vert(JoinPseudostate0_15, 4.0), LRd  vert(JoinPseudostate0_15, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(State0_11, 4.0), LRd  vert(State0_11, 4.0), LRd/1.0  vertCenter(State0_11, JoinPseudostate0_15, -28.0), LRd/2.0  vert(JoinPseudostate0_15, 4.0), LRd/4.0  vert(JoinPseudostate0_15, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State0_12 }
    object { Circle_Text(LabelFont, "check",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State0_12, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(State0_12, 4.0), LRd  vert(State0_12, 4.0), LRd  vertCenter(State0_12, JoinPseudostate0_15, -28.0), LRd  vert(JoinPseudostate0_15, 4.0), LRd  vert(JoinPseudostate0_15, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(State0_12, 4.0), LRd  vert(State0_12, 4.0), LRd/1.0  vertCenter(State0_12, JoinPseudostate0_15, -28.0), LRd/2.0  vert(JoinPseudostate0_15, 4.0), LRd/4.0  vert(JoinPseudostate0_15, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { ChoicePseudostate rotate -x*90 scale 24.0 translate ChoicePseudostate0_13 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ChoicePseudostate0_13, 4.0), LRd  vert(ChoicePseudostate0_13, 4.0), LRd  vertCenter(ChoicePseudostate0_13, ForkPseudostate0_14, -28.0), LRd  vert(ForkPseudostate0_14, 4.0), LRd  vert(ForkPseudostate0_14, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ChoicePseudostate0_13, 4.0), LRd  vert(ChoicePseudostate0_13, 4.0), LRd/1.0  vertCenter(ChoicePseudostate0_13, ForkPseudostate0_14, -28.0), LRd/2.0  vert(ForkPseudostate0_14, 4.0), LRd/4.0  vert(ForkPseudostate0_14, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  difference {
    sphere_sweep { linear_spline, 2,  vert(ChoicePseudostate0_13, 4.0), LRd  vert(State0_2, 4.0), LRd material { TransitionMaterial }  }
    object { StateInternal scale<244.440, 174.898, 20.00> translate vert(State0_2, -4.0) }
    no_shadow }
  difference {    sphere_sweep { linear_spline, 2,  vert(ChoicePseudostate0_13, 4.0), LRd  vert(State0_2, 4.0), 0.0 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<244.440, 174.898, 20.00> translate vert(State0_2, -4.0) }
    no_image }
  object { ForkPseudostate rotate -x*90 scale 24.0 translate ForkPseudostate0_14 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkPseudostate0_14, 4.0), LRd  vert(ForkPseudostate0_14, 4.0), LRd  vertCenter(ForkPseudostate0_14, State0_12, -28.0), LRd  vert(State0_12, 4.0), LRd  vert(State0_12, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkPseudostate0_14, 4.0), LRd  vert(ForkPseudostate0_14, 4.0), LRd/1.0  vertCenter(ForkPseudostate0_14, State0_12, -28.0), LRd/2.0  vert(State0_12, 4.0), LRd/4.0  vert(State0_12, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkPseudostate0_14, 4.0), LRd  vert(ForkPseudostate0_14, 4.0), LRd  vertCenter(ForkPseudostate0_14, State0_11, -28.0), LRd  vert(State0_11, 4.0), LRd  vert(State0_11, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkPseudostate0_14, 4.0), LRd  vert(ForkPseudostate0_14, 4.0), LRd/1.0  vertCenter(ForkPseudostate0_14, State0_11, -28.0), LRd/2.0  vert(State0_11, 4.0), LRd/4.0  vert(State0_11, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { JoinPseudostate rotate -x*90 scale 24.0 translate JoinPseudostate0_15 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(JoinPseudostate0_15, 4.0), LRd  vert(JoinPseudostate0_15, 4.0), LRd  vertCenter(JoinPseudostate0_15, FinalState0_4, -28.0), LRd  vert(FinalState0_4, 4.0), LRd  vert(FinalState0_4, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(JoinPseudostate0_15, 4.0), LRd  vert(JoinPseudostate0_15, 4.0), LRd/1.0  vertCenter(JoinPseudostate0_15, FinalState0_4, -28.0), LRd/2.0  vert(FinalState0_4, 4.0), LRd/4.0  vert(FinalState0_4, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
}
object { StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 }
#declare EYE = <380, -380, -380>;
#declare FOCUS = <380, -180, 0>;
camera { location EYE direction 0.95*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { StateMachineDiagramTexture }}
