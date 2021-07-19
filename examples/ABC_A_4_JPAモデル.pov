/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan ABC_A_4_JPAモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_4wsi_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { Boundary rotate -x*90 scale 24  translate <180.00, -220.98, 0.00> }
 text { ttf LabelFont, "AnnuityInsuranceRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <94.00, -256.98, 30.00> }
object { Entity rotate -x*90 scale 24  translate <353.67, -220.98, 0.00> }
 text { ttf LabelFont, "AnnuityInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <317.67, -256.98, 30.00> }
sphere_sweep { linear_spline, 2, 
<180.00, -220.98, 4.00>, 3.0
<353.67, -220.98, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_4wsi_e8128ac6c1d56428bfcbc5567f70b355 }
#declare EYE = <245.17, -221.00, -498.17>;
#declare FOCUS = <245.17, -221.00, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
