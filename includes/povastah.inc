/**
 *  UML Objects for povastah
 *
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 **/

/** Materials for povastah objects **/
#include "povastahParts.inc"

/***************************************************/

#declare LabelFont = "msgothic.ttc"
/*
 * Class Diagram
 */
#declare Class = sphere { 0, 1 texture { T_Orange_Glass }}

#declare Interface = object{ Ring_Sphere ( 1.05, 1.05, 0.06, 0.06 , 5, 5)  
    material { texture { pigment { color Clear } finish { F_Glass2 } } interior { I_Glass1 fade_color Col_Azurite_02 } } 
}
#declare InstanceSpecification = object { Class texture { T_Wood23 }} 

/*
 * Use Case Diagram
 */
#declare Actor = object { Child rotate y*180 translate <0, 4, 0> scale 1/6 }

/*
 * Activity Diagram
 */ 
#declare InitialNode = sphere {<0, 0, 0>, 0.6 texture {T_Chrome_5B} }
#declare ActivityFinal = sphere {<0, 0, 0>, 0.6 texture {T_Chrome_1A} }
#declare FlowFinalNode = difference {
    sphere {<0, 0, 0>, 0.6 }
    box{<-1, -0.1, -1>, <1, 0.1, 1>}
    box{<-0.1, -1, -1>, <0.1, 1, 1>}
    box{<-1, -1, -0.1>, <1, 1, 0.1>}
     texture {T_Chrome_1B} }

#declare Action = object { Round_Cone(<0, -0.6, 0>, 1.2, <0, 0.8, 0>, 0.6, 0.15, 0)
  texture{ checker texture{T_Stone8} texture{ pigment { color rgbf<141/255, 45/255, 45/255, 0.7> }}
  scale 1/3}  
}

#declare ForkNode = union {
    cylinder {<0, 0, -0.3>, <0, 0, 0.2>, 1 material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Amber_08 } }}
    cylinder {<0, 0,  0.2>, <0, 0, 0.3>, 1 texture {T_Copper_4A}}
}

#declare JoinNode = union {
    cylinder {<0, 0, -0.3>, <0, 0, -0.2>, 1 texture {T_Copper_4A}}
    cylinder {<0, 0, -0.2>, <0, 0,  0.3>, 1 material { texture { pigment { color rgbf<1, 1, 1, 0.8> } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Fluorite_05 } }} 
}

#declare Activity=union{
  object{ Fence }
  box{<-1,-0.25,-1>, <1, 0, 1> texture{checker texture{T_Stone8} texture{T_Stone5} scale 1/4}}
  scale 0.8
}

#declare CallBehaviorAction = object { Activity scale 2 }

#declare Process = union {
        object{ ProcessShape scale x*9/10 translate x*0.4 }
        texture{ checker texture{T_Stone8} texture{ pigment { color rgbf<141/255, 45/255, 45/255, 0.7> } } scale 1/4 } }
#declare SendSignalAction = difference {
    object { ProcessShape material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Azurite_01 } } }
    box { <-2, -1, -1>, <-0.5, 1, 1> } translate -x*0.3 }
#declare DecisionNodeMergeNode  = object { Wheel }
#declare AcceptEventAction = difference {
    object { ProcessShape material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Azurite_02 } } }
    box { <0.5, -1, -1>, <2, 1, 1> } }

#declare AcceptTimeEventAction = box { <-0.6, -0.6, -0.6>, <0.6, 0.6, 0.6>  rotate y*45
    material { texture { pigment { color Clear } finish { F_Glass2 } } interior { I_Glass1 fade_color Col_Azurite_02 } }
}

#declare Connector = intersection{
    box {<-2.5,-1.25, -2.5>,<2.5, 1.25, 2.5>}
    object{ Hyperboloid_Y }
    material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Yellow_04 } }
    scale 0.5
}
  
#declare ObjectNode = object { InstanceSpecification }

/*
 * State Transition Diagram
 */

#declare State = object { Round_Cylinder (-0.2*y, 0.2*y, 1.0, 0.1, 0)
     texture{ pigment{ spiral1 1 color_map{[0.0 color rgb <0.85, 0.85, 0.10>][0.7 color rgb<1,1,1, 0.98>]}}
              finish{ Metal } scale 0.2 rotate x*90 } }   
   
#declare StateInternal = difference {
    box { <-0.5, -0.5, -0.5>, <0.5, 0.5, 1>}
    box { <-0.51, -0.51, -1>, <0.51, 0.51, 0> }   
 material { InternalTransitionTexture }}  

#declare SubmachineState = superellipsoid { <0.2, 0.2>
 texture{ pigment{ ripples color_map{[0.0 color rgb <0.75, 1.0, 0.8, 0.3>][0.95 color rgb<1, 1, 1, 0.9>]}}
  finish{ ambient 0.3 } scale 0.05 } scale <0.5, 0.6, 0.36> translate z*0.36 }

#declare InitialPseudostate = object { InitialNode }
#declare ChoicePseudostate = object { Wheel }
#declare FinalState  = object { ActivityFinal }
#declare JoinPseudostate = object { JoinNode }
#declare ForkPseudostate = object { ForkNode }
#declare DeepHistoryPseudostate = object { AcceptTimeEventAction scale 0.8 }
          
#declare ShallowHistoryPseudostate = object{ AcceptTimeEventAction material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Yellow_03 } } scale 0.8}     
#declare JunctionPseudostate = object{ Round_Pyramid_N_out(9, <0, -0.5, 0>, 1.0, <0, 0.3, 0>, 0.7, 0.1, 0, 0) material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Azurite_04 } }  }


/*
 * Robustness Diagram
 */
 
#declare RobustnessTexture = texture { T_Chrome_4B }

#declare AssociationClass = sphere { 0, 0.9 texture { T_Yellow_Glass }}

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

