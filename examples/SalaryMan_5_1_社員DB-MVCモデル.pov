/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SalaryMan_5_1_社員DB-MVCモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_fftm_3885535429bae75d78e3378cdc11db25 = union {
object { Control rotate -x*90 scale 24  translate <347.88, -360.98, 0.00> }
 text { ttf LabelFont, "MemberController", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <311.88, -396.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <655.89, -411.65, 0.00> }
 text { ttf LabelFont, "MemberRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <609.89, -447.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <171.23, -465.98, 0.00> }
 text { ttf LabelFont, "MemberInsuranceRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <89.23, -501.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <594.56, -294.98, 0.00> }
 text { ttf LabelFont, "MemberDependentsRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <508.56, -330.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <151.89, -252.65, 0.00> }
 text { ttf LabelFont, "ResidentTaxRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <85.89, -288.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <396.56, -159.65, 0.00> }
 text { ttf LabelFont, "RewardRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <350.56, -195.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <571.23, -466.31, 0.00> }
 text { ttf LabelFont, "mebmerView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <549.23, -502.31, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <547.23, -209.65, 0.00> }
 text { ttf LabelFont, "memberDependView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <501.23, -245.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <217.89, -539.98, 0.00> }
 text { ttf LabelFont, "memberInsuranceView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <159.89, -575.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <465.89, -540.31, 0.00> }
 text { ttf LabelFont, "memberListView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <427.89, -576.31, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <151.89, -326.65, 0.00> }
 text { ttf LabelFont, "residentTaxView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <109.89, -362.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <556.56, -540.31, 0.00> }
 text { ttf LabelFont, "retireView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <534.56, -576.31, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <301.89, -159.65, 0.00> }
 text { ttf LabelFont, "rewardView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <279.89, -195.65, 30.00> }
sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<655.89, -411.65, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<171.23, -465.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<594.56, -294.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<151.89, -252.65, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<396.56, -159.65, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<571.23, -466.31, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<547.23, -209.65, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<217.89, -539.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<465.89, -540.31, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<151.89, -326.65, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<556.56, -540.31, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<347.88, -360.98, 4.00>, 3.0
<301.89, -159.65, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_fftm_3885535429bae75d78e3378cdc11db25 }
#declare EYE = <377.89, -350.17, -760.06>;
#declare FOCUS = <377.89, -350.17, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
