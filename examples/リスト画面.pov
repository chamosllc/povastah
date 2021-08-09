/**
 * astah* Diagram 3D Visualization
 * povastah リスト画面
 * created at 2021/08/09
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
    sphere_sweep { linear_spline, 2, <130.000, -89.333, 4.000>, 3.0 <232.569, -89.154, 4.000>, 3.0 material { TransitionMaterial }}
  torus { 36.0, 3.0 translate <232.569, -89.154, -32.000>material { TransitionMaterial }}
  difference {
    sphere_sweep { cubic_spline, 5, <232.569, -89.154, 4.000>, 3.0 <232.569, -89.154, 4.000>, 3.0 <300.000, -55.333, 4.000>, 3.0 <460.667, -185.846, 4.000>, 3.0 <460.667, -185.846, 4.000>, 3.0 material { TransitionMaterial }}
    object { StateInternal scale<252.000, 180.307, 16.000> translate <460.667, -185.846, 0.000> }
  }
  difference {
    sphere_sweep { linear_spline, 2, <460.667, -185.846, 4.000>, 3.0 <241.902, -222.487, 4.000>, 3.0 material { TransitionMaterial }}
    object { StateInternal scale<252.000, 180.307, 16.000> translate <460.667, -185.846, 0.000> }
  }
    sphere_sweep { linear_spline, 2, <241.902, -222.487, 4.000>, 3.0 <130.000, -250.667, 4.000>, 3.0 material { TransitionMaterial }}
  difference {
    sphere_sweep { linear_spline, 2, <460.667, -185.846, 4.000>, 3.0 <232.569, -89.154, 4.000>, 3.0 material { TransitionMaterial }}
    object { StateInternal scale<252.000, 180.307, 16.000> translate <460.667, -185.846, 0.000> }
  }
    sphere_sweep { linear_spline, 2, <360.000, -167.154, 4.000>, 3.0 <460.569, -167.154, 4.000>, 3.0 material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <360.000, -235.820, 4.000>, 3.0 <460.569, -235.820, 4.000>, 3.0 material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <460.569, -167.154, 4.000>, 3.0 <551.333, -167.154, 4.000>, 3.0 material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <460.569, -235.820, 4.000>, 3.0 <549.333, -235.820, 4.000>, 3.0 material { TransitionMaterial }}
}
object { StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 }
#declare EYE = <353.500, -387.693, -453.193>;
#declare FOCUS = <353.500, -147.693, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
