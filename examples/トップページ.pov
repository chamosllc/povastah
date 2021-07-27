/**
 * astah* Diagram 3D Visualization
 * povastah トップページ
 * created at 2021/07/27
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare StateMachineDiagram_e7_881a9fa389742b575ef0aabbe66a5249 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <130.00, -89.33, 0.00> }
  object { State rotate -x*90 scale 24.0 translate <232.57, -89.15, 0.00> }
  text { ttf LabelFont, "find", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <239.91, -125.15, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <392.57, -167.15, 0.00> }
  text { ttf LabelFont, "show", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <393.35, -203.15, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <241.90, -222.49, 0.00> }
  text { ttf LabelFont, "select", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <232.16, -258.49, 30.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <130.00, -222.67, 0.00> }
    sphere_sweep { linear_spline, 2, <130.00, -89.33, 4.00>, 3.0 <232.57, -89.15, 4.00>, 3.0 texture { TransitionTexture }}
  torus { 36.0, 3.0 translate <232.57, -89.15, -32.00>texture { TransitionTexture }}
    sphere_sweep { cubic_spline, 5, <232.57, -89.15, 4.00>, 3.0 <232.57, -89.15, 4.00>, 3.0 <300.00, -55.33, 4.00>, 3.0 <392.57, -167.15, 4.00>, 3.0 <392.57, -167.15, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <392.57, -167.15, 4.00>, 3.0 <241.90, -222.49, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <241.90, -222.49, 4.00>, 3.0 <130.00, -222.67, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <392.57, -167.15, 4.00>, 3.0 <232.57, -89.15, 4.00>, 3.0 texture { TransitionTexture }}
}
#declare StateMachineDiagram_bffk_e8128ac6c1d56428bfcbc5567f70b355 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.67, -131.33, 0.00> }
  object { State rotate -x*90 scale 24.0 translate <218.76, -13.82, 0.00> }
  text { ttf LabelFont, "show entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <167.29, -49.82, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <435.97, -53.82, 0.00> }
  text { ttf LabelFont, "entityEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <347.33, -89.82, 30.00> }
  object { ChoicePseudostate rotate -x*90 scale 24.0 translate <168.00, -130.67, 0.00> }
  object { SubmachineState rotate -x*90 scale 24.0 translate <412.02, -159.51, 0.00> }
  text { ttf LabelFont, "entity list", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <319.13, -195.51, 30.00> }
  object { StateMachineDiagram_e7_881a9fa389742b575ef0aabbe66a5249 scale 0.268163357400722 translate <339.0783249250245, -124.06378034277228, -8.5129> }
    sphere_sweep { linear_spline, 2, <88.67, -131.33, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <168.00, -130.67, 4.00>, 3.0 <218.76, -13.82, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <218.76, -13.82, 4.00>, 3.0 <435.97, -53.82, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <435.97, -53.82, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 texture { TransitionTexture }}
  torus { 36.0, 3.0 translate <218.76, -13.82, -32.00>texture { TransitionTexture }}
    sphere_sweep { cubic_spline, 5, <218.76, -13.82, 4.00>, 3.0 <218.76, -13.82, 4.00>, 3.0 <159.33, -56.33, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <412.02, -159.51, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { cubic_spline, 5, <168.00, -130.67, 4.00>, 3.0 <168.00, -130.67, 4.00>, 3.0 <258.67, -185.00, 4.00>, 3.0 <412.02, -159.51, 4.00>, 3.0 <412.02, -159.51, 4.00>, 3.0 texture { TransitionTexture }}
}
#declare StateMachineDiagram_1u2y_6174cfd7c659288bc9badb700978b1e1 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <169.11, -133.81, 0.00> }
  object { State rotate -x*90 scale 24.0 translate <298.87, -133.81, 0.00> }
  text { ttf LabelFont, "受付", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <285.01, -169.81, 30.00> }
  object { SubmachineState rotate -x*90 scale 24.0 translate <538.14, -133.81, 0.00> }
  text { ttf LabelFont, "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <474.33, -169.81, 30.00> }
  object { StateMachineDiagram_bffk_e8128ac6c1d56428bfcbc5567f70b355 scale 0.24274918300653595 translate <466.85692254093476, -116.48486168555966, -8.23> }
    sphere_sweep { linear_spline, 2, <298.87, -133.81, 4.00>, 3.0 <538.14, -133.81, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <169.11, -133.81, 4.00>, 3.0 <298.87, -133.81, 4.00>, 3.0 texture { TransitionTexture }}
}
object { StateMachineDiagram_1u2y_6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <392.61, -133.67, -558.28>;
#declare FOCUS = <392.61, -133.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
