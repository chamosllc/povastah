/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan ABC_B_4_JPAモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_5k4o_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { Entity rotate -x*90 scale 24  translate <128.58, -255.90, 0.00> }
 text { ttf LabelFont, "AnnuityInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <92.58, -291.90, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <318.58, -163.57, 0.00> }
 text { ttf LabelFont, "HealthInsuranceRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <236.58, -199.57, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <128.33, -163.57, 0.00> }
 text { ttf LabelFont, "AnnuityInsuranceRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <42.33, -199.57, 30.00> }
object { Entity rotate -x*90 scale 24  translate <318.67, -255.65, 0.00> }
 text { ttf LabelFont, "HealthInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <286.67, -291.65, 30.00> }
sphere_sweep { linear_spline, 2, 
<128.33, -163.57, 4.00>, 3.0
<128.58, -255.90, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<318.67, -255.65, 4.00>, 3.0
<318.58, -163.57, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_5k4o_e8128ac6c1d56428bfcbc5567f70b355 }
#declare EYE = <205.00, -209.59, -446.59>;
#declare FOCUS = <205.00, -209.59, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
