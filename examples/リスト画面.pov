/**
 * astah* Diagram 3D Visualization
 * povastah リスト画面
 * created at 2021/08/11
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare LRd = 3.2;
#declare LOOPRd = 36.0;
#declare TextScale = <16, 16, 2>;

#declare StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <130.000, -89.333, 0.0> }
  object { State rotate -x*90 scale 24.0 translate <232.569, -89.154, 0.0> }
    object { Circle_Text( LabelFont, "find",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <232.569, -89.154, 30.0> }
  difference { object { StateInternal scale<252.000, 180.307, 16.0> translate <460.667, -185.846, 0.0> }
    object { StateInternal scale<239.400, 98.117, 12.0> translate <460.667, -147.333, -6.0> }
    object { StateInternal scale<239.400, 73.175, 12.0> translate <460.667, -237.487, -6.0> }
  }
    text { ttf LabelFont, "show", 1, 0 scale TextScale texture { LabelTecture } translate <346.667, -111.693, -0.0> }
  object { State rotate -x*90 scale 24.0 translate <241.902, -222.487, 0.0> }
    object { Circle_Text( LabelFont, "select",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <241.902, -222.487, 30.0> }
  object { FinalState rotate -x*90 scale 24.0 translate <130.000, -250.667, 0.0> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <360.000, -167.154, 0.0> }
  object { State rotate -x*90 scale 24.0 translate <460.569, -167.154, 0.0> }
    object { Circle_Text( LabelFont, "entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <460.569, -167.154, 30.0> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <360.000, -235.820, 0.0> }
  object { State rotate -x*90 scale 24.0 translate <460.569, -235.820, 0.0> }
    object { Circle_Text( LabelFont, "type",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <460.569, -235.820, 30.0> }
  object { FinalState rotate -x*90 scale 24.0 translate <551.333, -167.154, 0.0> }
  object { FinalState rotate -x*90 scale 24.0 translate <549.333, -235.820, 0.0> }
    sphere_sweep { linear_spline, 2, <130.000, -89.333, 4.0>, LRd <232.569, -89.154, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <130.000, -89.333, 4.0>, LRd <232.569, -89.154, 4.0>, 0.0 material { TransitionMaterial } no_image }
    torus { LOOPRd, LRd translate<232.56875813802083, -89.15364583333333, 4.0 - LOOPRd> material { TransitionMaterial } no_shadow }
  difference {
    sphere_sweep { cubic_spline, 5, <232.569, -89.154, 4.0>, LRd <232.569, -89.154, 4.0>, LRd <300.000, -55.333, 4.0>, LRd <460.667, -185.846, 4.0>, LRd <460.667, -185.846, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { cubic_spline, 5, <232.569, -89.154, 4.0>, LRd <232.569, -89.154, 4.0>, LRd <300.000, -55.333, 4.0>, LRd/2.0 <460.667, -185.846, 4.0>, 0.0 <460.667, -185.846, 4.0>, 0.0 material { TransitionMaterial } no_image }
    object { StateInternal scale<252.000, 180.307, 16.0> translate <460.667, -185.846, 0.0> }
  }
  difference {
    sphere_sweep { linear_spline, 2, <460.667, -185.846, 4.0>, LRd <241.902, -222.487, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <460.667, -185.846, 4.0>, LRd <241.902, -222.487, 4.0>, 0.0 material { TransitionMaterial } no_image }
    object { StateInternal scale<252.000, 180.307, 16.0> translate <460.667, -185.846, 0.0> }
  }
    sphere_sweep { linear_spline, 2, <241.902, -222.487, 4.0>, LRd <130.000, -250.667, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <241.902, -222.487, 4.0>, LRd <130.000, -250.667, 4.0>, 0.0 material { TransitionMaterial } no_image }
  difference {
    sphere_sweep { linear_spline, 2, <460.667, -185.846, 4.0>, LRd <232.569, -89.154, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <460.667, -185.846, 4.0>, LRd <232.569, -89.154, 4.0>, 0.0 material { TransitionMaterial } no_image }
    object { StateInternal scale<252.000, 180.307, 16.0> translate <460.667, -185.846, 0.0> }
  }
    sphere_sweep { linear_spline, 2, <360.000, -167.154, 4.0>, LRd <460.569, -167.154, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <360.000, -167.154, 4.0>, LRd <460.569, -167.154, 4.0>, 0.0 material { TransitionMaterial } no_image }
    sphere_sweep { linear_spline, 2, <360.000, -235.820, 4.0>, LRd <460.569, -235.820, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <360.000, -235.820, 4.0>, LRd <460.569, -235.820, 4.0>, 0.0 material { TransitionMaterial } no_image }
    sphere_sweep { linear_spline, 2, <460.569, -167.154, 4.0>, LRd <551.333, -167.154, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <460.569, -167.154, 4.0>, LRd <551.333, -167.154, 4.0>, 0.0 material { TransitionMaterial } no_image }
    sphere_sweep { linear_spline, 2, <460.569, -235.820, 4.0>, LRd <549.333, -235.820, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <460.569, -235.820, 4.0>, LRd <549.333, -235.820, 4.0>, 0.0 material { TransitionMaterial } no_image }
}
object { StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 }
#declare EYE = <353, -387, -412>;
#declare FOCUS = <353, -147, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { StateMachineDiagramTexture }}
