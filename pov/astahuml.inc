#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"
#include "agent.inc"
#include "stones.inc"

/*
		Textures
*/
#declare Electricity = texture
{
  pigment
  {
    gradient y
    turbulence 0.60  lambda 2.25
    color_map
    {
      [0.00 color rgbf<1.00, 1.00, 1.00, 1.00>]
      [0.30 color rgbf<1.00, 1.00, 1.00, 1.00>]
      [0.30 color rgb<0.15, 0.00, 1.00>]
      [0.50 color rgb<1.00, 1.00, 1.00>]
      [0.70 color rgb<0.15, 0.00, 1.00>]
      [0.70 color rgbf<1.00, 1.00, 1.00, 1.00>]
      [1.00 color rgbf<1.00, 1.00, 1.00, 1.00>]
    }
    scale <1.25,1.00,1.00>
  }
  finish {
    ambient 0.40
    diffuse 0.80
  }
}

// This texture is rather difficult to use since you should
// scale it to fit your object exactly.
#declare Fire = texture
{
  pigment
  {
    gradient y
    turbulence 0.20  omega 0.80
    color_map
    {
      [0.00 color rgb<1.00, 1.00, 1.00>]
      [0.08 color rgbf<0.98, 1.00, 0.02, 0.08>]
      [0.29 color rgbf<1.00, 0.74, 0.01, 0.40>]
      [0.53 color rgbf<1.00, 0.16, 0.01, 0.67>]
      [0.79 color rgbf<1.00, 1.00, 1.00, 1.00>]
      [1.00 color rgbf<1.00, 1.00, 1.00, 1.00>]
    }
    scale <3.00,7.50,3.00>
  }
  finish {
    ambient 1.00
  }
  translate <0.00,-3.25,0.00>
}

// Blue Plasma texture by Iain Young
#declare Plasma = texture
{
  pigment
  {
    marble
    turbulence 0.50
    color_map
    {
      [0.00 color rgbf<1.00, 1.00, 1.00, 1.00>]
      [0.40 color rgbf<1.00, 1.00, 1.00, 1.00>]
      [0.40 color rgbf<0.40, 0.40, 1.00, 1.00>]
      [0.50 color rgb<0.90, 0.90, 1.00>]
      [0.60 color rgbf<0.40, 0.40, 1.00, 1.00>]
      [0.60 color rgbf<1.00, 1.00, 1.00, 1.00>]
      [1.00 color rgbf<1.00, 1.00, 1.00, 1.00>]
    }
    scale <2.00,2.00,2.00>
  }
  finish {
    ambient 1.00
  }
}

/*
		Phenomenon
*/
#declare Origin = union {
	light_source { 
	        0*x
	        color red 0.3 green 0.3 blue 0.3
	}
	sphere {<0, 0, 0>, 0.5 texture {T_Glass4}}
	sphere {<0, 0, 0>, 0.7 texture {Plasma scale 0.2}}
	sphere {<0, 0, 0>, 1.0 texture {Electricity scale 0.2}}
}


#declare Fate = blob {
  threshold 0.6
  sphere {<0.52, 0, 0.3>, 0.8, 1
   texture {finish {F_Glass4} pigment {color rgbf <0.1, 0.2, 0.9, 0.8>}}}
  sphere {<0, 0, -0.6>, 0.8, 1
   texture {finish {F_Glass4} pigment {color rgbf <0.9, 0.1, 0.2, 0.8>}}}
  sphere {<-0.52, 0, 0.3>, 0.8, 1
   texture {finish {F_Glass4} pigment {color rgbf <0.2, 0.9, 0.1, 0.8>}}}
}

#declare SimpleArrow = union {
	cylinder {<-1, 0, 0>, <0, 0, 0>, 0.2}
	cone {<0, 0, 0>, 0.4, <1, 0, 0>, 0}
}

#declare LogPart=cylinder
{
  -1*z,  1*z,  0.02
  texture {T_Wood5 scale 0.01}
}

#declare FencePart1=union{
  object{LogPart translate  0.94*x}
  object{LogPart translate -0.94*x}
  object{LogPart rotate y*90 translate  0.94*z}
  object{LogPart rotate y*90 translate -0.94*z}
}

#declare FencePart2=union{
  object{LogPart scale z*0.1 rotate x*90 translate < 0.94, 0.0,  0.94>}
  object{LogPart scale z*0.1 rotate x*90 translate <-0.94, 0.0,  0.94>}
  object{LogPart scale z*0.1 rotate x*90 translate < 0.94, 0.0, -0.94>}
  object{LogPart scale z*0.1 rotate x*90 translate <-0.94, 0.0, -0.94>}
}

#declare Fence=union{
  object{FencePart1 translate 0.08*y}
  object{FencePart1 translate 0.16*y}
  object{FencePart2 translate 0.1*y}
}


#declare Wheel=union{
        torus{0.45, 0.1 texture{T_Chrome_3A}}
        cylinder{-0.08*y, 0.08*y, 0.16 texture{T_Copper_5A}}
        union{
                cylinder{-0.4*z,0.4*z,0.05}
                cylinder{-0.4*z,0.4*z,0.05 rotate y*45}
                cylinder{-0.4*z,0.4*z,0.05 rotate y*90}
                cylinder{-0.4*z,0.4*z,0.05 rotate y*135}
                texture{T_Silver_1A}               
        }
        scale 2
}   
/*
 * State Transition Diagram
 */

#declare State = cylinder {<0, -0.1, 0>, <0, 0.1, 0>, 1.0 texture{Gold_Texture}}
#declare SubmachineState = cylinder {<0, -0.1, 0>, <0, 0.1, 0>, 2.0 texture{New_Brass}}
#declare InitialPseudostate = sphere {<0, 0, 0>, 1.0 texture {T_Chrome_5B} }
#declare ChoicePseudostate = object { Wheel }
#declare FinalState  = sphere {<0, 0, 0>, 1.0 texture {T_Chrome_1A} }
                     
/*
 * Activity Diagram
 */ 
#declare InitialNode = object { InitialPseudostate }
#declare ActivityFinal = object { FinalState }
#declare Action=union{
	box{<-0.7,-0.5,-0.5>,<0.7,0.3,0.5>}
	cylinder{<-0.7,0.3,0>,<0.7,0.3,0>,0.5}
	texture{
		pigment {hexagon color Bronze color MediumForestGreen color LightSteelBlue}
		finish{F_MetalA}
		rotate z*90 scale 0.1
	}
}
#declare Activity=union{
  object{Fence}
  box{<-1,-0.25,-1>, <1, 0, 1> texture{checker texture{T_Stone8} texture{T_Stone5} scale 1/4}}
  scale 0.6
}
#declare CallBehaviorAction = object { Activity scale 2 translate y*1 } 

/*
 * Robustness Diagram
 */
 #declare Place=intersection{
	difference{
		sphere{<0,0,0>, 1}
		sphere{<0,0,0>, 0.9}
	}
	box{<-1,-1,-1>,<1,0.2,1>}
	texture{T_Chrome_4B}
}
#declare Boundary = object { Place } 

#declare Class = object { State }     

/*
		Entity Relation Attribute Diagram:
*/
#declare Entity=union{
	text { ttf "timrom.ttf", "E", .4, 0
    pigment { color rgb <1, 0, 0> }
  	 finish {Dull}
		translate <-0.33, 0.22, -0.3>
	}
	box {<-0.5, 0, -0.5>, <0.5, 0.2, 0.5> texture {Yellow_Pine} rotate y*45}
	scale 2
	translate -1*y
}

#declare Place=intersection{
	difference{
		sphere{<0,0,0>, 1}
		sphere{<0,0,0>, 0.9}
	}
	box{<-1,-1,-1>,<1,0.2,1>}
	texture{T_Chrome_4B}
}
