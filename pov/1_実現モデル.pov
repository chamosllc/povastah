/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_実現モデル
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

#declare ClassDiagram0 = union {
object { Class rotate -x*90 scale 24  translate <140.09, -155.80, 0.00> }
 text { ttf "msgothic.ttc", "Serializable", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <104.09, -191.80, 30.00> }
object { Entity rotate -x*90 scale 24  translate <139.55, -250.11, 0.00> }
 text { ttf "msgothic.ttc", "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <121.55, -286.11, 30.00> }
// Realization:
sphere_sweep { linear_spline, 2, 
<140.09, -155.80, 4.00>, 3.0
<139.55, -250.11, 4.00>, 3.0
  texture { LinkTecture }
}
}
object { ClassDiagram0  }
#declare EYE = <165.54, -167.67, -333.21>;
#declare FOCUS = <165.54, -167.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
