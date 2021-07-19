/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 0_ユースケース_0
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

#declare UseCaseDiagram0 = union {
	cylinder { -z, z 1 texture {T_Wood10} scale <3.4, 0.8, 0.05>
		texture { pigment { object { union {
			 text { ttf "msgothic.ttc", "サーブレットを介して物を作成し", 1, 0 translate <-1.0,  0.0, 0> }
			 text { ttf "msgothic.ttc", "データベースに格納して取り扱う", 1, 0 translate <-1.0, -1.0, 0> }
			 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> }
				 color <1,1,1,1> color <0,0,0,1> } }
	        	finish { phong 1 ambient 0.2 }
	        	scale <.7, .5, 10> translate <-2.0, -0.5, -2>
	    } 
	    scale 64 translate <471.62, -44.69, 0.00>
	}

	cylinder { -z, z 1 texture {T_Wood10} scale <2.6, 0.6, 0.05>
		texture { pigment { object { union {
			 text { ttf "msgothic.ttc", "エンティティをCRUD操作する", 1, 0 translate <-1.0,  0.0, 0> }
			 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> }
				 color <1,1,1,1> color <0,0,0,1> } }
	        	finish { phong 1 ambient 0.2 }
	        	scale <.7, .5, 10> translate <-1.46, -0.5, -2>
	    } 
	    scale 64 translate <546.67, -269.65, 0.00>
	}

object { Boundary rotate -x*90 scale 24  translate <546.67, -390.47, 0.00> }
 text { ttf "msgothic.ttc", "C", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <510.67, -426.47, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <257.33, -278.47, 0.00> }
 text { ttf "msgothic.ttc", "サーブレット", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <221.33, -314.47, 30.00> }
object { Actor rotate -x*90 scale 24  translate <106.67, -278.64, 0.00> }
 text { ttf "msgothic.ttc", "webアプリユーザ", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <61.67, -314.64, 30.00> }
// Association:
sphere_sweep { linear_spline, 2, 
<546.67, -269.65, 4.00>, 3.0
<546.67, -390.47, 4.00>, 3.0
  texture { LinkTecture }
}
// Association:
sphere_sweep { linear_spline, 2, 
<106.67, -278.64, 4.00>, 3.0
<257.33, -278.47, 4.00>, 3.0
  texture { LinkTecture }
}
// Association:
sphere_sweep { linear_spline, 2, 
<257.33, -278.47, 4.00>, 3.0
<546.67, -269.65, 4.00>, 3.0
  texture { LinkTecture }
}
}
object { UseCaseDiagram0  }
#declare EYE = <431.00, -500.03, -400.03>;
#declare FOCUS = <431.00, -263.03, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
