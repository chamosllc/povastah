/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SalaryMan_4_0_JPAモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_1e3a_888095691270840cf463b1c7e8c3db0c = union {
object { Boundary rotate -x*90 scale 24  translate <552.12, -163.74, 0.00> }
 text { ttf LabelFont, "AdditiveFeeRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <486.12, -199.74, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <-277.55, -163.74, 0.00> }
 text { ttf LabelFont, "MemberRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-323.55, -199.74, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <83.45, -163.74, 0.00> }
 text { ttf LabelFont, "MemberInsuranceRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <1.45, -199.74, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <256.78, -163.74, 0.00> }
 text { ttf LabelFont, "ResidentTaxRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <190.78, -199.74, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <396.12, -163.74, 0.00> }
 text { ttf LabelFont, "RewardRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <350.12, -199.74, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <-109.44, -163.74, 0.00> }
 text { ttf LabelFont, "MemberDependentsRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-195.44, -199.74, 30.00> }
object { Entity rotate -x*90 scale 24  translate <-277.44, -265.65, 0.00> }
 text { ttf LabelFont, "Member", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-273.44, -301.65, 30.00> }
object { Entity rotate -x*90 scale 24  translate <-109.44, -265.65, 0.00> }
 text { ttf LabelFont, "MemberDependents", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-145.44, -301.65, 30.00> }
object { Entity rotate -x*90 scale 24  translate <83.90, -265.65, 0.00> }
 text { ttf LabelFont, "MemberInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <51.90, -301.65, 30.00> }
object { Entity rotate -x*90 scale 24  translate <257.23, -265.65, 0.00> }
 text { ttf LabelFont, "ResidentTax", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <241.23, -301.65, 30.00> }
object { Entity rotate -x*90 scale 24  translate <401.23, -265.65, 0.00> }
 text { ttf LabelFont, "Reward", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <405.23, -301.65, 30.00> }
object { Entity rotate -x*90 scale 24  translate <551.90, -265.65, 0.00> }
 text { ttf LabelFont, "AdditiveFee", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <535.90, -301.65, 30.00> }
sphere_sweep { linear_spline, 2, 
<-277.44, -265.65, 4.00>, 3.0
<-277.55, -163.74, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<-109.44, -265.65, 4.00>, 3.0
<-109.44, -163.74, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<83.90, -265.65, 4.00>, 3.0
<83.45, -163.74, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<257.23, -265.65, 4.00>, 3.0
<256.78, -163.74, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<401.23, -265.65, 4.00>, 3.0
<396.12, -163.74, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<551.90, -265.65, 4.00>, 3.0
<552.12, -163.74, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_1e3a_888095691270840cf463b1c7e8c3db0c }
#declare EYE = <146.95, -214.76, -393.71>;
#declare FOCUS = <146.95, -214.76, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
