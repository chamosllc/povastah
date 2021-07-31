/**
 * astah* Diagram 3D Visualization
 * povastah クラス継承階層
 * created at 2021/07/31
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

// hierachy depth: { Repository=5, JpaRepository=2, EntityRepository=1,  PagingAndSortingRepository=4,  CrudRepository=3}
// #declare Depth = -32.0;

#declare ClassDiagram_1muq6174cfd7c659288bc9badb700978b1e1 = union {
  object { Boundary rotate -x*90 scale 24.0 translate <221.48, -257.82, -32.00> }
  text { ttf LabelFont, "EntityRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <175.48, -293.82, 30.00> }
  object { Boundary rotate -x*90 scale 24.0 translate <221.48, -174.27, -64.00> }
  text { ttf LabelFont, "JpaRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <207.48, -210.27, 30.00> }
  object { Entity rotate -x*90 scale 24.0 translate <477.62, -257.82, 0.00> }
  text { ttf LabelFont, "Entity", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <481.62, -293.82, 30.00> }
  object { Boundary rotate -x*90 scale 24.0 translate <221.48, 86.68, -160.00> }
  text { ttf LabelFont, " Repository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <215.48, 50.68, 30.00> }
  object { Boundary rotate -x*90 scale 24.0 translate <221.48, 1.35, -128.00> }
  text { ttf LabelFont, " PagingAndSortingRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <151.48, -34.65, 30.00> }
  object { Boundary rotate -x*90 scale 24.0 translate <221.48, -86.65, -96.00> }
  text { ttf LabelFont, " CrudRepository", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture } translate <199.48, -122.65, 30.00> }
    sphere_sweep { linear_spline, 2, <221.48, -257.82, -28.00>, 3.0 <477.62, -257.82, 4.00>, 3.0 texture { AssociationTexture }}
    sphere_sweep { linear_spline, 2, <221.48, 1.35, -124.00>, 3.0 <221.48, 86.68, -156.00>, 3.0 texture { GeneralizationTexture }}
    sphere_sweep { linear_spline, 2, <221.48, -86.65, -92.00>, 3.0 <221.48, 1.35, -124.00>, 3.0 texture { GeneralizationTexture }}
    sphere_sweep { linear_spline, 2, <221.48, -174.27, -60.00>, 3.0 <221.48, -86.65, -92.00>, 3.0 texture { GeneralizationTexture }}
    sphere_sweep { linear_spline, 2, <221.48, -257.82, -28.00>, 3.0 <221.48, -174.27, -60.00>, 3.0 texture { GeneralizationTexture }}
}
object { ClassDiagram_1muq6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <297.20, -90.50, -611.70>;
#declare FOCUS = <297.20, -90.50, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
