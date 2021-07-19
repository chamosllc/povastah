/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SocialDB_4_0_JPAモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_2fdr_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { Entity rotate -x*90 scale 24  translate <419.00, -295.65, 0.00> }
 text { ttf LabelFont, "WithholdTax", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <403.00, -331.65, 30.00> }
object { Entity rotate -x*90 scale 24  translate <211.92, -295.65, 0.00> }
 text { ttf LabelFont, "EmploymentInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <163.92, -331.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <419.00, -186.00, 0.00> }
 text { ttf LabelFont, "WithholdTaxRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <353.00, -222.00, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <211.92, -186.00, 0.00> }
 text { ttf LabelFont, "EmploymentInsuranceRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <113.92, -222.00, 30.00> }
sphere_sweep { linear_spline, 2, 
<419.00, -295.65, 4.00>, 3.0
<419.00, -186.00, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<211.92, -295.65, 4.00>, 3.0
<211.92, -186.00, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_2fdr_e8128ac6c1d56428bfcbc5567f70b355 }
#declare EYE = <318.92, -241.02, -591.94>;
#declare FOCUS = <318.92, -241.02, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
