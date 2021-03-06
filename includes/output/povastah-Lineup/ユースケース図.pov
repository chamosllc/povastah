/**
 * astah* Diagram 3D Visualization
 * ユースケース図
 * created at 2021/10/26
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"

#local LRd = 3.2;
#local LOOPRd = 36.0;
#local TextScale = <16, 16, 2>;

#declare UseCaseDiagram_77u48e854451c4ee75ae849d72474c5eb8f = union {
#local Actor0_0 = <91.333, -109.714, 0.0>;
#local UseCase0_1 = <274.000, -110.000, 0.0>;
#local UseCase0_2 = <326.667, -193.988, 0.0>;
#local UseCase0_3 = <311.000, -308.167, 0.0>;

  object { Actor rotate -x*90 scale 24.0 translate Actor0_0 }
    object { Circle_Text(LabelFont, "アクター",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Actor0_0, 30.0)  no_shadow }
  cylinder {-z, z 1 texture { UseCaseTexture } scale <1.4000000000000001, 0.6000000000000001, 0.05> texture { pigment { object { union { 
    text { ttf LabelFont, "ユースケース", 1, 0 texture { LabelTecture } translate<-0.7999999999999996, -0, 0> }
     scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
    finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-0.375, -0.5, -2>
  } scale 64 translate<274.000, -110.000, 0.000>}
  cylinder {-z, z 1 texture { UseCaseTexture } scale <3.4000000000000004, 0.8, 0.05> texture { pigment { object { union { 
    text { ttf LabelFont, "これはユースケースです", 1, 0 texture { LabelTecture } translate<-4.3, -0, 0> }
    text { ttf LabelFont, "アクターが「～をする」と描いてね", 1, 0 texture { LabelTecture } translate<-4.3, -1, 0> }
     scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
    finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-1.0, -0.5, -2>
  } scale 64 translate<326.667, -193.988, 0.000>}
  cylinder {-z, z 1 texture { UseCaseTexture } scale <2.4000000000000004, 0.6000000000000001, 0.05> texture { pigment { object { union { 
    text { ttf LabelFont, "これはユースケースです", 1, 0 texture { LabelTecture } translate<-2.55, -0, 0> }
     scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
    finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-0.6875, -0.5, -2>
  } scale 64 translate<311.000, -308.167, 0.000>}
}
object { UseCaseDiagram_77u48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <268, -445, -385>;
#declare FOCUS = <268, -205, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { UseCaseDiagramTexture }}
