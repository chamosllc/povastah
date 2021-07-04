/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 エンティティ画面
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { InitialPseudostate rotate -x*90 scale 16  translate <78.67, -121.33, 0.00> }
object { State rotate -x*90 scale 16  translate <167.33, 8.00, 0.00> }
 text { ttf "msgothic.ttc", "entity.html", 1, 0 scale 12 texture { T_Stone8 }
 translate <112.33, -16.00, -32.00> }
object { State rotate -x*90 scale 16  translate <406.00, 8.00, 0.00> }
 text { ttf "msgothic.ttc", "entityEntry.html", 1, 0 scale 12 texture { T_Stone8 }
 translate <326.00, -16.00, -32.00> }
object { State rotate -x*90 scale 16  translate <327.33, -122.67, 0.00> }
 text { ttf "msgothic.ttc", "entityList.html", 1, 0 scale 12 texture { T_Stone8 }
 translate <252.33, -146.67, -32.00> }
object { ChoicePseudostate rotate -x*90 scale 16  translate <160.00, -122.67, 0.00> }
// Transition:
sphere_sweep { linear_spline, 2, 
<78.67, -121.33, 4.00>, 3.0
<160.00, -122.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Transition:entry
sphere_sweep { linear_spline, 2, 
<160.00, -122.67, 4.00>, 3.0
<167.33, 8.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Transition:submit / save
sphere_sweep { linear_spline, 2, 
<167.33, 8.00, 4.00>, 3.0
<406.00, 8.00, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Transition:reset
torus { 36, 3.0 rotate x*90  translate <167.33, 44.00, 4.00>  texture { T_Yellow_Glass }
}
// Transition:back
sphere_sweep { linear_spline, 3, 
<167.33, 8.00, 4.00>, 3.0
<159.33, -56.33, 4.00>, 3.0
<160.00, -122.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Transition:list
sphere_sweep { linear_spline, 3, 
<160.00, -122.67, 4.00>, 3.0
<258.67, -185.00, 4.00>, 3.0
<327.33, -122.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Transition:back
sphere_sweep { linear_spline, 2, 
<327.33, -122.67, 4.00>, 3.0
<160.00, -122.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// Transition:submit
sphere_sweep { linear_spline, 2, 
<406.00, 8.00, 4.00>, 3.0
<160.00, -122.67, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
}
#declare EYE = <275.64, -79.15, -354.79>;
#declare FOCUS = <275.64, -79.15, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
