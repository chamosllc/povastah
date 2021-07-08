/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_1_活動視点オブジェクト操作
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
object { InitialNode rotate -x*90 scale 24  translate <194.67, 16.67, 0.00> }
object { Action rotate -x*90 scale 24  translate <194.54, -61.99, 0.00> }
 text { ttf LabelFont, "物を作る", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <170.54, -97.99, 30.00> }
object { Action rotate -x*90 scale 24  translate <386.12, -92.65, 0.00> }
 text { ttf LabelFont, "物を見る", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <362.12, -128.65, 30.00> }
object { Action rotate -x*90 scale 24  translate <539.87, -92.65, 0.00> }
 text { ttf LabelFont, "物を変える", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <509.87, -128.65, 30.00> }
object { Action rotate -x*90 scale 24  translate <695.45, -92.65, 0.00> }
 text { ttf LabelFont, "物を消す", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <671.45, -128.65, 30.00> }
object { ActivityFinal rotate -x*90 scale 24  translate <695.33, -194.67, 0.00> }
object { ObjectNode rotate -x*90 scale 24  translate <459.67, -214.32, 0.00> }
 text { ttf LabelFont, " : 物", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <444.67, -250.32, 30.00> }
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<194.67, 16.67, 4.00>, 3.0
<194.54, -61.99, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<194.54, -61.99, 4.00>, 3.0
<289.33, -105.33, 4.00>, 3.0
<386.12, -92.65, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<194.54, -61.99, 4.00>, 3.0
<459.33, -45.33, 4.00>, 3.0
<539.87, -92.65, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<539.87, -92.65, 4.00>, 3.0
<493.33, -17.33, 4.00>, 3.0
<194.54, -61.99, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<386.12, -92.65, 4.00>, 3.0
<290.67, -77.33, 4.00>, 3.0
<194.54, -61.99, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 3, 
<194.54, -61.99, 4.00>, 3.0
<470.67, 18.00, 4.00>, 3.0
<695.45, -92.65, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<695.45, -92.65, 4.00>, 3.0
<695.33, -194.67, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:/ CREATE
sphere_sweep { linear_spline, 3, 
<194.54, -61.99, 4.00>, 3.0
<300.67, -159.33, 4.00>, 3.0
<459.67, -214.32, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:/ READ
sphere_sweep { linear_spline, 2, 
<386.12, -92.65, 4.00>, 3.0
<459.67, -214.32, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:/ UPDATE
sphere_sweep { linear_spline, 4, 
<539.87, -92.65, 4.00>, 3.0
<536.67, -135.33, 4.00>, 3.0
<515.33, -174.00, 4.00>, 3.0
<459.67, -214.32, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:/ DELETE
sphere_sweep { linear_spline, 3, 
<695.45, -92.65, 4.00>, 3.0
<640.67, -150.00, 4.00>, 3.0
<459.67, -214.32, 4.00>, 3.0
  texture { LinkTecture }
}
}
object { ActivityDiagram0  }
#declare EYE = <444.45, -115.65, -560.10>;
#declare FOCUS = <444.45, -115.65, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
