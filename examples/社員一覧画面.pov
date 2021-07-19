/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan 社員一覧画面
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare StateMachineDiagram_edbb_3885535429bae75d78e3378cdc11db25 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <127.33, -56.11, 0.00> }
object { State rotate -x*90 scale 24.0 translate <211.50, -56.11, 0.00> }
 text { ttf LabelFont, "list.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <192.00, -92.11, 30.00> }
object { State rotate -x*90 scale 24.0 translate <436.83, -56.11, 0.00> }
 text { ttf LabelFont, "inspect.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <393.33, -92.11, 30.00> }
object { FinalState rotate -x*90 scale 24.0 translate <211.50, -198.11, 0.00> }
// link Transition:id
sphere_sweep { cubic_spline, 6, 
<211.50, -56.11, 4.00>, 3.0
<211.50, -56.11, 4.00>, 3.0
<262.00, -79.43, 4.00>, 3.0
<319.33, -108.00, 4.00>, 3.0
<436.83, -56.11, 4.00>, 3.0
<436.83, -56.11, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<127.33, -56.11, 4.00>, 3.0
<211.50, -56.11, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<211.50, -56.11, 4.00>, 3.0
<211.50, -198.11, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset / back
sphere_sweep { cubic_spline, 5, 
<436.83, -56.11, 4.00>, 3.0
<413.83, -38.97, 4.00>, 3.0
<302.67, -16.67, 4.00>, 3.0
<211.50, -56.11, 4.00>, 3.0
<211.50, -56.11, 4.00>, 3.0
  texture { TransitionTexture }}

}
object { StateMachineDiagram_edbb_3885535429bae75d78e3378cdc11db25 }
#declare EYE = <298.83, -105.86, -436.69>;
#declare FOCUS = <298.83, -105.86, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
