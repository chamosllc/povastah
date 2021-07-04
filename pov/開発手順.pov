/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 開発手順
 * created at 2021/07/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

union {
object { InitialNode rotate -x*90 scale 16  translate <28.00, -97.33, 0.00> }
object { Action rotate -x*90 scale 16  translate <90.08, -80.17, 0.00> }
 text { ttf "msgothic.ttc", "課題
0.ユースケース図", 1, 0 scale 12 texture { T_Stone8 }
 translate <30.08, -104.17, -32.00> }
object { Action rotate -x*90 scale 16  translate <314.81, -80.17, 0.00> }
 text { ttf "msgothic.ttc", "概念モデル
1.概念クラス図", 1, 0 scale 12 texture { T_Stone8 }
 translate <244.81, -104.17, -32.00> }
object { Action rotate -x*90 scale 16  translate <521.33, -68.17, 0.00> }
 text { ttf "msgothic.ttc", "実現モデル
2.クラス図
3.ER図", 1, 0 scale 12 texture { T_Stone8 }
 translate <431.33, -92.17, -32.00> }
object { Action rotate -x*90 scale 16  translate <151.42, -197.17, 0.00> }
 text { ttf "msgothic.ttc", "JPAモデル
4.ロバストネス図", 1, 0 scale 12 texture { T_Stone8 }
 translate <71.42, -221.17, -32.00> }
object { Action rotate -x*90 scale 16  translate <373.33, -197.17, 0.00> }
 text { ttf "msgothic.ttc", "MVCモデル
5.ロバストネス図", 1, 0 scale 12 texture { T_Stone8 }
 translate <293.33, -221.17, -32.00> }
object { Action rotate -x*90 scale 16  translate <588.03, -197.17, 0.00> }
 text { ttf "msgothic.ttc", "実装
6.画面遷移／コード", 1, 0 scale 12 texture { T_Stone8 }
 translate <523.03, -221.17, -32.00> }
object { ActivityFinal rotate -x*90 scale 16  translate <829.47, -214.31, 0.00> }
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<28.00, -97.33, 4.00>, 3.0
<90.08, -80.17, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<90.08, -80.17, 4.00>, 3.0
<314.81, -80.17, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<314.81, -80.17, 4.00>, 3.0
<521.33, -68.17, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<521.33, -68.17, 4.00>, 3.0
<151.42, -197.17, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<151.42, -197.17, 4.00>, 3.0
<373.33, -197.17, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<373.33, -197.17, 4.00>, 3.0
<588.03, -197.17, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
// ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<588.03, -197.17, 4.00>, 3.0
<829.47, -214.31, 4.00>, 3.0
  texture { T_Yellow_Glass }
}
}
#declare EYE = <424.74, -125.72, -550.46>;
#declare FOCUS = <424.74, -125.72, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { EYE color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
