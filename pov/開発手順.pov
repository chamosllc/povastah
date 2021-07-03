/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 開発手順
 * created at 2021/07/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "uml.inc"

#declare EYE = <438.50, 152.17, -590.67>;
#declare FOCUS = <438.50, 152.17, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <0, 128, -512> color White }
plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }
union {
object { InitialNode rotate -x*90 scale 16  translate <28.00, 493.33, 0.00> }
object { Action rotate -x*90 scale 16  translate <90.08, 510.50, 0.00> }
 text { ttf "msgothic.ttc", "課題
0.ユースケース図", 1, 0 scale 12 texture { T_Stone8 }
 translate <30.08, 482.50, -32.00> }
object { Action rotate -x*90 scale 16  translate <314.81, 510.50, 0.00> }
 text { ttf "msgothic.ttc", "概念モデル
1.概念クラス図", 1, 0 scale 12 texture { T_Stone8 }
 translate <244.81, 482.50, -32.00> }
object { Action rotate -x*90 scale 16  translate <521.33, 522.50, 0.00> }
 text { ttf "msgothic.ttc", "実現モデル
2.クラス図
3.ER図", 1, 0 scale 12 texture { T_Stone8 }
 translate <431.33, 494.50, -32.00> }
object { Action rotate -x*90 scale 16  translate <151.42, 393.50, 0.00> }
 text { ttf "msgothic.ttc", "JPAモデル
4.ロバストネス図", 1, 0 scale 12 texture { T_Stone8 }
 translate <71.42, 365.50, -32.00> }
object { Action rotate -x*90 scale 16  translate <373.33, 393.50, 0.00> }
 text { ttf "msgothic.ttc", "MVCモデル
5.ロバストネス図", 1, 0 scale 12 texture { T_Stone8 }
 translate <293.33, 365.50, -32.00> }
object { Action rotate -x*90 scale 16  translate <588.03, 393.50, 0.00> }
 text { ttf "msgothic.ttc", "実装
6.画面遷移／コード", 1, 0 scale 12 texture { T_Stone8 }
 translate <523.03, 365.50, -32.00> }
object { ActivityFinal rotate -x*90 scale 16  translate <829.47, 376.36, 0.00> }
union {
  cylinder { <28.00, 493.33, 0.00>, <38.00, 483.33, 0.00>, 3.0 }
  cylinder { <38.00, 483.33, 0.00>, <90.08, 510.50, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <90.08, 510.50, 0.00>, <181.29, 483.36, 0.00>, 3.0 }
  cylinder { <181.29, 483.36, 0.00>, <314.81, 510.50, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <314.81, 510.50, 0.00>, <396.93, 483.36, 0.00>, 3.0 }
  cylinder { <396.93, 483.36, 0.00>, <521.33, 522.50, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <521.33, 522.50, 0.00>, <586.78, 483.54, 0.00>, 3.0 }
  cylinder { <586.78, 483.54, 0.00>, <151.42, 393.50, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <151.42, 393.50, 0.00>, <242.63, 366.36, 0.00>, 3.0 }
  cylinder { <242.63, 366.36, 0.00>, <373.33, 393.50, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <373.33, 393.50, 0.00>, <464.54, 366.36, 0.00>, 3.0 }
  cylinder { <464.54, 366.36, 0.00>, <588.03, 393.50, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
union {
  cylinder { <588.03, 393.50, 0.00>, <688.33, 366.36, 0.00>, 3.0 }
  cylinder { <688.33, 366.36, 0.00>, <829.47, 376.36, 0.00>, 3.0 }
  texture { T_Yellow_Glass }
}
}
