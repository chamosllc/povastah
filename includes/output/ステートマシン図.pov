/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup ステートマシン図
 * created at 2021/08/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f = union {
  object { State rotate -x*90 scale 24.0 translate <180.83, -68.71, 0.00> }
    object { Circle_Text( LabelFont, "State", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <180.83, -68.71, 30.00> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <107.33, -68.71, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <107.33, -68.71, 30.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <254.00, -68.71, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <254.00, -68.71, 30.00> }
    sphere_sweep { linear_spline, 2, <180.83, -68.71, 4.00>, 3.0 <254.00, -68.71, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <107.33, -68.71, 4.00>, 3.0 <180.83, -68.71, 4.00>, 3.0 texture { TransitionTexture }}
}
#declare StateMachineDiagram_98248e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <80.67, -105.33, 0.00> }
    object { Circle_Text( LabelFont, "InitialPseudostate", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <80.67, -105.33, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <180.83, -105.38, 0.00> }
    object { Circle_Text( LabelFont, "State", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <180.83, -105.38, 30.00> }
  object { StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f scale 0.5691105769230769 translate <538.55, -207.29, -27.32> }
  object { SubmachineState scale <167.00, 59.19, 16.00> translate <655.12, -232.71, 0.00> }
    text { ttf LabelFont, "SubmachineState", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <583.62, -219.12, -0.01> }
  difference { object { StateInternal scale<267.33, 153.43, 16.00> translate <181.67, -251.29, 0.00> }
    object { StateInternal scale<253.97, 145.76, 12.00> translate <181.67, -251.29, -6.00> }
  }
    text { ttf LabelFont, "StateInternal", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <60.00, -190.57, -0.01> }
  object { State rotate -x*90 scale 24.0 translate <156.83, -232.71, 0.00> }
    object { Circle_Text( LabelFont, "State", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <156.83, -232.71, 30.00> }
  object { ChoicePseudostate rotate -x*90 scale 24.0 translate <279.33, -107.33, 0.00> }
    object { Circle_Text( LabelFont, "ChoicePseudostate", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <279.33, -107.33, 30.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <581.33, -318.00, 0.00> }
    object { Circle_Text( LabelFont, "FinalState", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <581.33, -318.00, 30.00> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <92.00, -232.67, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <92.00, -232.67, 30.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <220.67, -232.67, 0.00> }
    object { Circle_Text( LabelFont, " ", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <220.67, -232.67, 30.00> }
  object { ForkPseudostate rotate -x*90 scale 24.0 translate <382.33, -89.83, 0.00> }
    object { Circle_Text( LabelFont, "ForkPseudostate", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <382.33, -89.83, 30.00> }
  object { ForkPseudostate rotate -x*90 scale 24.0 translate <479.83, -94.33, 0.00> }
    object { Circle_Text( LabelFont, "ForkPseudostate", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <479.83, -94.33, 30.00> }
  object { JoinPseudostate rotate -x*90 scale 24.0 translate <578.33, -91.83, 0.00> }
    object { Circle_Text( LabelFont, "JoinPseudostate", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <578.33, -91.83, 30.00> }
  object { JoinPseudostate rotate -x*90 scale 24.0 translate <655.17, -89.67, 0.00> }
    object { Circle_Text( LabelFont, "JoinPseudostate", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <655.17, -89.67, 30.00> }
  object { JunctionPseudostate rotate -x*90 scale 24.0 translate <253.50, -275.50, 0.00> }
    object { Circle_Text( LabelFont, "JunctionPseudostate", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <253.50, -275.50, 30.00> }
  object { ShallowHistoryPseudostate rotate -x*90 scale 24.0 translate <101.33, -264.00, 0.00> }
    object { Circle_Text( LabelFont, "ShallowHistoryPseudostate", 0.8333333333333334, 0, 2, 1.7666666666666668, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <101.33, -264.00, 30.00> }
  difference { object { StateInternal scale<174.67, 121.33, 16.00> translate <422.00, -265.33, 0.00> }
    object { StateInternal scale<165.93, 115.27, 12.00> translate <422.00, -265.33, -6.00> }
  }
    text { ttf LabelFont, "StateInternal", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <346.67, -220.67, -0.01> }
  object { DeepHistoryPseudostate rotate -x*90 scale 24.0 translate <395.33, -278.00, 0.00> }
    object { Circle_Text( LabelFont, "DeepHistoryPseudostate", 0.9333333333333333, 0, 2, 1.6666666666666667, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <395.33, -278.00, 30.00> }
    sphere_sweep { linear_spline, 2, <92.00, -232.67, 4.00>, 3.0 <156.83, -232.71, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <156.83, -232.71, 4.00>, 3.0 <220.67, -232.67, 4.00>, 3.0 texture { TransitionTexture }}
}
object { StateMachineDiagram_98248e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <393.50, -448.67, -554.17>;
#declare FOCUS = <393.50, -208.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
