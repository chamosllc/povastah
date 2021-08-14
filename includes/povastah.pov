/**
 *  UML Objects Line-up for povastah
 *
 * @author mashiro@chamos.biz
 * @since 2021/08/03
 **/

#include "povastah.inc"

/***************************************************/

#declare LabelFont = "msgothic.ttc"
/*
 * Diagram
 */
#declare Class = sphere { 0, 1 texture { T_Orange_Glass }}

#declare ObjectNode = object { Class texture { T_Wood23 }}

/*
 * State Transition Diagram
 */

#declare State = object { Round_Cylinder (-0.2*y, 0.2*y, 1.0, 0.1, 0)
     texture{ pigment{ spiral1 1 color_map{[0.0 color rgb <0.85, 0.85, 0.10>][0.7 color rgb<1,1,1, 0.98>]}}
              finish{ Metal } scale 0.2 rotate x*90 } }   
/*
#declare State = cylinder {-0.1*y, 0.1*y, 1.0
     texture{ pigment{ spiral1 1 color_map{[0.0 color rgb <0.85, 0.85, 0.10>][1.6 color rgb<0.9,0.9,0.95, 0.7>]}}
              finish{ Metal } scale 0.2 rotate x*90 } }   
*/
/*
#declare StateInternal = difference {
    object { Round_Box_Union(<-0.5, -0.5, -0.5>, <0.5, 0.5, 0.5>, 0.002)}
    object { Round_Box_Union(<-0.45, -0.45, -0.45>, <0.45, 0.45, 0.45>, 0.002)}
    box { <-0.6, -0.6, -1>, <0.6, 0.6, 0> }
  material { InternalTransitionTexture }}    
*/    
#declare StateInternal = difference {
    box { <-0.5, -0.5, -0.5>, <0.5, 0.5, 1>}
//    box { <-0.48, -0.47, -0.45>, <0.48, 0.47, 0.95> }
    box { <-0.51, -0.51, -1>, <0.51, 0.51, 0> }
//  texture { Yellow_Pine }}    
 material { InternalTransitionTexture }}  
/*
#declare SubmachineState = cylinder { -0.2*y, 0.0*y, 2.6
     texture{ pigment{ ripples color_map{[0.0 color rgb <0.85, 0.85, 0.10, 0.7>][0.6 color rgb<0.9,0.95,1, 0.4>*1.2]}}
              finish{ Metal } scale 0.15 } scale z*0.8 } 
*/
#declare SubmachineState = superellipsoid { <0.2, 0.2>
 texture{ pigment{ ripples color_map{[0.0 color rgb <0.75, 1.0, 0.8, 0.3>][0.95 color rgb<1, 1, 1, 0.9>]}}
  finish{ ambient 0.3 } scale 0.05 } scale <0.5, 0.6, 0.36> translate z*0.36 }
/*
#declare SubmachineState = object { Round_Box_Union(<-0.6, -0.6, 0.8>, <0.6, 0.6, 0.0>, 0.05) 
     texture{ pigment{ ripples color_map{[0.0 color rgb <0.85, 0.85, 0.10, 0.7>][0.6 color rgb<0.9,0.95,1, 0.4>*1.2]}}
              finish{ Metal } scale 0.05 } scale z*0.8 }
*/
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

#declare Action = object { Round_Cone(<0, -0.6, 0>, 1.2, <0, 0.8, 0>, 0.6, 0.15, 0)
  texture{ checker texture{T_Stone8} texture{ pigment { color rgbf<141/255, 45/255, 45/255, 0.7> }}
  scale 1/3}  
} 
/*  
#declare Action = object { Round_Cone(<0, -0.6, 0>, 1.4, <0, 0.8, 0>, 0.8, 0.15, 0)
  texture{ pigment{ radial frequency 10 color_map{[0.0 color rgbf<0.8,1,0.8, 0.8>][0.6 color rgbf<141/255, 45/255, 45/255, 0.3>]} }
   normal { radial sine_wave frequency 10} finish{ ambient 0.3 }}  
} 
#declare Action = union{
	box{<-0.7,-0.5,-0.6>,<0.7,0.3,0.6>}
	cylinder{<-0.7,0.3,0>,<0.7,0.3,0>,0.6}
	texture{checker texture{T_Stone8} texture{T_Stone21} rotate z*90 scale 0.3 }
}
*/
#declare ForkNode = union {
    cylinder {<0, 0, -0.3>, <0, 0, 0.2>, 1 material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Amber_08 } }}
    cylinder {<0, 0,  0.2>, <0, 0, 0.3>, 1 texture {T_Copper_4A}}
}

#declare JoinNode = union {
    cylinder {<0, 0, -0.3>, <0, 0, -0.2>, 1 texture {T_Copper_4A}}
    cylinder {<0, 0, -0.2>, <0, 0,  0.3>, 1 material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Fluorite_05 } }} 
}

#declare Activity=union{
  object{ Fence }
  box{<-1,-0.25,-1>, <1, 0, 1> texture{checker texture{T_Stone8} texture{T_Stone5} scale 1/4}}
  scale 0.8
}

#declare CallBehaviorAction = object { Activity scale 2 translate y*1 }
#declare SendSignalAction = object { Action }
#declare DecisionNodeMergeNode  = object { Wheel }
#declare AcceptEventAction = object { Action }   

/*
 * Robustness Diagram
 */
 
#declare RobustnessTexture = texture { T_Chrome_4B }

#declare AssociationClass = sphere { 0, 1 texture { T_Yellow_Glass }}

#declare Boundary=union {
    union { 
        intersection{
        	difference{	sphere{ 0, 1.2 } sphere{ 0, 1 }}
            box{<-1.21, -1.21, -1.21>,<0.1, 1.21, 1.21>}
        }
        cylinder {<-1.7, 0, 0>, <-1.2, 0, 0>, 0.15 }
        cylinder {<-1.8, 0, 0>, <-1.65, 0, 0>, 1 }
    	texture{ RobustnessTexture }
    }
    object  { Class }
}

#declare Entity = union{
	object { Class }
	cylinder {<0, -1.15, 0>, <0, -1, 0>, 1 texture { RobustnessTexture }}
}
     
#declare Control = union{
    object { Spiral scale 1.15 }     
    object { Class }
}

#declare Interface = object { Class texture { T_Old_Glass } scale 0.8 }
#declare InstanceSpecification = object { ObjectNode } 

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
    	texture{ RobustnessTexture }
    }
    object  { InstanceSpecification }
}

#declare EntityInstance = union{
	object { InstanceSpecification }
	cylinder {<0, -1.15, 0>, <0, -1, 0>, 1 texture { RobustnessTexture }}
}

#declare ControlInstance =
union{
    object { Spiral scale 1.15 }     
    object { InstanceSpecification }
}
