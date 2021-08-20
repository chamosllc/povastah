/**
 * astah* Diagram 3D Visualization
 * ステートマシン図/トップページ
 * created at 2021/08/19
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

#declare StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <130.000, -89.333, 0.00> }
    union{
    sphere_sweep { cubic_spline, 2, <130.000, -89.333, 4.00>, LRd <232.569, -89.154, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 2, <130.000, -89.333, 4.00>, LRd/0.25 <232.569, -89.154, 4.00>, LRd/0.5 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <232.569, -89.154, 0.00> }
    object { Circle_Text( LabelFont, "find",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <232.569, -89.154, 30.00> }
    torus { LOOPRd, LRd translate<232.56875813802083, -89.15364583333333, 4.0 - LOOPRd> material { TransitionMaterial } no_shadow }
  difference {
    sphere_sweep { cubic_spline, 3, <232.569, -89.154, 4.00>, LRd <300.000, -55.333, 0.00>, LRd <540.000, -115.846, 4.00>, LRd material { TransitionMaterial }  }
    object { StateInternal scale<246.960, 176.701, 20.00> translate <540.000, -115.846, 0.00> }
    no_shadow }
  difference {    sphere_sweep { cubic_spline, 3, <232.569, -89.154, 4.00>, LRd/0.25 <300.000, -55.333, 0.00>, LRd/0.5 <540.000, -115.846, 4.00>, LRd/1.0 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<246.960, 176.701, 20.00> translate <540.000, -115.846, 0.00> }
    no_image }
  difference {
    object { StateInternal scale<252.000, 180.307, 20.00> translate <540.000, -115.846, -4.00> }
    object { StateInternal scale<246.960, 101.216, 20.00> translate <540.000, -77.333, -4.50> }
    object { StateInternal scale<246.960, 75.486, 20.00> translate <540.000, -167.487, -4.50> }
  }
    text { ttf LabelFont, "show", 1, 0 scale TextScale texture { LabelTecture } translate <424.000, -35.693, 30.00> }
  difference {
    sphere_sweep { cubic_spline, 2, <540.000, -115.846, 4.00>, LRd <241.667, -213.487, 4.00>, LRd material { TransitionMaterial }  }
    object { StateInternal scale<246.960, 176.701, 20.00> translate <540.000, -115.846, 0.00> }
    object { StateInternal scale<199.267, 128.354, 20.00> translate <241.667, -213.487, 0.00> }
    no_shadow }
  difference {    sphere_sweep { cubic_spline, 2, <540.000, -115.846, 4.00>, LRd/0.25 <241.667, -213.487, 4.00>, LRd/0.5 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<246.960, 176.701, 20.00> translate <540.000, -115.846, 0.00> }
    object { StateInternal scale<199.267, 128.354, 20.00> translate <241.667, -213.487, 0.00> }
    no_image }
  difference {
    sphere_sweep { cubic_spline, 2, <540.000, -115.846, 4.00>, LRd <232.569, -89.154, 4.00>, LRd material { TransitionMaterial }  }
    object { StateInternal scale<246.960, 176.701, 20.00> translate <540.000, -115.846, 0.00> }
    no_shadow }
  difference {    sphere_sweep { cubic_spline, 2, <540.000, -115.846, 4.00>, LRd/0.25 <232.569, -89.154, 4.00>, LRd/0.5 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<246.960, 176.701, 20.00> translate <540.000, -115.846, 0.00> }
    no_image }
  difference {
    object { StateInternal scale<203.333, 130.974, 20.00> translate <241.667, -213.487, -4.00> }
    object { StateInternal scale<199.267, 128.354, 20.00> translate <241.667, -213.487, -4.50> }
  }
    text { ttf LabelFont, "select", 1, 0 scale TextScale texture { LabelTecture } translate <150.000, -158.000, 30.00> }
  difference {
    sphere_sweep { cubic_spline, 2, <241.667, -213.487, 4.00>, LRd <243.333, -335.333, 4.00>, LRd material { TransitionMaterial }  }
    object { StateInternal scale<199.267, 128.354, 20.00> translate <241.667, -213.487, 0.00> }
    no_shadow }
  difference {    sphere_sweep { cubic_spline, 2, <241.667, -213.487, 4.00>, LRd/0.25 <243.333, -335.333, 4.00>, LRd/0.5 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<199.267, 128.354, 20.00> translate <241.667, -213.487, 0.00> }
    no_image }
  object { FinalState rotate -x*90 scale 24.0 translate <243.333, -335.333, 0.00> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <439.333, -97.154, 0.00> }
    union{
    sphere_sweep { cubic_spline, 5, <439.333, -97.154, 4.00>, LRd <439.333, -97.154, 4.00>, LRd <489.618, -97.154, 40.00>, LRd <539.902, -97.154, 4.00>, LRd <539.902, -97.154, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <439.333, -97.154, 4.00>, LRd/0.25 <439.333, -97.154, 4.00>, LRd/0.5 <489.618, -97.154, 40.00>, LRd/1.0 <539.902, -97.154, 4.00>, LRd/2.0 <539.902, -97.154, 4.00>, LRd/4.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <539.902, -97.154, 0.00> }
    object { Circle_Text( LabelFont, "entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <539.902, -97.154, 30.00> }
    union{
    sphere_sweep { cubic_spline, 5, <539.902, -97.154, 4.00>, LRd <539.902, -97.154, 4.00>, LRd <585.284, -97.154, 40.00>, LRd <630.667, -97.154, 4.00>, LRd <630.667, -97.154, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <539.902, -97.154, 4.00>, LRd/0.25 <539.902, -97.154, 4.00>, LRd/0.5 <585.284, -97.154, 40.00>, LRd/1.0 <630.667, -97.154, 4.00>, LRd/2.0 <630.667, -97.154, 4.00>, LRd/4.0 material { ShadowTransitionMaterial } no_image }
    }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <439.333, -165.820, 0.00> }
    union{
    sphere_sweep { cubic_spline, 5, <439.333, -165.820, 4.00>, LRd <439.333, -165.820, 4.00>, LRd <489.618, -165.820, 40.00>, LRd <539.902, -165.820, 4.00>, LRd <539.902, -165.820, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <439.333, -165.820, 4.00>, LRd/0.25 <439.333, -165.820, 4.00>, LRd/0.5 <489.618, -165.820, 40.00>, LRd/1.0 <539.902, -165.820, 4.00>, LRd/2.0 <539.902, -165.820, 4.00>, LRd/4.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <539.902, -165.820, 0.00> }
    object { Circle_Text( LabelFont, "type",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <539.902, -165.820, 30.00> }
    union{
    sphere_sweep { cubic_spline, 5, <539.902, -165.820, 4.00>, LRd <539.902, -165.820, 4.00>, LRd <584.284, -165.820, 40.00>, LRd <628.667, -165.820, 4.00>, LRd <628.667, -165.820, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <539.902, -165.820, 4.00>, LRd/0.25 <539.902, -165.820, 4.00>, LRd/0.5 <584.284, -165.820, 40.00>, LRd/1.0 <628.667, -165.820, 4.00>, LRd/2.0 <628.667, -165.820, 4.00>, LRd/4.0 material { ShadowTransitionMaterial } no_image }
    }
  object { FinalState rotate -x*90 scale 24.0 translate <630.667, -97.154, 0.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <628.667, -165.820, 0.00> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <164.667, -196.000, 0.00> }
    union{
    sphere_sweep { cubic_spline, 5, <164.667, -196.000, 4.00>, LRd <164.667, -196.000, 4.00>, LRd <198.951, -211.577, 40.00>, LRd <233.235, -227.154, 4.00>, LRd <233.235, -227.154, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <164.667, -196.000, 4.00>, LRd/0.25 <164.667, -196.000, 4.00>, LRd/0.5 <198.951, -211.577, 40.00>, LRd/1.0 <233.235, -227.154, 4.00>, LRd/2.0 <233.235, -227.154, 4.00>, LRd/4.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <233.235, -227.154, 0.00> }
    object { Circle_Text( LabelFont, "do",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <233.235, -227.154, 30.00> }
    union{
    sphere_sweep { cubic_spline, 5, <233.235, -227.154, 4.00>, LRd <233.235, -227.154, 4.00>, LRd <269.951, -236.243, 40.00>, LRd <306.667, -245.333, 4.00>, LRd <306.667, -245.333, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <233.235, -227.154, 4.00>, LRd/0.25 <233.235, -227.154, 4.00>, LRd/0.5 <269.951, -236.243, 40.00>, LRd/1.0 <306.667, -245.333, 4.00>, LRd/2.0 <306.667, -245.333, 4.00>, LRd/4.0 material { ShadowTransitionMaterial } no_image }
    }
  object { FinalState rotate -x*90 scale 24.0 translate <306.667, -245.333, 0.00> }
}
#declare StateMachineDiagram_bffke8128ac6c1d56428bfcbc5567f70b355 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.667, -132.667, 0.00> }
    union{
    sphere_sweep { linear_spline, 2, <88.667, -132.667, 4.00>, LRd <168.000, -130.667, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <88.667, -132.667, 4.00>, LRd/0.25 <168.000, -130.667, 4.00>, LRd/0.5 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <218.758, -13.820, 0.00> }
    object { Circle_Text( LabelFont, "show entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <218.758, -13.820, 30.00> }
  difference {
    sphere_sweep { linear_spline, 2, <218.758, -13.820, 4.00>, LRd <519.738, -41.359, 4.00>, LRd material { TransitionMaterial }  }
    object { StateInternal scale<240.940, 150.920, 20.00> translate <519.738, -41.359, 0.00> }
    no_shadow }
  difference {    sphere_sweep { linear_spline, 2, <218.758, -13.820, 4.00>, LRd/0.25 <519.738, -41.359, 4.00>, LRd/0.5 material { ShadowTransitionMaterial }  }
    object { StateInternal scale<240.940, 150.920, 20.00> translate <519.738, -41.359, 0.00> }
    no_image }
    torus { LOOPRd, LRd translate<218.7576350911458, -13.820312499999993, 4.0 - LOOPRd> material { TransitionMaterial } no_shadow }
    union{
    sphere_sweep { cubic_spline, 3, <218.758, -13.820, 4.00>, LRd <159.333, -56.333, 0.00>, LRd <168.000, -130.667, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 3, <218.758, -13.820, 4.00>, LRd/0.25 <159.333, -56.333, 0.00>, LRd/0.5 <168.000, -130.667, 4.00>, LRd/1.0 material { ShadowTransitionMaterial } no_image }
    }
  difference {
    object { StateInternal scale<245.857, 154.000, 20.00> translate <519.738, -41.359, -4.00> }
    object { StateInternal scale<240.940, 150.920, 20.00> translate <519.738, -41.359, -4.50> }
  }
    text { ttf LabelFont, "entityEntry.html", 1, 0 scale TextScale texture { LabelTecture } translate <406.810, 25.641, 30.00> }
  object { ChoicePseudostate rotate -x*90 scale 24.0 translate <168.000, -130.667, 0.00> }
    union{
    sphere_sweep { linear_spline, 2, <168.000, -130.667, 4.00>, LRd <218.758, -13.820, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <168.000, -130.667, 4.00>, LRd/0.25 <218.758, -13.820, 4.00>, LRd/0.5 material { ShadowTransitionMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 3, <168.000, -130.667, 4.00>, LRd <258.667, -185.000, 0.00>, LRd <412.019, -192.180, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 3, <168.000, -130.667, 4.00>, LRd/0.25 <258.667, -185.000, 0.00>, LRd/0.5 <412.019, -192.180, 4.00>, LRd/1.0 material { ShadowTransitionMaterial } no_image }
    }
  object { StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 scale 0.18853109137055837 translate <333.401, -165.212, -9.05> }
  object { SubmachineState scale <183.664, 74.281, 20.00> translate <412.019, -192.180, 0.00> }
    text { ttf LabelFont, "entity list", 1, 0 scale TextScale texture { LabelTecture } translate <330.187, -165.039, 0.00> }
    union{
    sphere_sweep { linear_spline, 2, <412.019, -192.180, 4.00>, LRd <168.000, -130.667, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <412.019, -192.180, 4.00>, LRd/0.25 <168.000, -130.667, 4.00>, LRd/0.5 material { ShadowTransitionMaterial } no_image }
    }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <422.667, -27.693, 0.00> }
    union{
    sphere_sweep { cubic_spline, 5, <422.667, -27.693, 4.00>, LRd <422.667, -27.693, 4.00>, LRd <458.951, -27.936, 40.00>, LRd <495.235, -28.180, 4.00>, LRd <495.235, -28.180, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <422.667, -27.693, 4.00>, LRd/0.25 <422.667, -27.693, 4.00>, LRd/0.5 <458.951, -27.936, 40.00>, LRd/1.0 <495.235, -28.180, 4.00>, LRd/2.0 <495.235, -28.180, 4.00>, LRd/4.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <495.235, -28.180, 0.00> }
    object { Circle_Text( LabelFont, "edit",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <495.235, -28.180, 30.00> }
    union{
    sphere_sweep { cubic_spline, 6, <495.235, -28.180, 4.00>, LRd <495.235, -28.180, 4.00>, LRd <495.235, -28.180, 4.00>, LRd <584.569, -72.180, 4.00>, LRd <584.569, -72.180, 4.00>, LRd <584.569, -72.180, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 6, <495.235, -28.180, 4.00>, LRd/0.25 <495.235, -28.180, 4.00>, LRd/0.5 <495.235, -28.180, 4.00>, LRd/1.0 <584.569, -72.180, 4.00>, LRd/2.0 <584.569, -72.180, 4.00>, LRd/4.0 <584.569, -72.180, 4.00>, LRd/8.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <584.569, -72.180, 0.00> }
    object { Circle_Text( LabelFont, "change",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <584.569, -72.180, 30.00> }
    union{
    sphere_sweep { linear_spline, 5, <584.569, -72.180, 4.00>, LRd <584.569, -72.180, 4.00>, LRd <188.142, -50.712, 40.00>, LRd <168.000, -130.667, 4.00>, LRd <168.000, -130.667, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 5, <584.569, -72.180, 4.00>, LRd/0.25 <584.569, -72.180, 4.00>, LRd/0.5 <188.142, -50.712, 40.00>, LRd/1.0 <168.000, -130.667, 4.00>, LRd/2.0 <168.000, -130.667, 4.00>, LRd/4.0 material { ShadowTransitionMaterial } no_image }
    }
    union{
    sphere_sweep { cubic_spline, 6, <584.569, -72.180, 4.00>, LRd <584.569, -72.180, 4.00>, LRd <584.569, -72.180, 4.00>, LRd <495.235, -28.180, 4.00>, LRd <495.235, -28.180, 4.00>, LRd <495.235, -28.180, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 6, <584.569, -72.180, 4.00>, LRd/0.25 <584.569, -72.180, 4.00>, LRd/0.5 <584.569, -72.180, 4.00>, LRd/1.0 <495.235, -28.180, 4.00>, LRd/2.0 <495.235, -28.180, 4.00>, LRd/4.0 <495.235, -28.180, 4.00>, LRd/8.0 material { ShadowTransitionMaterial } no_image }
    }
}
#declare StateMachineDiagram_1u2y6174cfd7c659288bc9badb700978b1e1 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <169.111, -133.807, 0.00> }
    union{
    sphere_sweep { linear_spline, 2, <169.111, -133.807, 4.00>, LRd <298.873, -133.807, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <169.111, -133.807, 4.00>, LRd/0.25 <298.873, -133.807, 4.00>, LRd/0.5 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <298.873, -133.807, 0.00> }
    object { Circle_Text( LabelFont, "受付",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <298.873, -133.807, 30.00> }
    union{
    sphere_sweep { linear_spline, 2, <298.873, -133.807, 4.00>, LRd <538.144, -133.807, 4.00>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <298.873, -133.807, 4.00>, LRd/0.25 <538.144, -133.807, 4.00>, LRd/0.5 material { ShadowTransitionMaterial } no_image }
    }
  object { StateMachineDiagram_bffke8128ac6c1d56428bfcbc5567f70b355 scale 0.2104284702549575 translate <457.199, -122.479, -10.10> }
  object { SubmachineState scale <175.622, 74.281, 20.00> translate <538.144, -133.807, 0.00> }
    text { ttf LabelFont, "Entity", 1, 0 scale TextScale texture { LabelTecture } translate <460.333, -106.667, 0.00> }
}
object { StateMachineDiagram_1u2y6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <392, -373, -437>;
#declare FOCUS = <392, -133, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { StateMachineDiagramTexture }}
