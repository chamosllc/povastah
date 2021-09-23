/**
 * astah* Diagram 3D Visualization
 * 3.外部設計/02クラス図/02_0.5集配業務システム
 * created at 2021/09/03
 * presented by povastah
 **/
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
                   
#declare Action = object { Round_Cylinder(<0, -0.6, 0>, <0, 0.2, 0>, 1.0, 0.15, 0) texture{ ActivityTexture scale 1/2 }}