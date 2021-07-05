/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 開発手順
 * created at 2021/07/06
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare PlaneTexture = texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 }
#declare LabelTecture = texture { T_Grnt15 }
#declare LinkTecture = texture { Yellow_Glass }

#declare Diagram = union {
object { InitialNode rotate -x*90 scale 24  translate <38.00, -107.33, 0.00> }
object { Action rotate -x*90 scale 24  translate <181.29, -107.31, 0.00> }
 text { ttf "msgothic.ttc", "課題", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <169.29, -143.31, 30.00> }
 text { ttf "msgothic.ttc", "0.ユースケース図", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <169.29, -159.31, 30.00> }
object { Action rotate -x*90 scale 24  translate <396.93, -107.31, 0.00> }
 text { ttf "msgothic.ttc", "概念モデル", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <366.93, -143.31, 30.00> }
 text { ttf "msgothic.ttc", "1.概念クラス図", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <366.93, -159.31, 30.00> }
object { Action rotate -x*90 scale 24  translate <586.78, -107.13, 0.00> }
 text { ttf "msgothic.ttc", "実現モデル", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <556.78, -143.13, 30.00> }
 text { ttf "msgothic.ttc", "2.クラス図", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <556.78, -159.13, 30.00> }
 text { ttf "msgothic.ttc", "3.ER図", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <556.78, -175.13, 30.00> }
object { Action rotate -x*90 scale 24  translate <242.63, -224.31, 0.00> }
 text { ttf "msgothic.ttc", "JPAモデル", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <215.63, -260.31, 30.00> }
 text { ttf "msgothic.ttc", "4.ロバストネス図", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <215.63, -276.31, 30.00> }
object { Action rotate -x*90 scale 24  translate <464.54, -224.31, 0.00> }
 text { ttf "msgothic.ttc", "MVCモデル", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <437.54, -260.31, 30.00> }
 text { ttf "msgothic.ttc", "5.ロバストネス図", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <437.54, -276.31, 30.00> }
object { Action rotate -x*90 scale 24  translate <688.33, -224.31, 0.00> }
 text { ttf "msgothic.ttc", "実装", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <676.33, -260.31, 30.00> }
 text { ttf "msgothic.ttc", "6.画面遷移／コード", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <676.33, -276.31, 30.00> }
object { ActivityFinal rotate -x*90 scale 24  translate <839.47, -224.31, 0.00> }
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<38.00, -107.33, 4.00>, 3.0
<181.29, -107.31, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<181.29, -107.31, 4.00>, 3.0
<396.93, -107.31, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<396.93, -107.31, 4.00>, 3.0
<586.78, -107.13, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<586.78, -107.13, 4.00>, 3.0
<242.63, -224.31, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<242.63, -224.31, 4.00>, 3.0
<464.54, -224.31, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<464.54, -224.31, 4.00>, 3.0
<688.33, -224.31, 4.00>, 3.0
  texture { LinkTecture }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<688.33, -224.31, 4.00>, 3.0
<839.47, -224.31, 4.00>, 3.0
  texture { LinkTecture }
}
}
object { Diagram }
#declare EYE = <488.74, -124.59, -613.32>;
#declare FOCUS = <488.74, -124.59, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
