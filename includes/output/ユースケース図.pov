/**
 * astah* Diagram 3D Visualization
 * povastah-Lineup ユースケース図
 * created at 2021/08/04
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare UseCaseDiagram_77u48e854451c4ee75ae849d72474c5eb8f = union {
  object { Actor rotate -x*90 scale 24.0 translate <91.33, -109.71, 0.00> }
   text { ttf LabelFont, "アクター", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <72.13, -145.71, 30.00> }
  cylinder {-z, z 1 texture { T_Wood10 } scale <1.6, 0.6000000000000001, 0.05> texture { pigment { object { union { 
    text { ttf LabelFont "ユースケース", 1, 0 translate <-1, -0, 0> }
     scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
    finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-0.375, -0.5, -2>
  } scale 64  translate <274.00, -110.00, 0.00>}
}
object { UseCaseDiagram_77u48e854451c4ee75ae849d72474c5eb8f }
#declare EYE = <204.83, -349.67, -266.50>;
#declare FOCUS = <204.83, -109.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { UseCaseDiagramTexture }}
