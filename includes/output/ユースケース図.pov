/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup ユースケース図
 * created at 2021/08/06
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare UseCaseDiagram_77u48e854451c4ee75ae849d72474c5eb8f = union {
  object { Actor rotate -x*90 scale 24.0 translate <91.333, -109.714, 0.000> }
    object { Circle_Text( LabelFont, "アクター",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture } translate <91.333, -109.714, 30.000> }
  cylinder {-z, z 1 texture { T_Wood10 } scale <1.4000000000000001, 0.6000000000000001, 0.05> texture { pigment { object { union { 
    text { ttf LabelFont, "ユースケース", 1, 0 texture { LabelTecture } translate<-0.7999999999999996, -0, 0> }
     scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
    finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-0.375, -0.5, -2>
  } scale 64  translate <274.000, -110.000, 0.000>}
  cylinder {-z, z 1 texture { T_Wood10 } scale <3.4000000000000004, 0.8, 0.05> texture { pigment { object { union { 
    text { ttf LabelFont, "これはユースケースです", 1, 0 texture { LabelTecture } translate<-4.3, -0, 0> }
    text { ttf LabelFont, "アクターが「～をする」と描いてね", 1, 0 texture { LabelTecture } translate<-4.3, -1, 0> }
     scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
    finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-1.0, -0.5, -2>
  } scale 64  translate <326.667, -193.988, 0.000>}
  cylinder {-z, z 1 texture { T_Wood10 } scale <2.4000000000000004, 0.6000000000000001, 0.05> texture { pigment { object { union { 
    text { ttf LabelFont, "これはユースケースです", 1, 0 texture { LabelTecture } translate<-2.55, -0, 0> }
     scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
    finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-0.6875, -0.5, -2>
  } scale 64  translate <311.000, -308.167, 0.000>}
}
object { UseCaseDiagram_77u48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <268.833, -445.167, -426.000>;
#declare FOCUS = <268.833, -205.167, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.000, -1000.000, -3000.000> color White }
plane { z, 32.0 texture { UseCaseDiagramTexture }}
