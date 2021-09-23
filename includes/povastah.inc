/**
 *  UML Objects for povastah
 *
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 **/

/** Materials for povastah objects **/
#include "povastahParts.inc"

#macro vert(base, OZ)
 base + <0,0,OZ>
#end

#macro vertex(base, add)
 base + add
#end

#macro vertexCenter(src, dest)
  vertex(src, (dest - src)/2)
#end

#macro vertCenter(src, dest, OZ)
  vertexCenter(src, vert(dest, OZ))
#end

#macro vertexScale(base, scaling, child)
  vertex(base*<1-scaling, 1-scaling, 1>, child)
#end
/***************************************************/

#declare LabelFont = "msgothic.ttc"
/*
 * Class Diagram
 */
#declare Class = sphere { 0, 1 texture { T_Orange_Glass }}
#declare AbstractClass = object { Class texture {
   pigment{ agate color_map{[0.0  color rgb<1, 0.02, 0.02>][0.8 color rgbf<1, 1, 1, 0.9>]} scale 0.4 }
   finish{diffuse 0.7 }
}}

#declare ConflictClass = union {
    object { Class }
    object { Cross translate y*1 }
}

#declare Interface = object{ Ring_Sphere (1.05, 1.05, 0.06, 0.06 , 5, 5) material{ InterfaceMaterial } }

#declare InstanceSpecification = object { Class texture { T_Wood23 }}
#declare NoInstanceSpecification = union {
    object { InstanceSpecification }
    object { Cross translate y*1 }
}

#declare Lifeline = object { InstanceSpecification }


// illegal Object
#declare Class = sphere { 0, 1 texture { T_Orange_Glass }}


/*
 * Use Case Diagram
 */
#declare BoundaryInstance = object { Child rotate y*180 translate <0, 4, 0> scale 1/8 }

#declare Actor = object { BoundaryInstance }


/*
 * Activity Diagram
 */ 
#declare InitialNode = sphere {<0, 0, 0>, 0.6 texture {T_Chrome_5B} }
#declare ActivityFinal = sphere {<0, 0, 0>, 0.6 texture {T_Chrome_1A} }
#declare FlowFinalNode = difference {
    sphere {<0, 0, 0>, 0.6 }
    sphere {<0, 0, 0>, 0.5 }
    box{<-1, -0.06, -1>, <1, 0.06, 1>}
    box{<-0.06, -1, -1>, <0.06, 1, 1>}
    box{<-1, -1, -0.06>, <1, 1, 0.06>}
     texture {T_Chrome_1B} rotate y*45 }

#declare Action = object { Round_Cylinder(<0, -0.6, 0>, <0, 0.2, 0>, 1.0, 0.15, 0) texture{ ActivityTexture scale 1/2 }}

#declare ForkNode = object { Half_Hollowed_Rounded_Cylinder1(1, 1, 0.2, 1, 1) rotate x*180 translate -y*0.6
    material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Amber_07 } }}
                              
#declare JoinNode = object { Half_Hollowed_Rounded_Cylinder1(1, 1, 0.2, 1, 1)
    material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Amber_08 } }}

#declare Activity=union{
  object{ Fence }
  box{<-1,-0.25,-1>, <1, 0, 1> texture{ ActivityTexture scale 1/2.826 translate x*0.25}}
  scale 0.8
}

#declare CallBehaviorAction = object { Activity scale 2 }

#declare Process = union { object{ ProcessShape scale x*9/10 translate x*0.4 } texture{ ActivityTexture scale 1/4 } }
#declare SendSignalAction = difference {
    object { ProcessShape } box { <-2, -1, -1>, <-0.5, 1, 1> }
    material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Azurite_01 } } translate -x*0.3 }

#declare DecisionNodeMergeNode  = object { Wheel }

#declare AcceptEventAction = difference {
    object { ProcessShape }
    box { <0.5, -1, -1>, <2, 1, 1> }
     material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Azurite_02 } }}

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
/*   
#declare StateInternal = difference {
    box { <-0.5, -0.5, -0.5>, <0.5, 0.5, 1>}
    box { <-0.51, -0.51, -1>, <0.51, 0.51, 0> }   
 material { InternalTransitionMaterial }}
*/
#declare StateInternal = superellipsoid { <0.2, 0.2> scale <0.52, 0.52, 0.75> translate z*0.75 material { InternalTransitionMaterial }}

#declare SubmachineState = superellipsoid { <0.2, 0.2>  texture{ T_Silver_1B } scale <0.5, 0.6, 0.36> translate z*0.36 }  
/*
#declare SubmachineState = superellipsoid { <0.2, 0.2>
 texture{ pigment{ ripples color_map{[0.0 color rgb <0.75, 1.0, 0.8, 0.3>][0.95 color rgb<1, 1, 1, 0.9>]}}
  finish{ ambient 0.3 } scale 0.05 } scale <0.5, 0.6, 0.36> translate z*0.36 
}
*/

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

#declare AssociationClass = sphere { 0, 0.9 material{ AssociationClassMaterial }}

#declare Boundary=union {
    union { 
        intersection{
        	difference{	sphere{ 0, 1.2 } sphere{ 0, 1.01 }}
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

