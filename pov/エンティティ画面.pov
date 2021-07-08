/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 エンティティ画面
 * created at 2021/07/08
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
object { InitialPseudostate rotate -x*90 scale 24  translate <88.67, -131.33, 0.00> }
object { State rotate -x*90 scale 24  translate <218.76, -13.82, 0.00> }
 text { ttf "msgothic.ttc", "entity.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <185.76, -49.82, 30.00> }
object { State rotate -x*90 scale 24  translate <478.64, -13.82, 0.00> }
 text { ttf "msgothic.ttc", "entityEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <430.64, -49.82, 30.00> }
object { State rotate -x*90 scale 24  translate <392.90, -144.49, 0.00> }
 text { ttf "msgothic.ttc", "entityList.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <347.90, -180.49, 30.00> }
object { ChoicePseudostate rotate -x*90 scale 24  translate <167.50, -130.17, 0.00> }
// Transition:
sphere_sweep { linear_spline, 2, 
<88.67, -131.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { LinkTecture }
}
// Transition:entry
sphere_sweep { linear_spline, 2, 
<167.50, -130.17, 4.00>, 3.0
<218.76, -13.82, 4.00>, 3.0
  texture { LinkTecture }
}
// Transition:submit / save
sphere_sweep { linear_spline, 2, 
<218.76, -13.82, 4.00>, 3.0
<478.64, -13.82, 4.00>, 3.0
  texture { LinkTecture }
}
// Transition:reset
torus { 32.0, 3.0 translate <218.76, -13.82, -28.00>  texture { LinkTecture }
}
// Transition:back
sphere_sweep { linear_spline, 3, 
<218.76, -13.82, 4.00>, 3.0
<159.33, -56.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { LinkTecture }
}
// Transition:list
sphere_sweep { linear_spline, 3, 
<167.50, -130.17, 4.00>, 3.0
<258.67, -185.00, 4.00>, 3.0
<392.90, -144.49, 4.00>, 3.0
  texture { LinkTecture }
}
// Transition:back
sphere_sweep { linear_spline, 2, 
<392.90, -144.49, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { LinkTecture }
}
// Transition:submit
sphere_sweep { linear_spline, 2, 
<478.64, -13.82, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { LinkTecture }
}
}
object { StateMachineDiagram0  }
#declare EYE = <339.64, -62.73, -402.37>;
#declare FOCUS = <339.64, -62.73, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
