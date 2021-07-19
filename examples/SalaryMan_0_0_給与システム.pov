/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SalaryMan_0_0_給与システム
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare UseCaseDiagram_1bnfr_39aff7367173f652afc310de89302491 = union {
cylinder {-z, z 1 texture { T_Wood10 } scale <1.8000000000000003, 0.6000000000000001, 0.05> 
 texture { pigment { object { union { 
  text { ttf LabelFont "社員を登録する", 1, 0 translate <-1, -0, 0> }
 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
 finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-0.9333333333333333, -0.5, -2>
 } scale 64  translate <322.67, -186.48, 0.00>}
cylinder {-z, z 1 texture { T_Wood10 } scale <2.8000000000000003, 0.6000000000000001, 0.05> 
 texture { pigment { object { union { 
  text { ttf LabelFont "社員の扶養人数を変更する", 1, 0 translate <-1, -0, 0> }
 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
 finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-1.6, -0.5, -2>
 } scale 64  translate <328.97, -242.96, 0.00>}
cylinder {-z, z 1 texture { T_Wood10 } scale <3.2, 0.6000000000000001, 0.05> 
 texture { pigment { object { union { 
  text { ttf LabelFont "社員の標準報酬月額を変更する", 1, 0 translate <-1, -0, 0> }
 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
 finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-1.8666666666666667, -0.5, -2>
 } scale 64  translate <343.75, -295.54, 0.00>}
cylinder {-z, z 1 texture { T_Wood10 } scale <2.2, 0.6000000000000001, 0.05> 
 texture { pigment { object { union { 
  text { ttf LabelFont "給与台帳を表示する", 1, 0 translate <-1, -0, 0> }
 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
 finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-1.2, -0.5, -2>
 } scale 64  translate <338.08, -353.44, 0.00>}
cylinder {-z, z 1 texture { T_Wood10 } scale <2.2, 0.6000000000000001, 0.05> 
 texture { pigment { object { union { 
  text { ttf LabelFont "給与明細を表示する", 1, 0 translate <-1, -0, 0> }
 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
 finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-1.2, -0.5, -2>
 } scale 64  translate <303.41, -485.21, 0.00>}
cylinder {-z, z 1 texture { T_Wood10 } scale <1.2000000000000002, 0.6000000000000001, 0.05> 
 texture { pigment { object { union { 
  text { ttf LabelFont "SocialDB", 1, 0 translate <-1, -0, 0> }
 scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}
 finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-0.5333333333333333, -0.5, -2>
 } scale 64  translate <344.00, -420.67, 0.00>}
object { Actor rotate -x*90 scale 24  translate <105.67, -487.29, 0.00> }
 text { ttf LabelFont, "社員", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <93.67, -523.29, 30.00> }
object { Actor rotate -x*90 scale 24  translate <106.00, -291.29, 0.00> }
 text { ttf LabelFont, "管理者", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <88.00, -327.29, 30.00> }
sphere_sweep { linear_spline, 2, 
<106.00, -291.29, 4.00>, 3.0
<322.67, -186.48, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<106.00, -291.29, 4.00>, 3.0
<328.97, -242.96, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<106.00, -291.29, 4.00>, 3.0
<343.75, -295.54, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<106.00, -291.29, 4.00>, 3.0
<338.08, -353.44, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<106.00, -291.29, 4.00>, 3.0
<303.41, -485.21, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<106.00, -291.29, 4.00>, 3.0
<344.00, -420.67, 4.00>, 3.0
  texture { AssociationTexture }}

sphere_sweep { linear_spline, 2, 
<105.67, -487.29, 4.00>, 3.0
<303.41, -485.21, 4.00>, 3.0
  texture { AssociationTexture }}

}
object { UseCaseDiagram_1bnfr_39aff7367173f652afc310de89302491 }
#declare EYE = <261.00, -359.67, -652.67>;
#declare FOCUS = <261.00, -359.67, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { UseCaseDiagramTexture }}
