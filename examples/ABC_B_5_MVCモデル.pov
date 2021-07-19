/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan ABC_B_5_MVCモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_aaf9_d1720ea1a76588fd96aa2623c119cd20 = union {
object { Boundary rotate -x*90 scale 24  translate <299.68, -477.65, 0.00> }
 text { ttf LabelFont, "HealthInsuranceRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <217.68, -513.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <299.68, -396.56, 0.00> }
 text { ttf LabelFont, "healthView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <277.68, -432.56, 30.00> }
object { Entity rotate -x*90 scale 24  translate <453.62, -294.02, 0.00> }
 text { ttf LabelFont, "AnnuityInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <417.62, -330.02, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <299.68, -194.31, 0.00> }
 text { ttf LabelFont, "annuityView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <273.68, -230.31, 30.00> }
object { Control rotate -x*90 scale 24  translate <136.50, -338.98, 0.00> }
 text { ttf LabelFont, "SocialController", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <100.50, -374.98, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <299.68, -294.31, 0.00> }
 text { ttf LabelFont, "AnnuityInsuranceRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <213.68, -330.31, 30.00> }
object { Entity rotate -x*90 scale 24  translate <453.33, -477.65, 0.00> }
 text { ttf LabelFont, "HealthInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <421.33, -513.65, 30.00> }
sphere_sweep { linear_spline, 2, 
<136.50, -338.98, 4.00>, 3.0
<299.68, -194.31, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<136.50, -338.98, 4.00>, 3.0
<299.68, -477.65, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<136.50, -338.98, 4.00>, 3.0
<299.68, -396.56, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<299.68, -294.31, 4.00>, 3.0
<453.62, -294.02, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<136.50, -338.98, 4.00>, 3.0
<299.68, -294.31, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<453.33, -477.65, 4.00>, 3.0
<299.68, -477.65, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_aaf9_d1720ea1a76588fd96aa2623c119cd20 }
#declare EYE = <288.50, -335.83, -656.33>;
#declare FOCUS = <288.50, -335.83, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
