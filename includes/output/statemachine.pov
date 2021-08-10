/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup ステートマシン図
 * created at 2021/08/05
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare TextScale = <16, 16, 2>;
#declare LRd = 3.2;

#declare StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f = union {
  object { State rotate -x*90 scale 24.0 translate <180.833, -68.714, 0.000> }
    object { Circle_Text( LabelFont, "State",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <180.833, -68.714, 30.000> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <107.333, -68.714, 0.000> }
  object { FinalState rotate -x*90 scale 24.0 translate <254.000, -68.714, 0.000> }
    sphere_sweep { linear_spline, 2, <180.833, -68.714, 4.000>, LRd <254.000, -68.714, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <107.333, -68.714, 4.000>, LRd <180.833, -68.714, 4.000>, LRd material { TransitionMaterial }}
}
#declare StateMachineDiagram_98248e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <80.667, -105.333, 0.000> }
    object { Circle_Text( LabelFont, "InitialPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <80.667, -105.333, 30.000> }
  object { State rotate -x*90 scale 24.0 translate <180.833, -105.380, 0.000> }
    object { Circle_Text( LabelFont, "State",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <180.833, -105.380, 30.000> }
  object { StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f scale 0.5691105769230769 translate <538.551, -207.293, -27.317> }
  object { SubmachineState scale <167.000, 59.188, 16.000> translate <655.124, -232.714, 0.000> }
    text { ttf LabelFont, "SubmachineState", 1, 0 scale TextScale texture { LabelTecture } translate <583.624, -219.120, -0.010> }
  difference { object { StateInternal scale<413.667, 180.094, 16.000> translate <297.833, -256.620, 0.000> }
    object { StateInternal scale<217.233, 171.089, 12.000> translate <205.333, -256.620, -6.000> }
    object { StateInternal scale<175.750, 171.089, 12.000> translate <412.167, -256.620, -6.000> }
  }
    text { ttf LabelFont, "StateInternal", 1, 0 scale TextScale texture { LabelTecture } translate <103.000, -182.573, -0.010> }
  object { State rotate -x*90 scale 24.0 translate <205.500, -224.714, 0.000> }
    object { Circle_Text( LabelFont, "State",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <205.500, -224.714, 30.000> }
  object { ChoicePseudostate rotate -x*90 scale 24.0 translate <279.333, -107.333, 0.000> }
    object { Circle_Text( LabelFont, "ChoicePseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <279.333, -107.333, 30.000> }
  object { FinalState rotate -x*90 scale 24.0 translate <581.333, -318.000, 0.000> }
    object { Circle_Text( LabelFont, "FinalState",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <581.333, -318.000, 30.000> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <140.667, -224.667, 0.000> }
  object { FinalState rotate -x*90 scale 24.0 translate <260.667, -276.667, 0.000> }
  object { ForkPseudostate rotate -x*90 scale 24.0 translate <382.333, -89.833, 0.000> }
    object { Circle_Text( LabelFont, "ForkPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <382.333, -89.833, 30.000> }
  object { ForkPseudostate rotate -x*90 scale 24.0 translate <479.833, -94.333, 0.000> }
    object { Circle_Text( LabelFont, "ForkPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <479.833, -94.333, 30.000> }
  object { JoinPseudostate rotate -x*90 scale 24.0 translate <578.333, -91.833, 0.000> }
    object { Circle_Text( LabelFont, "JoinPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <578.333, -91.833, 30.000> }
  object { JoinPseudostate rotate -x*90 scale 24.0 translate <655.167, -89.667, 0.000> }
    object { Circle_Text( LabelFont, "JoinPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <655.167, -89.667, 30.000> }
  object { JunctionPseudostate rotate -x*90 scale 24.0 translate <364.833, -225.500, 0.000> }
    object { Circle_Text( LabelFont, "JunctionPseudostate",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <364.833, -225.500, 30.000> }
  object { ShallowHistoryPseudostate rotate -x*90 scale 24.0 translate <166.000, -296.000, 0.000> }
    object { Circle_Text( LabelFont, "ShallowHistoryPseudostate",  0.833, 0, 2, 1.767, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <166.000, -296.000, 30.000> }
  object { DeepHistoryPseudostate rotate -x*90 scale 24.0 translate <434.000, -304.000, 0.000> }
    object { Circle_Text( LabelFont, "DeepHistoryPseudostate",  0.933, 0, 2, 1.667, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <434.000, -304.000, 30.000> }
  object { State rotate -x*90 scale 24.0 translate <434.150, -225.380, 0.000> }
    object { Circle_Text( LabelFont, "State",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <434.150, -225.380, 30.000> }
    sphere_sweep { linear_spline, 2, <140.667, -224.667, 4.000>, LRd <205.500, -224.714, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <205.500, -224.714, 4.000>, LRd <260.667, -276.667, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <205.500, -224.714, 4.000>, LRd <364.833, -225.500, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <364.833, -225.500, 4.000>, LRd <434.150, -225.380, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <166.000, -296.000, 4.000>, LRd <205.500, -224.714, 4.000>, LRd material { TransitionMaterial }}
    sphere_sweep { linear_spline, 2, <434.000, -304.000, 4.000>, LRd <434.150, -225.380, 4.000>, LRd material { TransitionMaterial }}
}
object { StateMachineDiagram_98248e854451c4ee75ae849d72474c5eb8f }
box { <0, 0, 0>, <1, 1, 1> pigment { image_map { jpeg  "./povastah-Lineup/statemachine.jpg" map_type 0 } rotate x*180 } scale <917, -402, 1> scale 0.8 translate <40, 300, 31> }
#declare EYE = <404.667, -40, -700>;
#declare FOCUS = <404.667, -40, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.000, -1000.000, -3000.000> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
