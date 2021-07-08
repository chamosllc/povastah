/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 物
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
object { InitialPseudostate rotate -x*90 scale 24  translate <117.33, -138.00, 0.00> }
object { State rotate -x*90 scale 24  translate <284.85, -137.99, 0.00> }
 text { ttf "msgothic.ttc", "一時", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <272.85, -173.99, 30.00> }
object { State rotate -x*90 scale 24  translate <444.85, -137.99, 0.00> }
 text { ttf "msgothic.ttc", "永続", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <432.85, -173.99, 30.00> }
object { FinalState rotate -x*90 scale 24  translate <586.67, -138.00, 0.00> }
// Transition:/ instanciate
sphere_sweep { linear_spline, 2, 
<117.33, -138.00, 4.00>, 3.0
<284.85, -137.99, 4.00>, 3.0
  texture { LinkTecture }
}
// Transition:CREATE
sphere_sweep { linear_spline, 2, 
<284.85, -137.99, 4.00>, 3.0
<444.85, -137.99, 4.00>, 3.0
  texture { LinkTecture }
}
// Transition:UPDATE
torus { 32.0, 3.0 translate <444.85, -137.99, -28.00>  texture { LinkTecture }
}
// Transition:DELETE
sphere_sweep { linear_spline, 2, 
<444.85, -137.99, 4.00>, 3.0
<586.67, -138.00, 4.00>, 3.0
  texture { LinkTecture }
}
}
object { StateMachineDiagram0  }
#declare EYE = <362.33, -50.98, -413.31>;
#declare FOCUS = <362.33, -50.98, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
