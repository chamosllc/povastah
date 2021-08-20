/**
 * astah* Diagram 3D Visualization
 * ユースケース図/ユースケース
 * created at 2021/08/19
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"

#declare LRd = 3.2;
#declare LOOPRd = 36.0;
#declare TextScale = <16, 16, 2>;

#declare UseCaseDiagram_3rj6174cfd7c659288bc9badb700978b1e1 = union {
  cylinder {-z, z 1 texture { UseCaseTexture } scale <1.4000000000000001, 0.6000000000000001, 0.05> texture { pigment { object { union { 
    text { ttf LabelFont, "ユースケース", 1, 0 texture { LabelTecture } translate<-0.7999999999999996, -0, 0> }
     scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
    finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-0.375, -0.5, -2>
  } scale 64  translate <348.560, -233.667, 0.00>}
  object { Actor rotate -x*90 scale 24.0 translate <89.333, -240.714, 0.00> }
    object { Circle_Text( LabelFont, "アクター",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <89.333, -240.714, 30.00> }
    union{
    sphere_sweep { linear_spline, 2, <89.333, -240.714, 4.00>, LRd <348.560, -233.667, 4.00>, LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <89.333, -240.714, 4.00>, LRd/0.25 <348.560, -233.667, 4.00>, LRd/0.5 material { ShadowAssociationMaterial } no_image }
    }
}
object { UseCaseDiagram_3rj6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <250, -478, -400>;
#declare FOCUS = <250, -238, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { UseCaseDiagramTexture }}
