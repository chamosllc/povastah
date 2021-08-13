/**
 * astah* Diagram 3D Visualization
 * リスト画面
 * created at 2021/08/13
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
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <130.000, -89.333, 0.0> }
    union{
    sphere_sweep { linear_spline, 2, <130.000, -89.333, 4.0>, LRd <232.569, -89.154, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <130.000, -89.333, 4.0>, LRd <232.569, -89.154, 4.0>, 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <232.569, -89.154, 0.0> }
    object { Circle_Text( LabelFont, "find",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <232.569, -89.154, 30.0> }
    torus { LOOPRd, LRd translate<232.56875813802083, -89.15364583333333, 4.0 - LOOPRd> material { TransitionMaterial } no_shadow }
  difference {    sphere_sweep { cubic_spline, 5, <232.569, -89.154, 4.0>, LRd <232.569, -89.154, 4.0>, LRd <300.000, -55.333, 4.0>, LRd <540.000, -115.846, 4.0>, LRd <540.000, -115.846, 4.0>, LRd material { TransitionMaterial } }
    object { StateInternal scale<252.000, 180.307, 16.0> translate <540.000, -115.846, 0.0> }
 no_shadow }
  difference {    sphere_sweep { cubic_spline, 5, <232.569, -89.154, 4.0>, LRd <232.569, -89.154, 4.0>, LRd <300.000, -55.333, 4.0>, LRd/2.0 <540.000, -115.846, 4.0>, 0.0 <540.000, -115.846, 4.0>, 0.0 material { ShadowTransitionMaterial } }
    object { StateInternal scale<252.000, 180.307, 16.0> translate <540.000, -115.846, 0.0> }
 no_image }
  difference {    object { StateInternal scale<252.000, 180.307, 16.0> translate <540.000, -115.846, 0.0> }
    object { StateInternal scale<239.400, 98.117, 12.0> translate <540.000, -77.333, -6.0> }
    object { StateInternal scale<239.400, 73.175, 12.0> translate <540.000, -167.487, -6.0> }
  }
    text { ttf LabelFont, "show", 1, 0 scale TextScale texture { LabelTecture } translate <426.000, -41.693, -0.0> }
  difference {    sphere_sweep { linear_spline, 2, <540.000, -115.846, 4.0>, LRd <241.667, -213.487, 4.0>, LRd material { TransitionMaterial } }
    object { StateInternal scale<252.000, 180.307, 16.0> translate <540.000, -115.846, 0.0> }
    object { StateInternal scale<203.333, 130.974, 16.0> translate <241.667, -213.487, 0.0> }
 no_shadow }
  difference {    sphere_sweep { linear_spline, 2, <540.000, -115.846, 4.0>, LRd <241.667, -213.487, 4.0>, 0.0 material { ShadowTransitionMaterial } }
    object { StateInternal scale<252.000, 180.307, 16.0> translate <540.000, -115.846, 0.0> }
    object { StateInternal scale<203.333, 130.974, 16.0> translate <241.667, -213.487, 0.0> }
 no_image }
  difference {    sphere_sweep { linear_spline, 2, <540.000, -115.846, 4.0>, LRd <232.569, -89.154, 4.0>, LRd material { TransitionMaterial } }
    object { StateInternal scale<252.000, 180.307, 16.0> translate <540.000, -115.846, 0.0> }
 no_shadow }
  difference {    sphere_sweep { linear_spline, 2, <540.000, -115.846, 4.0>, LRd <232.569, -89.154, 4.0>, 0.0 material { ShadowTransitionMaterial } }
    object { StateInternal scale<252.000, 180.307, 16.0> translate <540.000, -115.846, 0.0> }
 no_image }
  difference {    object { StateInternal scale<203.333, 130.974, 16.0> translate <241.667, -213.487, 0.0> }
    object { StateInternal scale<193.167, 124.425, 12.0> translate <241.667, -213.487, -6.0> }
  }
    text { ttf LabelFont, "select", 1, 0 scale TextScale texture { LabelTecture } translate <152.000, -164.000, -0.0> }
  difference {    sphere_sweep { linear_spline, 2, <241.667, -213.487, 4.0>, LRd <243.333, -335.333, 4.0>, LRd material { TransitionMaterial } }
    object { StateInternal scale<203.333, 130.974, 16.0> translate <241.667, -213.487, 0.0> }
 no_shadow }
  difference {    sphere_sweep { linear_spline, 2, <241.667, -213.487, 4.0>, LRd <243.333, -335.333, 4.0>, 0.0 material { ShadowTransitionMaterial } }
    object { StateInternal scale<203.333, 130.974, 16.0> translate <241.667, -213.487, 0.0> }
 no_image }
  object { FinalState rotate -x*90 scale 24.0 translate <243.333, -335.333, 0.0> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <439.333, -97.154, 0.0> }
    union{
    sphere_sweep { linear_spline, 2, <439.333, -97.154, 4.0>, LRd <539.902, -97.154, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <439.333, -97.154, 4.0>, LRd <539.902, -97.154, 4.0>, 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <539.902, -97.154, 0.0> }
    object { Circle_Text( LabelFont, "entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <539.902, -97.154, 30.0> }
    union{
    sphere_sweep { linear_spline, 2, <539.902, -97.154, 4.0>, LRd <630.667, -97.154, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <539.902, -97.154, 4.0>, LRd <630.667, -97.154, 4.0>, 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <439.333, -165.820, 0.0> }
    union{
    sphere_sweep { linear_spline, 2, <439.333, -165.820, 4.0>, LRd <539.902, -165.820, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <439.333, -165.820, 4.0>, LRd <539.902, -165.820, 4.0>, 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <539.902, -165.820, 0.0> }
    object { Circle_Text( LabelFont, "type",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <539.902, -165.820, 30.0> }
    union{
    sphere_sweep { linear_spline, 2, <539.902, -165.820, 4.0>, LRd <628.667, -165.820, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <539.902, -165.820, 4.0>, LRd <628.667, -165.820, 4.0>, 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { FinalState rotate -x*90 scale 24.0 translate <630.667, -97.154, 0.0> }
  object { FinalState rotate -x*90 scale 24.0 translate <628.667, -165.820, 0.0> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <164.667, -196.000, 0.0> }
    union{
    sphere_sweep { linear_spline, 2, <164.667, -196.000, 4.0>, LRd <233.235, -227.154, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <164.667, -196.000, 4.0>, LRd <233.235, -227.154, 4.0>, 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { State rotate -x*90 scale 24.0 translate <233.235, -227.154, 0.0> }
    object { Circle_Text( LabelFont, "do",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <233.235, -227.154, 30.0> }
    union{
    sphere_sweep { linear_spline, 2, <233.235, -227.154, 4.0>, LRd <306.667, -245.333, 4.0>, LRd material { TransitionMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <233.235, -227.154, 4.0>, LRd <306.667, -245.333, 4.0>, 0.0 material { ShadowTransitionMaterial } no_image }
    }
  object { FinalState rotate -x*90 scale 24.0 translate <306.667, -245.333, 0.0> }
}
object { StateMachineDiagram_e7881a9fa389742b575ef0aabbe66a5249 }
#declare EYE = <393, -500, -360>;
#declare FOCUS = <393, -200, 0>;
camera { location EYE direction 1.07*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { StateMachineDiagramTexture }}
