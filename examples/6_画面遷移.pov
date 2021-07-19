/**
 * astah* Diagram 3D Visualization
 * povastah 6_画面遷移
 * created at 2021/07/16
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare StateMachineDiagram_bffk_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.67, -131.33, 0.00> }
object { State rotate -x*90 scale 24.0 translate <218.76, -13.82, 0.00> }
 text { ttf LabelFont, "entity.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <185.76, -49.82, 30.00> }
object { State rotate -x*90 scale 24.0 translate <478.64, -13.82, 0.00> }
 text { ttf LabelFont, "entityEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <430.64, -49.82, 30.00> }
object { State rotate -x*90 scale 24.0 translate <392.90, -144.49, 0.00> }
 text { ttf LabelFont, "entityList.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <347.90, -180.49, 30.00> }
object { ChoicePseudostate rotate -x*90 scale 24.0 translate <167.50, -130.17, 0.00> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<88.67, -131.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }
}
// link Transition:entry
sphere_sweep { linear_spline, 2, 
<167.50, -130.17, 4.00>, 3.0
<218.76, -13.82, 4.00>, 3.0
  texture { TransitionTexture }
}
// link Transition:submit / save
sphere_sweep { linear_spline, 2, 
<218.76, -13.82, 4.00>, 3.0
<478.64, -13.82, 4.00>, 3.0
  texture { TransitionTexture }
}
// link Transition:submit
sphere_sweep { linear_spline, 2, 
<478.64, -13.82, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }
}
// link Transition:reset
torus { 36.0, 3.0 translate <218.76, -13.82, -32.00>  texture { TransitionTexture }
}
// link Transition:back
sphere_sweep { cubic_spline, 5, 
<218.76, -13.82, 4.00>, 3.0
<218.76, -13.82, 4.00>, 3.0
<159.33, -56.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }
}
// link Transition:back
sphere_sweep { linear_spline, 2, 
<392.90, -144.49, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }
}
// link Transition:list
sphere_sweep { cubic_spline, 5, 
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<258.67, -185.00, 4.00>, 3.0
<392.90, -144.49, 4.00>, 3.0
<392.90, -144.49, 4.00>, 3.0
  texture { TransitionTexture }
}
}
#declare StateMachineDiagram_1u2y_6174cfd7c659288bc9badb700978b1e1 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <169.11, -133.81, 0.00> }
object { State rotate -x*90 scale 24.0 translate <298.87, -133.81, 0.00> }
 text { ttf LabelFont, "管理者操作", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <268.87, -169.81, 30.00> }
object { SubmachineState rotate -x*90 scale 24.0 translate <538.14, -133.81, 0.00> }
 text { ttf LabelFont, "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <520.14, -169.81, 30.00> }
object { StateMachineDiagram_bffk_e8128ac6c1d56428bfcbc5567f70b355 scale 0.2730928308823529 translate <452.07450875076586, -114.59265076880364, -8.23> }
// link Transition:[entity]
sphere_sweep { linear_spline, 2, 
<298.87, -133.81, 4.00>, 3.0
<538.14, -133.81, 4.00>, 3.0
  texture { TransitionTexture }
}
// link Transition:
sphere_sweep { linear_spline, 2, 
<169.11, -133.81, 4.00>, 3.0
<298.87, -133.81, 4.00>, 3.0
  texture { TransitionTexture }
}
}
object { StateMachineDiagram_1u2y_6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <392.61, -133.67, -558.28>;
#declare FOCUS = <392.61, -133.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
