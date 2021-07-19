/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SalaryMan_5_0_MVCモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_s2lz_3885535429bae75d78e3378cdc11db25 = union {
object { Control rotate -x*90 scale 24  translate <321.88, -409.65, 0.00> }
 text { ttf LabelFont, "MemberController", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <285.88, -445.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <535.89, -486.98, 0.00> }
 text { ttf LabelFont, "MemberRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <489.89, -522.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <135.23, -595.31, 0.00> }
 text { ttf LabelFont, "MemberInsuranceRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <53.23, -631.31, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <535.89, -344.98, 0.00> }
 text { ttf LabelFont, "MemberDependentsRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <449.89, -380.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <135.23, -409.98, 0.00> }
 text { ttf LabelFont, "ResidentTaxRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <69.23, -445.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <535.89, -272.98, 0.00> }
 text { ttf LabelFont, "RewardRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <489.89, -308.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <535.61, -571.31, 0.00> }
 text { ttf LabelFont, "mebmerView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <513.61, -607.31, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <535.61, -417.31, 0.00> }
 text { ttf LabelFont, "memberDependView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <489.61, -453.31, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <135.23, -680.65, 0.00> }
 text { ttf LabelFont, "memberInsuranceView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <77.23, -716.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <535.61, -723.98, 0.00> }
 text { ttf LabelFont, "memberListView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <497.61, -759.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <135.23, -510.65, 0.00> }
 text { ttf LabelFont, "residentTaxView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <93.23, -546.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <535.61, -643.98, 0.00> }
 text { ttf LabelFont, "retireView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <513.61, -679.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <535.89, -190.98, 0.00> }
 text { ttf LabelFont, "rewardView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <513.89, -226.98, 30.00> }
object { Control rotate -x*90 scale 24  translate <321.99, -215.35, 0.00> }
 text { ttf LabelFont, "SalaryController", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <285.99, -251.35, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <147.23, -164.68, 0.00> }
 text { ttf LabelFont, "ledgerView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <125.23, -200.68, 30.00> }
object { Entity rotate -x*90 scale 24  translate <-33.28, -409.35, 0.00> }
 text { ttf LabelFont, "ResidentTax", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-49.28, -445.35, 30.00> }
object { Entity rotate -x*90 scale 24  translate <-33.28, -595.35, 0.00> }
 text { ttf LabelFont, "MemberInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-65.28, -631.35, 30.00> }
object { Entity rotate -x*90 scale 24  translate <693.80, -272.98, 0.00> }
 text { ttf LabelFont, "Reward", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <697.80, -308.98, 30.00> }
object { Entity rotate -x*90 scale 24  translate <693.80, -344.98, 0.00> }
 text { ttf LabelFont, "MemberDependents", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <657.80, -380.98, 30.00> }
object { Entity rotate -x*90 scale 24  translate <693.80, -486.98, 0.00> }
 text { ttf LabelFont, "Member", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <697.80, -522.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <146.94, -253.75, 0.00> }
 text { ttf LabelFont, "detailView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <124.94, -289.75, 30.00> }
sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<535.89, -486.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<135.23, -595.31, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<535.89, -344.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<135.23, -409.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<535.89, -272.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<535.61, -571.31, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<535.61, -417.31, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<135.23, -680.65, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<535.61, -723.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<135.23, -510.65, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<535.61, -643.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.88, -409.65, 4.00>, 3.0
<535.89, -190.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.99, -215.35, 4.00>, 3.0
<321.88, -409.65, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.99, -215.35, 4.00>, 3.0
<147.23, -164.68, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<-33.28, -409.35, 4.00>, 3.0
<135.23, -409.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<-33.28, -595.35, 4.00>, 3.0
<135.23, -595.31, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<693.80, -272.98, 4.00>, 3.0
<535.89, -272.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<535.89, -344.98, 4.00>, 3.0
<693.80, -344.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<693.80, -344.98, 4.00>, 3.0
<535.89, -344.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<693.80, -486.98, 4.00>, 3.0
<535.89, -486.98, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<321.99, -215.35, 4.00>, 3.0
<146.94, -253.75, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_s2lz_3885535429bae75d78e3378cdc11db25 }
#declare EYE = <310.72, -444.20, -786.92>;
#declare FOCUS = <310.72, -444.20, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
