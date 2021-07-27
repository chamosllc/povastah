/**
 *  UML Objects for povastah
 *
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 **/

/** POVRay Official Include Files **/
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"
#include "agent.inc"
#include "stones.inc"

/** Private Materials for UML Objects **/
#include "child.inc"
#include "wheel.inc"

/** povastah objects for UML elements **/
#include "astahTexture.inc"

/***************************************************/

#declare LabelFont = "msgothic.ttc"
/*
		Phenomenon
*/
#declare SimpleArrow = union {
	cylinder {<-1, 0, 0>, <0, 0, 0>, 0.2}
	cone {<0, 0, 0>, 0.4, <1, 0, 0>, 0}
}

/*
 * State Transition Diagram
 */

#declare State = cylinder {-0.1*y, 0.1*y, 1.0
     texture{ pigment{ spiral1 1 color_map{[0.0 color rgb <0.85, 0.85, 0.10>][1.6 color rgb<0.9,0.9,0.95, 0.7>]}}
              finish{ Metal } scale 0.2 rotate x*90 } }
#declare SubmachineState = cylinder { -0.2*y, 0.0*y, 2.6
     texture{ pigment{ ripples color_map{[0.0 color rgb <0.85, 0.85, 0.10, 0.7>][0.6 color rgb<0.9,0.95,1, 0.4>*1.2]}}
              finish{ Metal } scale 0.15 } scale z*0.8 }
#declare InitialPseudostate = sphere {<0, 0, 0>, 0.6 texture {T_Chrome_5B} }
#declare ChoicePseudostate = object { Wheel }
#declare FinalState  = sphere {<0, 0, 0>, 0.6 texture {T_Chrome_1A} }

/*
 * Use Case Diagram
 */
#declare UseCase = object { SubmachineState }
#declare Actor = object { Child rotate y*180 translate <0, 4, 0> scale 1/6 }
                      
/*
 * Activity Diagram
 */ 
#declare InitialNode = object { InitialPseudostate }
#declare ActivityFinal = object { FinalState }
#declare Action = union{
	box{<-0.7,-0.5,-0.6>,<0.7,0.3,0.6>}
	cylinder{<-0.7,0.3,0>,<0.7,0.3,0>,0.6}
	texture{checker texture{T_Stone8} texture{T_Stone21} rotate z*90 scale 0.3 }
}

#declare ForkNode = union {
    cylinder {<0, 0, -0.3>, <0, 0, 0.2>, 1 material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Amber_08 } }}
    cylinder {<0, 0,  0.2>, <0, 0, 0.3>, 1 texture {T_Copper_4A}}
}

#declare JoinNode = union {
    cylinder {<0, 0, -0.3>, <0, 0, -0.2>, 1 texture {T_Copper_4A}}
    cylinder {<0, 0, -0.2>, <0, 0,  0.3>, 1 material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Fluorite_05 } }} 
}

#declare Activity=union{
  object{Fence}
  box{<-1,-0.25,-1>, <1, 0, 1> texture{checker texture{T_Stone8} texture{T_Stone5} scale 1/4}}
  scale 0.8
}
#declare CallBehaviorAction = object { Activity scale 2 translate y*1 } 

/*
 * Robustness Diagram
 */
 
#declare Class = sphere { 0, 1 texture { T_Orange_Glass }}
#declare AssociationClass = sphere { 0, 1 texture { T_Yellow_Glass }}

#declare Boundary=union {
    union { 
        intersection{
        	difference{
        		sphere{ 0, 1.2 }
        		sphere{ 0, 1 }
        	}
            box{<-1.21, -1.21, -1.21>,<0.1, 1.21, 1.21>}
        }
        cylinder {<-1.7, 0, 0>, <-1.2, 0, 0>, 0.15 }
        cylinder {<-1.8, 0, 0>, <-1.65, 0, 0>, 1 }
    	texture{T_Chrome_4B}
    }
    object  { Class }
}

#declare Entity=union{
	object { Class }
	cylinder {<0, -1.15, 0>, <0, -1, 0>, 1 texture {T_Chrome_4B}}
}

#declare SpiralControl = sphere{ <0,0,0>,0.05 texture{ T_Chrome_4B }}

#local Drill = 0.65; 
#local Stripes = 6;

#declare Spiral = union {
     #local NrB =  0;     // start
     #local EndB = 2000; // end
     #while (NrB< EndB) 
       #local Nr =  0;     // start
       #local End = Stripes; // end
       #while (Nr< End) 
        object{ SpiralControl scale 1+<0,0,4>*cos(radians(-90+NrB *180/EndB)) 
                translate <1,0,0>  rotate<0, 0, -90+NrB *180/EndB> rotate<0,Drill*NrB* 360/EndB,0> rotate<0,Nr*360/End,0>} 
       #local Nr = Nr + 1;    // next Nr
       #end // ---------------  end of loop      
    
     #local NrB = NrB + 1;    // next Nr
     #end // ---------------  end of loop
} 
     
#declare Control =
union{
    object { Spiral scale 1.15 }     
    object { Class }
}

#declare Interface = object { Class texture { T_Old_Glass } scale 0.8 }
#declare InstanceSpecification = object { Class texture { T_Wood23 }} 

#declare BoundaryInstance = union {
    union { 
        intersection{
        	difference{
        		sphere{ 0, 1.2 }
        		sphere{ 0, 1 }
        	}
            box{<-1.21, -1.21, -1.21>,<0.1, 1.21, 1.21>}
        }
        cylinder {<-1.7, 0, 0>, <-1.2, 0, 0>, 0.15 }
        cylinder {<-1.8, 0, 0>, <-1.65, 0, 0>, 1 }
    	texture{T_Chrome_4B}
    }
    object  { InstanceSpecification }
}

#declare EntityInstance = union{
	object { InstanceSpecification }
	cylinder {<0, -1.15, 0>, <0, -1, 0>, 1 texture {T_Chrome_4B}}
}

#declare ControlInstance =
union{
    object { Spiral scale 1.15 }     
    object { InstanceSpecification }
}

#declare ObjectNode = object { Entity }


