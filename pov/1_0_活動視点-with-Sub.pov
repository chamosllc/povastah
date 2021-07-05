/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_0_活動視点
 * created at 2021/07/05
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare PlaneTexture = texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 }
#declare LabelTecture = texture { T_Grnt15 }
#declare LinkTecture = texture { Yellow_Glass }

// sub
#declare SubDiagram = union {
object { InitialNode rotate -x*90 scale 24  translate <188.54, -61.33, 0.00> }
object { Action rotate -x*90 scale 24  translate <188.54, -147.32, 0.00> }
 text { ttf "msgothic.ttc", "物を見る", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <164.54, -183.32, 30.00> }
object { Action rotate -x*90 scale 24  translate <426.54, -147.32, 0.00> }
 text { ttf "msgothic.ttc", "物を変える", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <396.54, -183.32, 30.00> }
object { Action rotate -x*90 scale 24  translate <188.54, -246.65, 0.00> }
 text { ttf "msgothic.ttc", "物を消す", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <164.54, -282.65, 30.00> }
object { ActivityFinal rotate -x*90 scale 24  translate <188.54, -324.67, 0.00> }
// ControlFlow/ObjectFlow:[READ]
sphere_sweep { linear_spline, 2, 
<188.54, -61.33, 4.00>, 3.0
<188.54, -147.32, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:[UPDATE]
sphere_sweep { linear_spline, 3, 
<188.54, -147.32, 4.00>, 3.0
<294.67, -190.00, 4.00>, 3.0
<426.54, -147.32, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<426.54, -147.32, 4.00>, 3.0
<305.33, -90.67, 4.00>, 3.0
<188.54, -147.32, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:[DELETE]
sphere_sweep { linear_spline, 2, 
<188.54, -147.32, 4.00>, 3.0
<188.54, -246.65, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<188.54, -246.65, 4.00>, 3.0
<188.54, -324.67, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:[READ]
torus { 32.0, 3.0 translate <188.54, -147.32, -28.00>  texture { LinkTecture }
}
}

#declare Diagram = union {
object { InitialNode rotate -x*90 scale 24  translate <192.54, -70.67, 0.00> }
object { Action rotate -x*90 scale 24  translate <192.54, -147.32, 0.00> }
 text { ttf "msgothic.ttc", "物を作る", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <168.54, -183.32, 30.00> }
object { ActivityFinal rotate -x*90 scale 24  translate <192.54, -341.33, 0.00> }
object { CallBehaviorAction rotate -x*90 scale 24  translate <192.54, -236.82, 0.00> }
 text { ttf "msgothic.ttc", "物を取り扱う", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <156.54, -272.82, 30.00> }

// subdiagram
// object { 1_0_活動視点_取り扱う scale 0.15  translate <128.00, -214.00, -28.70> }
object { SubDiagram scale 0.15  translate <148.00, -206.00, -28.7> }
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
object { Diagram }
#declare EYE = <197.54, -250.50, -397.04>;
#declare FOCUS = <197.54, -220.50, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
