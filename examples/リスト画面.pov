/**
 * astah* Diagram 3D Visualization
 * povastah リスト画面
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
object { StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 }
#declare EYE = <353.50, -327.69, -413.19>;
#declare FOCUS = <353.50, -147.69, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
