/**
 * astah* Diagram 3D Visualization
 * クラス継承階層
 * created at 2021/08/14
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"

#declare LRd = 3.2;
#declare LOOPRd = 36.0;
#declare TextScale = <16, 16, 2>;

// hierachy depth: {EntityRepository=1, JpaRepository=2, CrudRepository=3, PagingAndSortingRepository=4, Repository=5}
// #declare Depth = -32.0;

#declare ClassDiagram_1muq6174cfd7c659288bc9badb700978b1e1 = union {
  object { Boundary rotate -x*90 scale 24.0 translate <221.484, -257.818, -32.0> }
    object { Circle_Text( LabelFont, "EntityRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <221.484, -257.818, 30.0> }
    union{
    sphere_sweep { linear_spline, 2, <221.484, -257.818, -28.0>, LRd <477.622, -257.818, 4.0>, LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2, <221.484, -257.818, -28.0>, LRd <477.622, -257.818, 4.0>, 0.0 material { ShadowAssociationMaterial } no_image }
    }
    sphere_sweep { linear_spline, 2, <221.484, -257.818, -28.0>, LRd <221.484, -174.266, -60.0>, LRd material { GeneralizationMaterial } no_shadow }
  object { Boundary rotate -x*90 scale 24.0 translate <221.484, -174.266, -64.0> }
    object { Circle_Text( LabelFont, "JpaRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <221.484, -174.266, 30.0> }
    sphere_sweep { linear_spline, 2, <221.484, -174.266, -60.0>, LRd <221.484, -86.654, -92.0>, LRd material { GeneralizationMaterial } no_shadow }
  object { Entity rotate -x*90 scale 24.0 translate <477.622, -257.818, 0.0> }
    object { Circle_Text( LabelFont, "Entity",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <477.622, -257.818, 30.0> }
  object { Boundary rotate -x*90 scale 24.0 translate <221.484, 86.680, -160.0> }
    object { Circle_Text( LabelFont, "Repository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <221.484, 86.680, 30.0> }
  object { Boundary rotate -x*90 scale 24.0 translate <221.484, 1.346, -128.0> }
    object { Circle_Text( LabelFont, "PagingAndSortingRepository",  0.800, 0, 2, 1.800, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <221.484, 1.346, 30.0> }
    sphere_sweep { linear_spline, 2, <221.484, 1.346, -124.0>, LRd <221.484, 86.680, -156.0>, LRd material { GeneralizationMaterial } no_shadow }
  object { Boundary rotate -x*90 scale 24.0 translate <221.484, -86.654, -96.0> }
    object { Circle_Text( LabelFont, "CrudRepository",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate <221.484, -86.654, 30.0> }
    sphere_sweep { linear_spline, 2, <221.484, -86.654, -92.0>, LRd <221.484, 1.346, -124.0>, LRd material { GeneralizationMaterial } no_shadow }
}
object { ClassDiagram_1muq6174cfd7c659288bc9badb700978b1e1 }
#declare EYE = <320, -280, -560>;
#declare FOCUS = <320, -60, 0>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000, -1000, -3000>   color White }
plane { z, 32 texture { ClassDiagramTexture }}
