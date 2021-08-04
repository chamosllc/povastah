/**
 * astah* Diagram 3D Visualization
 * povastah トップページ
 * created at 2021/08/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <130.00, -89.33, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <130.00, -89.33, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <232.57, -89.15, 0.00> }
    object { Circle_Text( LabelFont, "find", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <232.57, -89.15, 30.00> }
  difference { object { StateInternal scale<252.00, 180.31, 16.00> translate <460.67, -185.85, 0.00> }
    object { StateInternal scale<239.40, 98.12, 12.00> translate <460.67, -147.33, -6.00> }
    object { StateInternal scale<239.40, 73.17, 12.00> translate <460.67, -237.49, -6.00> }
  }
    text { ttf LabelFont, "show", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <346.67, -111.69, -0.01> }
  object { State rotate -x*90 scale 24.0 translate <241.90, -222.49, 0.00> }
    object { Circle_Text( LabelFont, "select", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <241.90, -222.49, 30.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <130.00, -250.67, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <130.00, -250.67, 30.00> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <360.00, -167.15, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <360.00, -167.15, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <460.57, -167.15, 0.00> }
    object { Circle_Text( LabelFont, "entity", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <460.57, -167.15, 30.00> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <360.00, -235.82, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <360.00, -235.82, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <460.57, -235.82, 0.00> }
    object { Circle_Text( LabelFont, "type", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <460.57, -235.82, 30.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <551.33, -167.15, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <551.33, -167.15, 30.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <549.33, -235.82, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <549.33, -235.82, 30.00> }
    sphere_sweep { linear_spline, 2, <130.00, -89.33, 4.00>, 3.0 <232.57, -89.15, 4.00>, 3.0 texture { TransitionTexture }}
  torus { 36.0, 3.0 translate <232.57, -89.15, -32.00>texture { TransitionTexture }}
  difference {
    sphere_sweep { cubic_spline, 5, <232.57, -89.15, 4.00>, 3.0 <232.57, -89.15, 4.00>, 3.0 <300.00, -55.33, 4.00>, 3.0 <460.67, -185.85, 4.00>, 3.0 <460.67, -185.85, 4.00>, 3.0 texture { TransitionTexture }}
    object { StateInternal scale<252.00, 180.31, 16.00> translate <460.67, -185.85, 0.00> }
  }
  difference {
    sphere_sweep { linear_spline, 2, <460.67, -185.85, 4.00>, 3.0 <241.90, -222.49, 4.00>, 3.0 texture { TransitionTexture }}
    object { StateInternal scale<252.00, 180.31, 16.00> translate <460.67, -185.85, 0.00> }
  }
    sphere_sweep { linear_spline, 2, <241.90, -222.49, 4.00>, 3.0 <130.00, -250.67, 4.00>, 3.0 texture { TransitionTexture }}
  difference {
    sphere_sweep { linear_spline, 2, <460.67, -185.85, 4.00>, 3.0 <232.57, -89.15, 4.00>, 3.0 texture { TransitionTexture }}
    object { StateInternal scale<252.00, 180.31, 16.00> translate <460.67, -185.85, 0.00> }
  }
    sphere_sweep { linear_spline, 2, <360.00, -167.15, 4.00>, 3.0 <460.57, -167.15, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <360.00, -235.82, 4.00>, 3.0 <460.57, -235.82, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <460.57, -167.15, 4.00>, 3.0 <551.33, -167.15, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <460.57, -235.82, 4.00>, 3.0 <549.33, -235.82, 4.00>, 3.0 texture { TransitionTexture }}
}
#declare StateMachineDiagram_bffke8128ac6c1d56428bfcbc5567f70b355 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.67, -132.67, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <88.67, -132.67, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <218.76, -13.82, 0.00> }
    object { Circle_Text( LabelFont, "show entity", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <218.76, -13.82, 30.00> }
  difference { object { StateInternal scale<245.86, 154.00, 16.00> translate <519.74, -41.36, 0.00> }
    object { StateInternal scale<233.56, 146.30, 12.00> translate <519.74, -41.36, -6.00> }
  }
    text { ttf LabelFont, "entityEntry.html", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <408.81, 19.64, -0.01> }
  object { ChoicePseudostate rotate -x*90 scale 24.0 translate <168.00, -130.67, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <168.00, -130.67, 30.00> }
  object { StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 scale 0.26913496376811596 translate <316.88, -152.43, -12.92> }
  object { SubmachineState scale<183.66, 74.28, 16.00> translate <412.02, -192.18, 0.00> }
    text { ttf LabelFont, "entity list", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <332.19, -171.04, -0.01> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <422.67, -27.69, 0.00> }
    object { Circle_Text( LabelFont, "開始擬似状態0", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <422.67, -27.69, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <495.24, -28.18, 0.00> }
    object { Circle_Text( LabelFont, "edit", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <495.24, -28.18, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <584.57, -72.18, 0.00> }
    object { Circle_Text( LabelFont, "change", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <584.57, -72.18, 30.00> }
    sphere_sweep { linear_spline, 2, <88.67, -132.67, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <168.00, -130.67, 4.00>, 3.0 <218.76, -13.82, 4.00>, 3.0 texture { TransitionTexture }}
  difference {
    sphere_sweep { linear_spline, 2, <218.76, -13.82, 4.00>, 3.0 <519.74, -41.36, 4.00>, 3.0 texture { TransitionTexture }}
    object { StateInternal scale<245.86, 154.00, 16.00> translate <519.74, -41.36, 0.00> }
  }
    sphere_sweep { linear_spline, 2, <584.57, -72.18, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 texture { TransitionTexture }}
  torus { 36.0, 3.0 translate <218.76, -13.82, -32.00>texture { TransitionTexture }}
    sphere_sweep { cubic_spline, 5, <218.76, -13.82, 4.00>, 3.0 <218.76, -13.82, 4.00>, 3.0 <159.33, -56.33, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <412.02, -192.18, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { cubic_spline, 5, <168.00, -130.67, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 <258.67, -185.00, 4.00>, 3.0 <412.02, -192.18, 4.00>, 3.0 <412.02, -192.18, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <422.67, -27.69, 4.00>, 3.0 <495.24, -28.18, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { cubic_spline, 5, <495.24, -28.18, 4.00>, 3.0 <495.24, -28.18, 4.00>, 3.0 <561.33, -31.03, 4.00>, 3.0 <584.57, -72.18, 4.00>, 3.0 <584.57, -72.18, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { cubic_spline, 5, <584.57, -72.18, 4.00>, 3.0 <584.57, -72.18, 4.00>, 3.0 <494.00, -63.69, 4.00>, 3.0 <495.24, -28.18, 4.00>, 3.0 <495.24, -28.18, 4.00>, 3.0 texture { TransitionTexture }}
}
#declare StateMachineDiagram_1u2y6174cfd7c659288bc9badb700978b1e1 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <169.11, -133.81, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <169.11, -133.81, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <298.87, -133.81, 0.00> }
    object { Circle_Text( LabelFont, "受付", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <298.87, -133.81, 30.00> }
  object { StateMachineDiagram_bffke8128ac6c1d56428bfcbc5567f70b355 scale 0.2435450819672131 translate <450.31, -112.65, -11.69> }
  object { SubmachineState scale<175.62, 74.28, 16.00> translate <538.14, -133.81, 0.00> }
    text { ttf LabelFont, "Entity", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <462.33, -112.67, -0.01> }
    sphere_sweep { linear_spline, 2, <298.87, -133.81, 4.00>, 3.0 <538.14, -133.81, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <169.11, -133.81, 4.00>, 3.0 <298.87, -133.81, 4.00>, 3.0 texture { TransitionTexture }}
}
object { StateMachineDiagram_1u2y6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <392.61, -313.67, -438.28>;
#declare FOCUS = <392.61, -133.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
