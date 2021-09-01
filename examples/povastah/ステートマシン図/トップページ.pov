/**
 * astah* Diagram 3D Visualization
 * ステートマシン図/トップページ
 * created at 2021/09/01
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
#local InitialPseudostate2_0 = <130.000, -89.333, 0.0>;
#local State2_1 = <232.569, -89.154, 0.0>;
#local State2_2 = <540.000, -115.846, 0.0>;
#local State2_3 = <243.667, -253.667, 0.0>;
#local FinalState2_4 = <466.000, -324.000, 0.0>;
#local InitialPseudostate2_5 = <439.333, -97.154, 0.0>;
#local State2_6 = <539.902, -97.154, 0.0>;
#local InitialPseudostate2_7 = <439.333, -165.820, 0.0>;
#local State2_8 = <539.902, -165.820, 0.0>;
#local FinalState2_9 = <630.667, -97.154, 0.0>;
#local FinalState2_10 = <628.667, -165.820, 0.0>;
#local State2_11 = <318.569, -263.820, 0.0>;
#local State2_12 = <175.902, -263.820, 0.0>;
#local ChoicePseudostate2_13 = <318.667, -120.667, 0.0>;
#local ForkPseudostate2_14 = <243.667, -226.500, 0.0>;
#local JoinPseudostate2_15 = <247.667, -309.833, 0.0>;

  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate2_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate2_0, 4.0), LRd  vert(State2_1, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate2_0, 4.0), LRd  vert(State2_1, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State2_1 }
    object { Circle_Text(LabelFont, "find",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State2_1, 30.0)  no_shadow }
    torus { LOOPRd, LRd translate vert(<232.569, -89.154, 0.000>, - LOOPRd) material { TransitionMaterial } no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(State2_1, 4.0), LRd  vert(ChoicePseudostate2_13, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State2_1, 4.0), LRd  vert(ChoicePseudostate2_13, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  difference {
    object { StateInternal scale<252.000, 180.307, 20.00> translate vert(State2_2, -4.0)  }
    object { StateInternal scale<244.440, 100.183, 20.00> translate vertex(State2_2, <0.000, 38.513, -4.500>) }
    object { StateInternal scale<244.440, 74.715, 20.00> translate vertex(State2_2, <0.000, -51.641, -4.500>) }
  }
    text { ttf LabelFont, "show", 1, 0 scale TextScale texture { LabelTecture } translate vertex(State2_2, <-102.000, 66.154, 0.000>) no_shadow }

  difference {
    sphere_sweep { cubic_spline, 5,  vert(State2_2, 4.0), LRd  vert(State2_2, 4.0), LRd  vertex(State2_2, <-224.667, 74.513, 4.000>), LRd  vert(State2_1, 4.0), LRd  vert(State2_1, 4.0), LRd material { TransitionMaterial }  }
    object { StateInternal scale<244.440, 174.898, 20.00> translate vert(State2_2, -4.0) }
    no_shadow }
  difference {    sphere_sweep { cubic_spline, 5,  vert(State2_2, 4.0), LRd  vert(State2_2, 4.0), LRd/1.0  vertex(State2_2, <-224.667, 74.513, 4.000>), LRd/2.0  vert(State2_1, 4.0), LRd/4.0  vert(State2_1, 4.0), 0.0 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<244.440, 174.898, 20.00> translate vert(State2_2, -4.0) }
    no_image }
  difference {
    object { StateInternal scale<227.333, 161.281, 20.00> translate vert(State2_3, -4.0)  }
    object { StateInternal scale<220.513, 156.443, 20.00> translate vertex(State2_3, <0.000, 0.000, -4.500>) }
  }
    text { ttf LabelFont, "select", 1, 0 scale TextScale texture { LabelTecture } translate vertex(State2_3, <-89.667, 56.641, 0.000>) no_shadow }

  object { FinalState rotate -x*90 scale 24.0 translate FinalState2_4 }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate2_5 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate2_5, 4.0), LRd  vert(State2_6, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate2_5, 4.0), LRd  vert(State2_6, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State2_6 }
    object { Circle_Text(LabelFont, "entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State2_6, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(State2_6, 4.0), LRd  vert(FinalState2_9, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State2_6, 4.0), LRd  vert(FinalState2_9, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate2_7 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate2_7, 4.0), LRd  vert(State2_8, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate2_7, 4.0), LRd  vert(State2_8, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State2_8 }
    object { Circle_Text(LabelFont, "type",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State2_8, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(State2_8, 4.0), LRd  vert(FinalState2_10, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State2_8, 4.0), LRd  vert(FinalState2_10, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  difference {
    sphere_sweep { cubic_spline, 6,  vert(State2_8, 4.0), LRd  vert(State2_8, 4.0), LRd  vert(vertex(State2_8, <-51.618, -33.090, 4.000>), -28.0), LRd  vertex(State2_8, <-103.235, -66.180, 4.000>), LRd  vert(State2_3, 4.0), LRd  vert(State2_3, 4.0), LRd material { TransitionMaterial }  }
    object { StateInternal scale<220.513, 156.443, 20.00> translate vert(State2_3, -4.0) }
    no_shadow }
  difference {    sphere_sweep { cubic_spline, 6,  vert(State2_8, 4.0), LRd  vert(State2_8, 4.0), LRd/1.0  vert(vertex(State2_8, <-51.618, -33.090, 4.000>), -28.0), LRd/2.0  vertex(State2_8, <-103.235, -66.180, 4.000>), LRd/4.0  vert(State2_3, 4.0), LRd/8.0  vert(State2_3, 4.0), 0.0 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<220.513, 156.443, 20.00> translate vert(State2_3, -4.0) }
    no_image }
  object { FinalState rotate -x*90 scale 24.0 translate FinalState2_9 }
  object { FinalState rotate -x*90 scale 24.0 translate FinalState2_10 }
  object { State rotate -x*90 scale 24.0 translate State2_11 }
    object { Circle_Text(LabelFont, "do",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State2_11, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(State2_11, 4.0), LRd  vert(State2_11, 4.0), LRd  vert(vertex(State2_11, <-35.451, -23.007, 4.000>), -28.0), LRd  vert(JoinPseudostate2_15, 4.0), LRd  vert(JoinPseudostate2_15, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(State2_11, 4.0), LRd  vert(State2_11, 4.0), LRd/1.0  vert(vertex(State2_11, <-35.451, -23.007, 4.000>), -28.0), LRd/2.0  vert(JoinPseudostate2_15, 4.0), LRd/4.0  vert(JoinPseudostate2_15, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State2_12 }
    object { Circle_Text(LabelFont, "check",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State2_12, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(State2_12, 4.0), LRd  vert(State2_12, 4.0), LRd  vert(vertex(State2_12, <35.882, -23.007, 4.000>), -28.0), LRd  vert(JoinPseudostate2_15, 4.0), LRd  vert(JoinPseudostate2_15, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(State2_12, 4.0), LRd  vert(State2_12, 4.0), LRd/1.0  vert(vertex(State2_12, <35.882, -23.007, 4.000>), -28.0), LRd/2.0  vert(JoinPseudostate2_15, 4.0), LRd/4.0  vert(JoinPseudostate2_15, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { ChoicePseudostate rotate -x*90 scale 24.0 translate ChoicePseudostate2_13 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ChoicePseudostate2_13, 4.0), LRd  vert(ChoicePseudostate2_13, 4.0), LRd  vert(vertex(ChoicePseudostate2_13, <-37.500, -52.917, 4.000>), -28.0), LRd  vert(ForkPseudostate2_14, 4.0), LRd  vert(ForkPseudostate2_14, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ChoicePseudostate2_13, 4.0), LRd  vert(ChoicePseudostate2_13, 4.0), LRd/1.0  vert(vertex(ChoicePseudostate2_13, <-37.500, -52.917, 4.000>), -28.0), LRd/2.0  vert(ForkPseudostate2_14, 4.0), LRd/4.0  vert(ForkPseudostate2_14, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  difference {
    sphere_sweep { linear_spline, 2,  vert(ChoicePseudostate2_13, 4.0), LRd  vert(State2_2, 4.0), LRd material { TransitionMaterial }  }
    object { StateInternal scale<244.440, 174.898, 20.00> translate vert(State2_2, -4.0) }
    no_shadow }
  difference {    sphere_sweep { linear_spline, 2,  vert(ChoicePseudostate2_13, 4.0), LRd  vert(State2_2, 4.0), 0.0 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<244.440, 174.898, 20.00> translate vert(State2_2, -4.0) }
    no_image }
  object { ForkPseudostate rotate -x*90 scale 24.0 translate ForkPseudostate2_14 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkPseudostate2_14, 4.0), LRd  vert(ForkPseudostate2_14, 4.0), LRd  vert(vertex(ForkPseudostate2_14, <-33.882, -18.660, 4.000>), -28.0), LRd  vert(State2_12, 4.0), LRd  vert(State2_12, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkPseudostate2_14, 4.0), LRd  vert(ForkPseudostate2_14, 4.0), LRd/1.0  vert(vertex(ForkPseudostate2_14, <-33.882, -18.660, 4.000>), -28.0), LRd/2.0  vert(State2_12, 4.0), LRd/4.0  vert(State2_12, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ForkPseudostate2_14, 4.0), LRd  vert(ForkPseudostate2_14, 4.0), LRd  vert(vertex(ForkPseudostate2_14, <37.451, -18.660, 4.000>), -28.0), LRd  vert(State2_11, 4.0), LRd  vert(State2_11, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ForkPseudostate2_14, 4.0), LRd  vert(ForkPseudostate2_14, 4.0), LRd/1.0  vert(vertex(ForkPseudostate2_14, <37.451, -18.660, 4.000>), -28.0), LRd/2.0  vert(State2_11, 4.0), LRd/4.0  vert(State2_11, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { JoinPseudostate rotate -x*90 scale 24.0 translate JoinPseudostate2_15 }
    union{
    sphere_sweep { cubic_spline, 5,  vert(JoinPseudostate2_15, 4.0), LRd  vert(JoinPseudostate2_15, 4.0), LRd  vert(vertex(JoinPseudostate2_15, <109.167, -7.083, 4.000>), -28.0), LRd  vert(FinalState2_4, 4.0), LRd  vert(FinalState2_4, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(JoinPseudostate2_15, 4.0), LRd  vert(JoinPseudostate2_15, 4.0), LRd/1.0  vert(vertex(JoinPseudostate2_15, <109.167, -7.083, 4.000>), -28.0), LRd/2.0  vert(FinalState2_4, 4.0), LRd/4.0  vert(FinalState2_4, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
}
#declare StateMachineDiagram_bffke8128ac6c1d56428bfcbc5567f70b355 = union {
#local InitialPseudostate1_0 = <88.667, -132.667, 0.0>;
#local State1_1 = <218.758, -13.820, 0.0>;
#local State1_2 = <519.738, -41.359, 0.0>;
#local ChoicePseudostate1_3 = <168.000, -130.667, 0.0>;
#local SubmachineState1_4 = <412.019, -192.180, 0.0>;
#local InitialPseudostate1_5 = <422.667, -27.693, 0.0>;
#local State1_6 = <495.235, -28.180, 0.0>;
#local State1_7 = <584.569, -72.180, 0.0>;

  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate1_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate1_0, 4.0), LRd  vert(ChoicePseudostate1_3, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate1_0, 4.0), LRd  vert(ChoicePseudostate1_3, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State1_1 }
    object { Circle_Text(LabelFont, "show entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State1_1, 30.0)  no_shadow }
  difference {
    sphere_sweep { linear_spline, 2,  vert(State1_1, 4.0), LRd  vert(State1_2, 4.0), LRd material { TransitionMaterial }  }
    object { StateInternal scale<238.481, 149.380, 20.00> translate vert(State1_2, -4.0) }
    no_shadow }
  difference {    sphere_sweep { linear_spline, 2,  vert(State1_1, 4.0), LRd  vert(State1_2, 4.0), 0.0 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<238.481, 149.380, 20.00> translate vert(State1_2, -4.0) }
    no_image }
    torus { LOOPRd, LRd translate vert(<218.758, -13.820, 0.000>, - LOOPRd) material { TransitionMaterial } no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(State1_1, 4.0), LRd  vert(State1_1, 4.0), LRd  vertex(State1_1, <-59.424, -42.513, 4.000>), LRd  vert(ChoicePseudostate1_3, 4.0), LRd  vert(ChoicePseudostate1_3, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(State1_1, 4.0), LRd  vert(State1_1, 4.0), LRd/1.0  vertex(State1_1, <-59.424, -42.513, 4.000>), LRd/2.0  vert(ChoicePseudostate1_3, 4.0), LRd/4.0  vert(ChoicePseudostate1_3, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  difference {
    object { StateInternal scale<245.857, 154.000, 20.00> translate vert(State1_2, -4.0)  }
    object { StateInternal scale<238.481, 149.380, 20.00> translate vertex(State1_2, <0.000, 0.000, -4.500>) }
  }
    text { ttf LabelFont, "entityEntry.html", 1, 0 scale TextScale texture { LabelTecture } translate vertex(State1_2, <-98.929, 53.000, 0.000>) no_shadow }

  object { ChoicePseudostate rotate -x*90 scale 24.0 translate ChoicePseudostate1_3 }
    union{
    sphere_sweep { linear_spline, 2,  vert(ChoicePseudostate1_3, 4.0), LRd  vert(State1_1, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(ChoicePseudostate1_3, 4.0), LRd  vert(State1_1, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(ChoicePseudostate1_3, 4.0), LRd  vert(ChoicePseudostate1_3, 4.0), LRd  vertex(ChoicePseudostate1_3, <49.333, -57.026, 4.000>), LRd  vert(SubmachineState1_4, 4.0), LRd  vert(SubmachineState1_4, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(ChoicePseudostate1_3, 4.0), LRd  vert(ChoicePseudostate1_3, 4.0), LRd/1.0  vertex(ChoicePseudostate1_3, <49.333, -57.026, 4.000>), LRd/2.0  vert(SubmachineState1_4, 4.0), LRd/4.0  vert(SubmachineState1_4, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 scale 0.19243847150259066  translate vertex(SubmachineState1_4, <-80.247, 29.769, -5.966>) }
  object { SubmachineState scale <183.664, 74.281, 20.000> translate SubmachineState1_4 }
    text { ttf LabelFont, "entity list", 1, 0 scale TextScale texture { LabelTecture } translate vertex(SubmachineState1_4, <-81.832, 27.141, 0.000>) no_shadow }

    union{
    sphere_sweep { linear_spline, 2,  vert(SubmachineState1_4, 4.0), LRd  vert(ChoicePseudostate1_3, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(SubmachineState1_4, 4.0), LRd  vert(ChoicePseudostate1_3, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate1_5 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate1_5, 4.0), LRd  vert(State1_6, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate1_5, 4.0), LRd  vert(State1_6, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State1_6 }
    object { Circle_Text(LabelFont, "edit",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State1_6, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(State1_6, 4.0), LRd  vert(State1_6, 4.0), LRd  vertex(State1_6, <66.098, -2.846, 4.000>), LRd  vert(State1_7, 4.0), LRd  vert(State1_7, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(State1_6, 4.0), LRd  vert(State1_6, 4.0), LRd/1.0  vertex(State1_6, <66.098, -2.846, 4.000>), LRd/2.0  vert(State1_7, 4.0), LRd/4.0  vert(State1_7, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State1_7 }
    object { Circle_Text(LabelFont, "change",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State1_7, 30.0)  no_shadow }
    union{
    sphere_sweep { cubic_spline, 5,  vert(State1_7, 4.0), LRd  vert(State1_7, 4.0), LRd  vert(vertex(State1_7, <-208.284, -29.243, 4.000>), -28.0), LRd  vert(ChoicePseudostate1_3, 4.0), LRd  vert(ChoicePseudostate1_3, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(State1_7, 4.0), LRd  vert(State1_7, 4.0), LRd/1.0  vert(vertex(State1_7, <-208.284, -29.243, 4.000>), -28.0), LRd/2.0  vert(ChoicePseudostate1_3, 4.0), LRd/4.0  vert(ChoicePseudostate1_3, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 5,  vert(State1_7, 4.0), LRd  vert(State1_7, 4.0), LRd  vertex(State1_7, <-90.569, 8.487, 4.000>), LRd  vert(State1_6, 4.0), LRd  vert(State1_6, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5,  vert(State1_7, 4.0), LRd  vert(State1_7, 4.0), LRd/1.0  vertex(State1_7, <-90.569, 8.487, 4.000>), LRd/2.0  vert(State1_6, 4.0), LRd/4.0  vert(State1_6, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
}
#declare StateMachineDiagram_1u2y6174cfd7c659288bc9badb700978b1e1 = union {
#local InitialPseudostate0_0 = <169.111, -133.807, 0.0>;
#local State0_1 = <298.873, -133.807, 0.0>;
#local SubmachineState0_2 = <538.144, -133.807, 0.0>;

  object { InitialPseudostate rotate -x*90 scale 24.0 translate InitialPseudostate0_0 }
    union{
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_0, 4.0), LRd  vert(State0_1, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(InitialPseudostate0_0, 4.0), LRd  vert(State0_1, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate State0_1 }
    object { Circle_Text(LabelFont, "受付",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(State0_1, 30.0)  no_shadow }
    union{
    sphere_sweep { linear_spline, 2,  vert(State0_1, 4.0), LRd  vert(SubmachineState0_2, 4.0), LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(State0_1, 4.0), LRd  vert(SubmachineState0_2, 4.0), 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { StateMachineDiagram_bffke8128ac6c1d56428bfcbc5567f70b355 scale 0.2104284702549575  translate vertex(SubmachineState0_2, <-80.945, 13.227, -6.523>) }
  object { SubmachineState scale <175.622, 74.281, 20.000> translate SubmachineState0_2 }
    text { ttf LabelFont, "Entity", 1, 0 scale TextScale texture { LabelTecture } translate vertex(SubmachineState0_2, <-77.811, 27.141, 0.000>) no_shadow }

}
object { StateMachineDiagram_1u2y6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <392, -373, -437>;
#declare FOCUS = <392, -133, 0>;
camera { location EYE direction 1.25*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { StateMachineDiagramTexture }}
