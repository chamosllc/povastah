/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_0_活動視点
 * created at 2021/07/09
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare PlaneTexture = texture { pigment { checker color White color GreenYellow } rotate -x*90 rotate z*45 scale 96 }
#declare LabelTecture = texture { T_Grnt15 }
#declare LinkTecture = texture { Yellow_Glass }
#declare LabelFont = "msgothic.ttc"

#declare ActivityDiagram0 = union {
object { InitialNode rotate -x*90 scale 24  translate <192.54, -70.67, 0.00> }
object { Action rotate -x*90 scale 24  translate <192.54, -147.32, 0.00> }
 text { ttf LabelFont, "物を作る", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <168.54, -183.32, 30.00> }
object { ActivityFinal rotate -x*90 scale 24  translate <192.54, -341.33, 0.00> }
object { CallBehaviorAction rotate -x*90 scale 24  translate <192.54, -236.82, 0.00> }
 text { ttf LabelFont, "物を取り扱う", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <156.54, -272.82, 30.00> }
// object { ActivityDiagram1 scale 0.15  translate <128.00, -214.00, 28.77> }
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<192.54, -70.67, 4.00>, 3.0
<192.54, -147.32, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<192.54, -147.32, 4.00>, 3.0
<192.54, -236.82, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:[DELETE]
sphere_sweep { linear_spline, 2, 
<192.54, -236.82, 4.00>, 3.0
<192.54, -341.33, 4.00>, 3.0
  texture { LinkTecture }
}
}
object { ActivityDiagram0  }
#declare EYE = <197.54, -199.50, -397.04>;
#declare FOCUS = <197.54, -199.50, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
