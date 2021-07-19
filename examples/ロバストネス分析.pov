/**
 * astah* Diagram 3D Visualization
 * ロバストネス図 ロバストネス分析
 * created at 2021/07/17
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ClassDiagram_2381_1770b60079518ad3155bbc02190c9401 = union {
object { BoundaryInstance rotate -x*90 scale 24  translate <304.67, -138.38, 0.00> }
 text { ttf LabelFont, "UI:バウンダリ", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <253.67, -174.38, 30.00> }
object { ControlInstance rotate -x*90 scale 24  translate <472.67, -138.38, 0.00> }
 text { ttf LabelFont, "UI:コントロール", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <415.67, -174.38, 30.00> }
object { EntityInstance rotate -x*90 scale 24  translate <650.78, -242.88, 0.00> }
 text { ttf LabelFont, "Data:エンティティ", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <587.11, -278.88, 30.00> }
object { Actor rotate -x*90 scale 24  translate <156.33, -138.38, 0.00> }
 text { ttf LabelFont, "User:アクター", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <104.33, -174.38, 30.00> }
object { BoundaryInstance rotate -x*90 scale 24  translate <650.67, -138.38, 0.00> }
 text { ttf LabelFont, "リポジトリ:バウンダリ", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <575.67, -174.38, 30.00> }
object { EntityInstance rotate -x*90 scale 24  translate <472.73, -242.88, 0.00> }
 text { ttf LabelFont, ":エンティティ", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <421.73, -278.88, 30.00> }
sphere_sweep { linear_spline, 2, 
<156.33, -138.38, 4.00>, 3.0
<304.67, -138.38, 4.00>, 3.0
  texture { LinkTexture }}

sphere_sweep { linear_spline, 2, 
<472.67, -138.38, 4.00>, 3.0
<304.67, -138.38, 4.00>, 3.0
  texture { LinkTexture }}

sphere_sweep { linear_spline, 2, 
<650.67, -138.38, 4.00>, 3.0
<650.78, -242.88, 4.00>, 3.0
  texture { LinkTexture }}

sphere_sweep { linear_spline, 2, 
<472.67, -138.38, 4.00>, 3.0
<650.67, -138.38, 4.00>, 3.0
  texture { LinkTexture }}

sphere_sweep { linear_spline, 2, 
<472.67, -138.38, 4.00>, 3.0
<472.73, -242.88, 4.00>, 3.0
  texture { LinkTexture }}

sphere_sweep { linear_spline, 2, 
<472.67, -138.38, 4.00>, 3.0
<650.67, -138.38, 4.00>, 3.0
  texture { LinkTexture }}

}
object { ClassDiagram_2381_1770b60079518ad3155bbc02190c9401 }
#declare EYE = <414.83, -186.83, -633.67>;
#declare FOCUS = <414.83, -186.83, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
