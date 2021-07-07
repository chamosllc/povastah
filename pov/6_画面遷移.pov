/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 6_画面遷移
 * created at 2021/07/07
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare PlaneTexture = texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 }
#declare LabelTecture = texture { T_Grnt15 }
#declare LinkTecture = texture { Yellow_Glass }

#declare StateMachineDiagram0 = union {
object { InitialPseudostate rotate -x*90 scale 24  translate <169.11, -133.81, 0.00> }
object { State rotate -x*90 scale 24  translate <298.87, -133.81, 0.00> }
 text { ttf "msgothic.ttc", "管理者操作", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <268.87, -169.81, 30.00> }
object { SubmachineState rotate -x*90 scale 24  translate <538.14, -133.81, 0.00> }
 text { ttf "msgothic.ttc", "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <520.14, -169.81, 30.00> }
// object { StateMachineDiagram1 scale 0.15  translate <450.33, -96.67, 28.77> }
// Transition:[entity]
sphere_sweep { linear_spline, 2, 
<298.87, -133.81, 4.00>, 3.0
<538.14, -133.81, 4.00>, 3.0
  texture { LinkTecture }
}
// Transition:
sphere_sweep { linear_spline, 2, 
<169.11, -133.81, 4.00>, 3.0
<298.87, -133.81, 4.00>, 3.0
  texture { LinkTecture }
}
}
object { StateMachineDiagram0  }
#declare EYE = <376.98, -64.21, -441.19>;
#declare FOCUS = <376.98, -64.21, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
