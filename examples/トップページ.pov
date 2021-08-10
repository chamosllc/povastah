/**
 * astah* Diagram 3D Visualization
 * povastah トップページ
 * created at 2021/08/10
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare TextScale = <16, 16, 2>;
#declare LRd = 3.2;

#declare StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <130.000, -89.333, 0.000> }
  object { State rotate -x*90 scale 24.0 translate <232.569, -89.154, 0.000> }
    object { Circle_Text( LabelFont, "find",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <232.569, -89.154, 30.000> }
  difference { object { StateInternal scale<252.000, 180.307, 16.000> translate <460.667, -185.846, 0.000> }
    object { StateInternal scale<239.400, 98.117, 12.000> translate <460.667, -147.333, -6.000> }
    object { StateInternal scale<239.400, 73.175, 12.000> translate <460.667, -237.487, -6.000> }
  }
    text { ttf LabelFont, "show", 1, 0 scale TextScale texture { LabelTecture } translate <346.667, -111.693, -0.010> }
  object { State rotate -x*90 scale 24.0 translate <241.902, -222.487, 0.000> }
    object { Circle_Text( LabelFont, "select",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <241.902, -222.487, 30.000> }
  object { FinalState rotate -x*90 scale 24.0 translate <130.000, -250.667, 0.000> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <360.000, -167.154, 0.000> }
  object { State rotate -x*90 scale 24.0 translate <460.569, -167.154, 0.000> }
    object { Circle_Text( LabelFont, "entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <460.569, -167.154, 30.000> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <360.000, -235.820, 0.000> }
  object { State rotate -x*90 scale 24.0 translate <460.569, -235.820, 0.000> }
    object { Circle_Text( LabelFont, "type",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <460.569, -235.820, 30.000> }
  object { FinalState rotate -x*90 scale 24.0 translate <551.333, -167.154, 0.000> }
  object { FinalState rotate -x*90 scale 24.0 translate <549.333, -235.820, 0.000> }
    sphere_sweep { linear_spline, 2, <130.000, -89.333, 4.000>, LRd <232.569, -89.154, 4.000>, LRd material { TransitionMaterial }}
  torus { 36.0, LRd  translate <232.569, -89.154, -32.000>material { TransitionMaterial }}
  difference {
    sphere_sweep { cubic_spline, 5, <232.569, -89.154, 4.000>, LRd <232.569, -89.154, 4.000>, LRd <300.000, -55.333, 4.000>, LRd <460.667, -185.846, 4.000>, LRd <460.667, -185.846, 4.000>, LRd material { TransitionMaterial }}
    object { StateInternal scale<252.000, 180.307, 16.000> translate <460.667, -185.846, 0.000> }
  }
  difference {
    sphere_sweep { linear_spline, 2, <460.667, -185.846, 4.000>, LRd <241.902, -222.487, 4.000>, LRd material { TransitionMaterial }}
    object { StateInternal scale<252.000, 180.307, 16.000> translate <460.667, -185.846, 0.000> }
  }
    sphere_sweep { linear_spline, 2, <241.902, -222.487, 4.000>, LRd <130.000, -250.667, 4.000>, LRd material { TransitionMaterial }}
  difference {
    sphere_sweep { linear_spline, 2, <460.667, -185.846, 4.000>, LRd <232.569, -89.154, 4.000>, LRd material { TransitionMaterial }}
    object { StateInternal scale<252.000, 180.307, 16.000> translate <460.667, -185.846, 0.000> }
  }
    sphere_sweep { linear_spline, 2, <360.000, -167.154, 4.000>, LRd <460.569, -167.154, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <360.000, -235.820, 4.000>, LRd <460.569, -235.820, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <460.569, -167.154, 4.000>, LRd <551.333, -167.154, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <460.569, -235.820, 4.000>, LRd <549.333, -235.820, 4.000>, LRd material { TransitionMaterial }}
}
#declare StateMachineDiagram_bffke8128ac6c1d56428bfcbc5567f70b355 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.667, -132.667, 0.000> }
  object { State rotate -x*90 scale 24.0 translate <218.758, -13.820, 0.000> }
    object { Circle_Text( LabelFont, "show entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <218.758, -13.820, 30.000> }
  difference { object { StateInternal scale<245.857, 154.000, 16.000> translate <519.738, -41.359, 0.000> }
    object { StateInternal scale<233.564, 146.300, 12.000> translate <519.738, -41.359, -6.000> }
  }
    text { ttf LabelFont, "entityEntry.html", 1, 0 scale TextScale texture { LabelTecture } translate <408.810, 19.641, -0.010> }
  object { ChoicePseudostate rotate -x*90 scale 24.0 translate <168.000, -130.667, 0.000> }
  object { StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 scale 0.22926311728395063 translate <325.472, -163.822, -11.005> }
  object { SubmachineState scale <183.664, 74.281, 16.000> translate <412.019, -192.180, 0.000> }
    text { ttf LabelFont, "entity list", 1, 0 scale TextScale texture { LabelTecture } translate <332.187, -171.039, -0.010> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <422.667, -27.693, 0.000> }
  object { State rotate -x*90 scale 24.0 translate <495.235, -28.180, 0.000> }
    object { Circle_Text( LabelFont, "edit",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <495.235, -28.180, 30.000> }
  object { State rotate -x*90 scale 24.0 translate <584.569, -72.180, 0.000> }
    object { Circle_Text( LabelFont, "change",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <584.569, -72.180, 30.000> }
    sphere_sweep { linear_spline, 2, <88.667, -132.667, 4.000>, LRd <168.000, -130.667, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <168.000, -130.667, 4.000>, LRd <218.758, -13.820, 4.000>, LRd material { TransitionMaterial }}
  difference {
    sphere_sweep { linear_spline, 2, <218.758, -13.820, 4.000>, LRd <519.738, -41.359, 4.000>, LRd material { TransitionMaterial }}
    object { StateInternal scale<245.857, 154.000, 16.000> translate <519.738, -41.359, 0.000> }
  }
    sphere_sweep { linear_spline, 2, <584.569, -72.180, 4.000>, LRd <168.000, -130.667, 4.000>, LRd material { TransitionMaterial }}
  torus { 36.0, LRd  translate <218.758, -13.820, -32.000>material { TransitionMaterial }}
    sphere_sweep { cubic_spline, 5, <218.758, -13.820, 4.000>, LRd <218.758, -13.820, 4.000>, LRd <159.333, -56.333, 4.000>, LRd <168.000, -130.667, 4.000>, LRd <168.000, -130.667, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <412.019, -192.180, 4.000>, LRd <168.000, -130.667, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { cubic_spline, 5, <168.000, -130.667, 4.000>, LRd <168.000, -130.667, 4.000>, LRd <258.667, -185.000, 4.000>, LRd <412.019, -192.180, 4.000>, LRd <412.019, -192.180, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <422.667, -27.693, 4.000>, LRd <495.235, -28.180, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { cubic_spline, 5, <495.235, -28.180, 4.000>, LRd <495.235, -28.180, 4.000>, LRd <561.333, -31.026, 4.000>, LRd <584.569, -72.180, 4.000>, LRd <584.569, -72.180, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { cubic_spline, 5, <584.569, -72.180, 4.000>, LRd <584.569, -72.180, 4.000>, LRd <494.000, -63.693, 4.000>, LRd <495.235, -28.180, 4.000>, LRd <495.235, -28.180, 4.000>, LRd material { TransitionMaterial }}
}
#declare StateMachineDiagram_1u2y6174cfd7c659288bc9badb700978b1e1 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <169.111, -133.807, 0.000> }
  object { State rotate -x*90 scale 24.0 translate <298.873, -133.807, 0.000> }
    object { Circle_Text( LabelFont, "受付",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <298.873, -133.807, 30.000> }
  object { StateMachineDiagram_bffke8128ac6c1d56428bfcbc5567f70b355 scale 0.2104284702549575 translate <457.199, -120.580, -10.101> }
  object { SubmachineState scale <175.622, 74.281, 16.000> translate <538.144, -133.807, 0.000> }
    text { ttf LabelFont, "Entity", 1, 0 scale TextScale texture { LabelTecture } translate <462.333, -112.667, -0.010> }
    sphere_sweep { linear_spline, 2, <298.873, -133.807, 4.000>, LRd <538.144, -133.807, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <169.111, -133.807, 4.000>, LRd <298.873, -133.807, 4.000>, LRd material { TransitionMaterial }}
}
object { StateMachineDiagram_1u2y6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <392.611, -373.667, -478.278>;
#declare FOCUS = <392.611, -133.667, 0.000>;
camera { location EYE direction 1.4*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
