/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SalaryMan_1_0_概念モデル
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_1m6b_338bf1264de4800e684dbe1e6b16aebb = union {
object { Actor rotate -x*90 scale 24  translate <524.36, -261.04, -32.00> }
 text { ttf LabelFont, "社員", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <495.33, -297.04, 30.00> }
object { Class rotate -x*90 scale 24  translate <684.75, -473.76, -0.00> }
 text { ttf LabelFont, "給与", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <666.00, -509.76, 30.00> }
object { Entity rotate -x*90 scale 24  translate <684.97, -261.09, -0.00> }
 text { ttf LabelFont, "従業員", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <670.33, -297.09, 30.00> }
object { Entity rotate -x*90 scale 24  translate <528.47, -473.73, -32.00> }
 text { ttf LabelFont, "報酬", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <503.67, -509.73, 30.00> }
object { Entity rotate -x*90 scale 24  translate <121.33, -481.28, 0.00> }
 text { ttf LabelFont, "社員住民税特別徴収分", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <14.33, -517.28, 30.00> }
object { Entity rotate -x*90 scale 24  translate <530.54, -108.85, 0.00> }
 text { ttf LabelFont, "社員扶養人数", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <467.33, -144.85, 30.00> }
object { Class rotate -x*90 scale 24  translate <334.14, -481.52, 0.00> }
 text { ttf LabelFont, "給与明細", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <293.33, -517.52, 30.00> }
object { Entity rotate -x*90 scale 24  translate <334.08, -260.85, 0.00> }
 text { ttf LabelFont, "支給控除額", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <291.33, -296.85, 30.00> }
object { Entity rotate -x*90 scale 24  translate <334.00, -672.16, 0.00> }
 text { ttf LabelFont, "社員社会保険標準報酬月額", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <198.00, -708.16, 30.00> }
sphere_sweep { linear_spline, 2, 
<684.97, -261.09, 4.00>, 3.0
<684.75, -473.76, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<684.97, -261.09, 4.00>, 3.0
<524.36, -261.04, -28.00>, 3.0
  texture { GeneralizationTexture }}

sphere_sweep { linear_spline, 2, 
<684.75, -473.76, 4.00>, 3.0
<684.97, -261.09, 4.00>, 3.0
  texture { DependencyTexture }}

sphere_sweep { linear_spline, 2, 
<684.75, -473.76, 4.00>, 3.0
<528.47, -473.73, -28.00>, 3.0
  texture { GeneralizationTexture }}

sphere_sweep { linear_spline, 2, 
<121.33, -481.28, 4.00>, 3.0
<334.14, -481.52, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<530.54, -108.85, 4.00>, 3.0
<524.36, -261.04, -28.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<524.36, -261.04, -28.00>, 3.0
<334.14, -481.52, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<334.14, -481.52, 4.00>, 3.0
<528.47, -473.73, -28.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<524.36, -261.04, -28.00>, 3.0
<528.47, -473.73, -28.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<334.08, -260.85, 4.00>, 3.0
<524.36, -261.04, -28.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<334.14, -481.52, 4.00>, 3.0
<334.08, -260.85, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<334.14, -481.52, 4.00>, 3.0
<334.00, -672.16, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<334.00, -672.16, 4.00>, 3.0
<524.36, -261.04, -28.00>, 3.0
  texture { AssociationTexture }}

}
object { ClassDiagram_1m6b_338bf1264de4800e684dbe1e6b16aebb }
#declare EYE = <390.83, -401.67, -824.50>;
#declare FOCUS = <390.83, -401.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
