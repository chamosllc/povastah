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
  object { State rotate -x*90 scale 24.0 translate <138.17, -68.71, 0.00> }
    object { Circle_Text( LabelFont, "State", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <138.17, -68.71, 30.00> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <73.33, -68.67, 0.00> }
    object { Circle_Text( LabelFont, "開始擬似状態1", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <73.33, -68.67, 30.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <202.00, -68.67, 0.00> }
    object { Circle_Text( LabelFont, "終了状態1", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <202.00, -68.67, 30.00> }
    sphere_sweep { linear_spline, 2, <138.17, -68.71, 4.00>, 3.0 <202.00, -68.67, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <73.33, -68.67, 4.00>, 3.0 <138.17, -68.71, 4.00>, 3.0 texture { TransitionTexture }}
}
#declare StateMachineDiagram_98248e854451c4ee75ae849d72474c5eb8f = union {
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <80.67, -105.33, 0.00> }
    object { Circle_Text( LabelFont, "InitialPseudostate", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <80.67, -105.33, 30.00> }
  object { State rotate -x*90 scale 24.0 translate <180.83, -105.38, 0.00> }
    object { Circle_Text( LabelFont, "State", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <180.83, -105.38, 30.00> }
  object { StateMachineDiagram_k8c48e854451c4ee75ae849d72474c5eb8f scale 0.9881656804733728 translate <264.92, -136.19, -47.43> }
  object { SubmachineState scale<167.00, 59.19, 16.00> translate <401.12, -204.05, 0.00> }
    text { ttf LabelFont, "SubmachineState", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <329.62, -190.45, -0.01> }
  difference { object { StateInternal scale<223.33, 102.76, 16.00> translate <159.67, -225.95, 0.00> }
    object { StateInternal scale<212.17, 97.62, 12.00> translate <159.67, -225.95, -6.00> }
  }
    text { ttf LabelFont, "StateInternal", 1, 0 scale <16, 16, 2> texture { LabelTecture } translate <60.00, -190.57, -0.01> }
  object { State rotate -x*90 scale 24.0 translate <156.83, -232.71, 0.00> }
    object { Circle_Text( LabelFont, "State", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <156.83, -232.71, 30.00> }
  object { ChoicePseudostate rotate -x*90 scale 24.0 translate <279.33, -107.33, 0.00> }
    object { Circle_Text( LabelFont, "ChoicePseudostate", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <279.33, -107.33, 30.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <386.67, -106.67, 0.00> }
    object { Circle_Text( LabelFont, "FinalState", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <386.67, -106.67, 30.00> }
  object { InitialPseudostate rotate -x*90 scale 24.0 translate <92.00, -232.67, 0.00> }
    object { Circle_Text( LabelFont, "開始擬似状態1", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <92.00, -232.67, 30.00> }
  object { FinalState rotate -x*90 scale 24.0 translate <220.67, -232.67, 0.00> }
    object { Circle_Text( LabelFont, "終了状態1", 1.0, 0, 2, 1.6, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <220.67, -232.67, 30.00> }
    sphere_sweep { linear_spline, 2, <92.00, -232.67, 4.00>, 3.0 <156.83, -232.71, 4.00>, 3.0 texture { TransitionTexture }}
    sphere_sweep { linear_spline, 2, <156.83, -232.71, 4.00>, 3.0 <220.67, -232.67, 4.00>, 3.0 texture { TransitionTexture }}
}
object { StateMachineDiagram_98248e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <266.50, -362.33, -360.83>;
#declare FOCUS = <266.50, -182.33, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
