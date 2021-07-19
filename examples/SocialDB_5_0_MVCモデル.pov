/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SocialDB_5_0_MVCモデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_378n_d1720ea1a76588fd96aa2623c119cd20 = union {
object { Entity rotate -x*90 scale 24  translate <125.00, -368.19, 0.00> }
 text { ttf LabelFont, "EmploymentInsurance", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <77.00, -404.19, 30.00> }
object { Entity rotate -x*90 scale 24  translate <125.00, -171.65, 0.00> }
 text { ttf LabelFont, "WithholdTax", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <109.00, -207.65, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <296.58, -80.04, 0.00> }
 text { ttf LabelFont, "taxView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <286.58, -116.04, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <296.58, -266.63, 0.00> }
 text { ttf LabelFont, "employView", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <274.58, -302.63, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <296.58, -165.54, 0.00> }
 text { ttf LabelFont, "WithholdTaxRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <230.58, -201.54, 30.00> }
object { Boundary rotate -x*90 scale 24  translate <296.58, -368.58, 0.00> }
 text { ttf LabelFont, "EmploymentInsuranceRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <198.58, -404.58, 30.00> }
sphere_sweep { linear_spline, 2, 
<125.00, -368.19, 4.00>, 3.0
<296.58, -368.58, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<125.00, -171.65, 4.00>, 3.0
<296.58, -165.54, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_378n_d1720ea1a76588fd96aa2623c119cd20 }
#declare EYE = <220.50, -224.56, -477.06>;
#declare FOCUS = <220.50, -224.56, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
