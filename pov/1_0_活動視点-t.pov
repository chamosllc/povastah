/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 1_0_活動視点
 * created at 2021/07/01
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "oom.inc"

#declare EYE = <192.50, 206.17, -600.67>;
#declare FOCUS = <192.50, 206.17, -199.33>;
camera { location EYE direction 1*z look_at FOCUS }  

light_source { <0, 600, -1000> color White}

plane {z, 0
	texture { pigment { hexagon color Pink color White color SkyBlue } scale 64}

}
/**
object { Frame translate <10.00, 5.36, -199.33>  pigment { color rgb <1.00, 1.00, 1.00>}}
object { text { "C4_GothicDeux_RE.TTF", "act 1_0_活動視点", 1, 0 pigment { color rgb <0.3, 0.4, 0.9> }
	finish { ambient 0.2 diffuse 0.6 phong 0.3 phong_size 100 }}
 translate <10.00, 5.36, -199.33>}
 **/
 sphere { <0,0,0>, 0.5 

        texture { pigment{ color rgb<1.00, 0.55, 0.00>}
                  finish { phong 1.0 reflection 0.00}
                } // end of texture

          scale<1,1,1>  rotate<0,0,0>  translate<0,0.5,0>  
       }  // end of sphere ----------------------------------- 


 object { Attribute scale 20 translate <182.54, 60.67, -199.33> texture { pigment { color rgb <1.00, 1.00, 1.00>}}}
 text { ttf "C4_GothicDeux_RE.TTF", "開始ノード0", 1, 0 scale 10 pigment { color rgb <0.3, 0.4, 0.9> }
	finish { ambient 0.2 diffuse 0.6 phong 0.3 phong_size 100 }
 translate <182.54, 60.67, -199.33>}
 sphere  {<118.00, 132.00, -199.33>, 20 texture {  pigment { color rgb <1.00, 1.00, 0.80>}}}
 text { ttf "C4_GothicDeux_RE.TTF", "物を作る", 1, 0 pigment { color rgb <0.3, 0.4, 0.9> }
	finish { ambient 0.2 diffuse 0.6 phong 0.3 phong_size 100 }
 translate <118.00, 132.00, -199.33>}
 sphere { <182.54, 331.33, -199.33>,20 texture { pigment { color rgb <1.00, 1.00, 1.00>}}}
 text { ttf "C4_GothicDeux_RE.TTF", "アクティビティ終了0", 1, 0 pigment { color rgb <0.3, 0.4, 0.9> }
	finish { ambient 0.2 diffuse 0.6 phong 0.3 phong_size 100 }
 translate <182.54, 331.33, -199.33>}
 sphere { <128.00, 214.00, -199.33>, 20 texture { pigment { color rgb <1.00, 1.00, 0.80>}}}
 text { ttf "C4_GothicDeux_RE.TTF", "物を取り扱う", 1, 0 pigment { color rgb <0.3, 0.4, 0.9> }
	finish { ambient 0.2 diffuse 0.6 phong 0.3 phong_size 100 }
 translate <128.00, 214.00, -199.33>}
 /**
object { ControlFlow/ObjectFlow translate <192.54, 70.67, -199.33><192.54, 147.32, -199.33>}
object { ControlFlow/ObjectFlow translate <192.54, 147.32, -199.33><192.54, 236.82, -199.33>}
object { ControlFlow/ObjectFlow translate <192.54, 236.82, -199.33><192.54, 341.33, -199.33>}
**/                                                                                                 
                                                                                               