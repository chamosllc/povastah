/**
 * astah* Diagram 3D Visualization
 * povastah クラス継承階層
 * created at 2021/08/10
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "povastah.inc"

#declare TextScale = <16, 16, 2>;
#declare LRd = 3.2;

// hierachy depth: {CrudRepository=3, JpaRepository=2, EntityRepository=1, PagingAndSortingRepository=4, Repository=5}
// #declare Depth = -32.0;

#declare ClassDiagram_1muq6174cfd7c659288bc9badb700978b1e1 = union {
  object { Boundary rotate -x*90 scale 24.0 translate <221.484, -257.818, -32.000> }
    object { Circle_Text( LabelFont, "EntityRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <221.484, -257.818, 30.000> }
  object { Boundary rotate -x*90 scale 24.0 translate <221.484, -174.266, -64.000> }
    object { Circle_Text( LabelFont, "JpaRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <221.484, -174.266, 30.000> }
  object { Entity rotate -x*90 scale 24.0 translate <477.622, -257.818, 0.000> }
    object { Circle_Text( LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <477.622, -257.818, 30.000> }
  object { Boundary rotate -x*90 scale 24.0 translate <221.484, 86.680, -160.000> }
    object { Circle_Text( LabelFont, "Repository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <221.484, 86.680, 30.000> }
  object { Boundary rotate -x*90 scale 24.0 translate <221.484, 1.346, -128.000> }
    object { Circle_Text( LabelFont, "PagingAndSortingRepository",  0.800, 0, 2, 1.800, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <221.484, 1.346, 30.000> }
  object { Boundary rotate -x*90 scale 24.0 translate <221.484, -86.654, -96.000> }
    object { Circle_Text( LabelFont, "CrudRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <221.484, -86.654, 30.000> }
    sphere_sweep { linear_spline, 2, <221.484, -257.818, -28.000>, LRd <477.622, -257.818, 4.000>, LRd material { AssociationMaterial }}
    sphere_sweep { linear_spline, 2, <221.484, 1.346, -124.000>, LRd <221.484, 86.680, -156.000>, LRd material { GeneralizationMaterial }}
    sphere_sweep { linear_spline, 2, <221.484, -86.654, -92.000>, LRd <221.484, 1.346, -124.000>, LRd material { GeneralizationMaterial }}
    sphere_sweep { linear_spline, 2, <221.484, -174.266, -60.000>, LRd <221.484, -86.654, -92.000>, LRd material { GeneralizationMaterial }}
    sphere_sweep { linear_spline, 2, <221.484, -257.818, -28.000>, LRd <221.484, -174.266, -60.000>, LRd material { GeneralizationMaterial }}
}
object { ClassDiagram_1muq6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <298.724, -240.500, -533.224>;
#declare FOCUS = <298.724, -60.500, 0.000>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32.0 texture { ClassDiagramTexture }}
