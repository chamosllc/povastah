/**
 * astah* Diagram 3D Visualization
 * 3.外部設計/02クラス図/02_0.5集配業務システム
 * created at 2021/09/03
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#declare ShadowType = 0;
#include "povastah.inc"
#include "robocart2021.inc"         


#local LRd = 3.2;
#local LOOPRd = 36.0;
#local TextScale = <16, 16, 2>;

#declare Window_Frame_Texture_1 = 
          texture{ pigment{ color rgb< 1, 1, 1>*1.1 }  
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
#declare Window_Frame_Texture_2 = 
          texture{ pigment{ color rgb< 1, 1, 1>*0.98 } 
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
#declare Window_Glass = 
          texture{ pigment{ rgbf <0.98, 0.98, 0.98, 0.9> }
                   finish { diffuse 0.1 reflection 0.2  
                            specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                 } // end of texture -------------------------------------------
#declare Wall_Texture_1 = 
          texture{ pigment{ color rgb< 1, 1, 1>*0.7 }  
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
#declare Wall_Texture_2 = 
          texture{ pigment{ color rgb< 1, 1, 1>*0.6 }  
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
#declare Floor_Texture_1 = 
          texture{ pigment{ color rgb< 1, 1, 1>*0.5 }  
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 
//-------------------------------------------------------------------------------------//
#include "BusinessBuilding_000.inc" 
//-------------------------------------------------------------------------------------//
#declare Warehouse = object{ BusinessBuilding_000( 
                    4, // Nx_Elements,  // number of elements in -x,  integer >= 1
                    4, // Ny_Floors,    // number of floors in    y,  integer >= 1
                    3, // Nz_Elements,  // number of elements in +z,  integer >= 1
                    2, // N_of_Windows_per_Element, // 

                   2.30, // Win_H, // window height - de: Fensterhohe 
                   0.80, //  Win_Tween_H, // windows tween height - 
                   2.00, // Win_W, // window width  - de: Fensterbreite 
                   0.10, // Win_Frame_D, // window frame thickness - Fensterrahmendicke
                   0.35, // Wall_D,  // wall thickness  - de: Wanddicke
                   0.50, // Floor_D, // floor thickness - de: Bodendicke
                 ) translate <8, -4, -1>
      }

#declare Wall_Texture_Outside = 
      texture { pigment{ color White*1.1}
                normal { bumps 0.5 scale 0.005} 
                finish { phong 1}
              } // end of texture
//--------------------------------------------------------
#declare Wall_Texture_Inside = 
      texture { pigment{ color White*1.1}
                finish { phong 1}
              } // end of texture
//--------------------------------------------------------
#declare Roof_Texture = 
// layered texture!!!
      texture { pigment{ color Scarlet*1.3}
                normal { gradient z scallop_wave scale<1,1,0.15>} 
                finish { phong 1}
              } // end of texture
 
      texture { pigment{ gradient x 
                         color_map{[0.00 color Clear]
                                   [0.90 color Clear]
                                   [0.95 color White*0.1]
                                   [1.00 color White*0.1]}
                          scale 0.25}
                 finish { phong 1}
              } // end of texture

//--------------------------------------------------------
#declare Window_Texture = 
         texture{ pigment{ color rgb< 0.75, 0.5, 0.30>*0.35 } // brown  
                  // pigment{ color White*1.2}
                  finish { phong 0.1}}
//--------------------------------------------------------------------------------------- 
//---------------------------------------------------------------------------------------
#include "House_2_0.inc" 
//-------------------------------------------------------------------------------------// 
#declare Company = object{ House_2_0(  2.80, // Half_House_Width_X, // >= 2.00
                    6.00, // Total_House_Width_Z,// >= 2.00
                    5.10, // House_Height_Y,     // >= 2.00
                    44,   // Roof___Angle, // ca. 10 ~ 60 degrees
                      
                    Wall_Texture_Outside
                    Wall_Texture_Inside 
                    Window_Texture                                                    
                    Roof_Texture )
                   translate -1 }
             
// hierachy depth: {配達担当者=1, 運搬車=2, 配達車=1, 収集担当者=1, 収集車=1, 運転者=2}
// #declare Depth = -32.0;

#declare ClassDiagram_1d33a6b1030ad474f166f77483c46088db1cd3ae93b99127db = union {
#local Actor0_0 = <267.833, -58.594, -32.0>;
#local Class0_1 = <267.508, -164.094, -32.0>;
#local Actor0_2 = <142.167, -58.594, 0.0>;
#local Class0_3 = <437.981, -58.594, 0.0>;
#local Actor0_4 = <431.921, -164.094, -0.0>;
#local Actor0_5 = <119.754, -164.094, -0.0>;
#local Actor0_6 = <2.833, -58.594, 0.0>;
#local Class0_7 = <119.754, -268.594, -0.0>;
#local Class0_8 = <431.921, -268.594, -0.0>;
#local RC_SCALE = 1/7;

  object { Actor rotate -x*90 scale 24.0 translate Actor0_0 }
    object { Circle_Text(LabelFont, "運転者",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Actor0_0, 62.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Actor0_0, 4.0), LRd  vert(Class0_1, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Actor0_0, 4.0), LRd  vert(Class0_1, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Ev3Cart rotate x*90 scale RC_SCALE translate Class0_1 }
    object { Circle_Text(LabelFont, "運搬車",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_1, 62.0)  no_shadow }
  object { Company rotate -x*90 scale 10 translate Actor0_2 }
    object { Circle_Text(LabelFont, "運送会社",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Actor0_2, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Actor0_2, 4.0), LRd  vert(Actor0_0, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Actor0_2, 4.0), LRd  vert(Actor0_0, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Warehouse rotate -x*90 scale 4 translate Class0_3 }
    object { Circle_Text(LabelFont, "集配所",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_3, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Class0_3, 4.0), LRd  vert(Actor0_0, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Class0_3, 4.0), LRd  vert(Actor0_0, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Actor rotate -x*90 scale 24.0 translate Actor0_4 }
    object { Circle_Text(LabelFont, "収集担当者",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Actor0_4, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Actor0_4, LRd Actor0_0, LRd material { GeneralizationMaterial } no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Actor0_4, 4.0), LRd  vert(Class0_8, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Actor0_4, 4.0), LRd  vert(Class0_8, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Actor rotate -x*90 scale 24.0 translate Actor0_5 }
    object { Circle_Text(LabelFont, "配達担当者",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Actor0_5, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Actor0_5, LRd Actor0_0, LRd material { GeneralizationMaterial } no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Actor0_5, 4.0), LRd  vert(Class0_7, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Actor0_5, 4.0), LRd  vert(Class0_7, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { Actor rotate -x*90 scale 24.0 translate Actor0_6 }
    object { Circle_Text(LabelFont, "荷送人",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Actor0_6, 30.0)  no_shadow }
// Association
    union{
    sphere_sweep { linear_spline, 2,  vert(Actor0_6, 4.0), LRd  vert(Actor0_2, 4.0), LRd material { AssociationMaterial } no_shadow }
    sphere_sweep { linear_spline, 2,  vert(Actor0_6, 4.0), LRd  vert(Actor0_2, 4.0), 0.0 material { ShadowAssociationMaterial } no_image }
    }
  object { RoboCart rotate x*90 scale RC_SCALE translate Class0_7 }
    object { Circle_Text(LabelFont, "配達車",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_7, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Class0_7, LRd Class0_1, LRd material { GeneralizationMaterial } no_shadow }
  object { RoboCart rotate x*90 scale RC_SCALE translate Class0_8 }
    object { Circle_Text(LabelFont, "収集車",  1.000, 0, 2, 1.600, 1, Align_Center, -90) scale TextScale texture { LabelTecture } translate vert(Class0_8, 30.0)  no_shadow }
// Generalization
    sphere_sweep { linear_spline, 2, Class0_8, LRd Class0_1, LRd material { GeneralizationMaterial } no_shadow }
}
object { ClassDiagram_1d33a6b1030ad474f166f77483c46088db1cd3ae93b99127db rotate -z*10}
#declare EYE = <240, -500, -200>;
#declare FOCUS = <240, -240, 0>;
camera { location EYE direction 1*z right <16/9,0,0> look_at FOCUS }
light_source { <-1000, -2000, -3000>   color White*1.5 }
plane { z, 32 texture { T_Silver_2B }}
plane { y, 96 rotate -z*10 texture { T_Silver_2D }}
