/**
 * astah* Diagram 3D Visualization
 * povastah エンティティ画面
 * created at 2021/08/08
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <130.000, -89.333, 0.000> }
  object { State rotate -x*90 scale 24.0 translate <232.569, -89.154, 0.000> }
    object { Circle_Text( LabelFont, "find",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <232.569, -89.154, 30.000> }
  difference { object { StateInternal scale<252.000, 180.307, 16.000> translate <460.667, -185.846, 0.000> }
    object { StateInternal scale<239.400, 98.117, 12.000> translate <460.667, -147.333, -6.000> }
    object { StateInternal scale<239.400, 73.175, 12.000> translate <460.667, -237.487, -6.000> }
  }
    text { ttf LabelFont, "show", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <346.667, -111.693, -0.010> }
  object { State rotate -x*90 scale 24.0 translate <241.902, -222.487, 0.000> }
    object { Circle_Text( LabelFont, "select",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <241.902, -222.487, 30.000> }
  object { FinalState rotate -x*90 scale 24.0 translate <130.000, -250.667, 0.000> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <360.000, -167.154, 0.000> }
  object { State rotate -x*90 scale 24.0 translate <460.569, -167.154, 0.000> }
    object { Circle_Text( LabelFont, "entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <460.569, -167.154, 30.000> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <360.000, -235.820, 0.000> }
  object { State rotate -x*90 scale 24.0 translate <460.569, -235.820, 0.000> }
    object { Circle_Text( LabelFont, "type",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <460.569, -235.820, 30.000> }
  object { FinalState rotate -x*90 scale 24.0 translate <551.333, -167.154, 0.000> }
  object { FinalState rotate -x*90 scale 24.0 translate <549.333, -235.820, 0.000> }
    sphere_sweep { linear_spline, 2, <130.000, -89.333, 4.000>, 3.0 <232.569, -89.154, 4.000>, 3.0 texture { TransitionTexture }}
  torus { 36.0, 3.0 translate <232.569, -89.154, -32.000>texture { TransitionTexture }}
  difference {
    sphere_sweep { cubic_spline, 5, <232.569, -89.154, 4.000>, 3.0 <232.569, -89.154, 4.000>, 3.0 <300.000, -55.333, 4.000>, 3.0 <460.667, -185.846, 4.000>, 3.0 <460.667, -185.846, 4.000>, 3.0 texture { TransitionTexture }}
    object { StateInternal scale<252.000, 180.307, 16.000> translate <460.667, -185.846, 0.000> }
  }
  difference {
    sphere_sweep { linear_spline, 2, <460.667, -185.846, 4.000>, 3.0 <241.902, -222.487, 4.000>, 3.0 texture { TransitionTexture }}
    object { StateInternal scale<252.000, 180.307, 16.000> translate <460.667, -185.846, 0.000> }
  }
    sphere_sweep { linear_spline, 2, <241.902, -222.487, 4.000>, 3.0 <130.000, -250.667, 4.000>, 3.0 texture { TransitionTexture }}
  difference {
    sphere_sweep { linear_spline, 2, <460.667, -185.846, 4.000>, 3.0 <232.569, -89.154, 4.000>, 3.0 texture { TransitionTexture }}
    object { StateInternal scale<252.000, 180.307, 16.000> translate <460.667, -185.846, 0.000> }
  }
    sphere_sweep { linear_spline, 2, <360.000, -167.154, 4.000>, 3.0 <460.569, -167.154, 4.000>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <360.000, -235.820, 4.000>, 3.0 <460.569, -235.820, 4.000>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <460.569, -167.154, 4.000>, 3.0 <551.333, -167.154, 4.000>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <460.569, -235.820, 4.000>, 3.0 <549.333, -235.820, 4.000>, 3.0 texture { TransitionTexture }}
}
#declare StateMachineDiagram_bffke8128ac6c1d56428bfcbc5567f70b355 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.667, -132.667, 0.000> }
  object { State rotate -x*90 scale 24.0 translate <218.758, -13.820, 0.000> }
    object { Circle_Text( LabelFont, "show entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <218.758, -13.820, 30.000> }
  difference { object { StateInternal scale<245.857, 154.000, 16.000> translate <519.738, -41.359, 0.000> }
    object { StateInternal scale<233.564, 146.300, 12.000> translate <519.738, -41.359, -6.000> }
  }
    text { ttf LabelFont, "entityEntry.html", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <408.810, 19.641, -0.010> }
  object { ChoicePseudostate rotate -x*90 scale 24.0 translate <168.000, -130.667, 0.000> }
  object { StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 scale 0.22926311728395063 translate <325.472, -163.822, -11.005> }
  object { SubmachineState scale <183.664, 74.281, 16.000> translate <412.019, -192.180, 0.000> }
    text { ttf LabelFont, "entity list", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <332.187, -171.039, -0.010> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <422.667, -27.693, 0.000> }
  object { State rotate -x*90 scale 24.0 translate <495.235, -28.180, 0.000> }
    object { Circle_Text( LabelFont, "edit",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <495.235, -28.180, 30.000> }
  object { State rotate -x*90 scale 24.0 translate <584.569, -72.180, 0.000> }
    object { Circle_Text( LabelFont, "change",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <584.569, -72.180, 30.000> }
    sphere_sweep { linear_spline, 2, <88.667, -132.667, 4.000>, 3.0 <168.000, -130.667, 4.000>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <168.000, -130.667, 4.000>, 3.0 <218.758, -13.820, 4.000>, 3.0 texture { TransitionTexture }}
  difference {
    sphere_sweep { linear_spline, 2, <218.758, -13.820, 4.000>, 3.0 <519.738, -41.359, 4.000>, 3.0 texture { TransitionTexture }}
    object { StateInternal scale<245.857, 154.000, 16.000> translate <519.738, -41.359, 0.000> }
  }
    sphere_sweep { linear_spline, 2, <584.569, -72.180, 4.000>, 3.0 <168.000, -130.667, 4.000>, 3.0 texture { TransitionTexture }}
  torus { 36.0, 3.0 translate <218.758, -13.820, -32.000>texture { TransitionTexture }}
    sphere_sweep { cubic_spline, 5, <218.758, -13.820, 4.000>, 3.0 <218.758, -13.820, 4.000>, 3.0 <159.333, -56.333, 4.000>, 3.0 <168.000, -130.667, 4.000>, 3.0 <168.000, -130.667, 4.000>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <412.019, -192.180, 4.000>, 3.0 <168.000, -130.667, 4.000>, 3.0 texture { TransitionTexture }}
    sphere_sweep { cubic_spline, 5, <168.000, -130.667, 4.000>, 3.0 <168.000, -130.667, 4.000>, 3.0 <258.667, -185.000, 4.000>, 3.0 <412.019, -192.180, 4.000>, 3.0 <412.019, -192.180, 4.000>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <422.667, -27.693, 4.000>, 3.0 <495.235, -28.180, 4.000>, 3.0 texture { TransitionTexture }}
    sphere_sweep { cubic_spline, 5, <495.235, -28.180, 4.000>, 3.0 <495.235, -28.180, 4.000>, 3.0 <561.333, -31.026, 4.000>, 3.0 <584.569, -72.180, 4.000>, 3.0 <584.569, -72.180, 4.000>, 3.0 texture { TransitionTexture }}
    sphere_sweep { cubic_spline, 5, <584.569, -72.180, 4.000>, 3.0 <584.569, -72.180, 4.000>, 3.0 <494.000, -63.693, 4.000>, 3.0 <495.235, -28.180, 4.000>, 3.0 <495.235, -28.180, 4.000>, 3.0 texture { TransitionTexture }}
}
object { StateMachineDiagram_bffke8128ac6c1d56428bfcbc5567f70b355 }
#declare EYE = <360.667, -326.859, -399.526>;
#declare FOCUS = <360.667, -86.859, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.000, -1000.000, -3000.000> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
