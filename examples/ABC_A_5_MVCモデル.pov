/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan ABC_A_5_MVCモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_9hsc_d1720ea1a76588fd96aa2623c119cd20 = union {
object { Entity rotate -x*90 scale 24  translate <362.87, -307.17, 0.00> }
 text { ttf LabelFont, "AnnuityInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <326.87, -343.17, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <202.69, -208.31, 0.00> }
 text { ttf LabelFont, "annuityView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <176.69, -244.31, 30.00> }
object { Control rotate -x*90 scale 24  translate <58.36, -270.98, 0.00> }
 text { ttf LabelFont, "SocialController", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <22.36, -306.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <203.00, -307.17, 0.00> }
 text { ttf LabelFont, "AnnuityInsuranceRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <117.00, -343.17, 30.00> }
sphere_sweep { linear_spline, 2, 
<58.36, -270.98, 4.00>, 3.0
<202.69, -208.31, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<203.00, -307.17, 4.00>, 3.0
<362.87, -307.17, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<58.36, -270.98, 4.00>, 3.0
<203.00, -307.17, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_9hsc_d1720ea1a76588fd96aa2623c119cd20 }
#declare EYE = <204.36, -257.83, -494.19>;
#declare FOCUS = <204.36, -257.83, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
