/**
 *  UML Links for povastah
 *
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 **/

/** Node Texture **/
#declare RobustnessTexture = texture { T_Chrome_4B }

#declare InterfaceMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Blue_02 } }
#declare ArrowInterfaceMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Blue_02 } }

#declare ActivityTexture = texture{checker texture{T_Stone8} texture{T_Stone5} rotate y* 45}

#declare LabelTecture = texture { T_Grnt15 }
#declare LinkLabelTecture = texture { Peel }
#declare MessageLabelTecture = texture { pigment{color Blue} finish{ phong 0.7 }}

#declare UsageMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Amber_08 } }

/** Link Texture **/

// among instances
#declare LinkMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Yellow_04 } } 
#declare LifelineLinkMaterial = material { LinkMaterial }

// among classes
#declare AssociationMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Gypsum_06 } }

// among usecases
#declare UseCaseTexture = texture { T_Wood10 }

// among actions
#declare ControlFlowObjectFlowMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Beerbottle } }

// among states
#declare TransitionMaterial = material { texture { pigment { Col_Glass_Green } finish{ F_Glass1 } } interior { ior 1.5 } }
// stateinternal
#declare InternalTransitionMaterial = material { texture { pigment { color Clear } finish { F_Glass4 } } interior { I_Glass1 fade_color Col_Amethyst_04 } }

#declare StateMaterial = material { InternalTransitionMaterial } 
#declare SubmachineStateMaterial = material { texture{ T_Silver_1B } interior{ ior 1.5 }}

// class hierarchies
#declare GeneralizationMaterial  = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Ruby } }
// implements
#declare RealizationMaterial = material { InterfaceMaterial }
// 
#declare DependencyMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Orange } }

// among association classes
#declare AssociationClassMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Fluorite_05 } }

// include
#declare IncludeMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Blue_04 } }

// template bindings
#declare TemplateBindingMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Gypsum_02  }}  

/** Shadow Link Texture **/

#declare ShadowMaterial = material { M_Glass }

#if(ShadowType)
    #declare ShadowLinkMaterial = material { LinkMaterial }
    #declare ShadowLifelineLinkMaterial = material { LifelineLinkMaterial }
    #declare ShadowAssociationMaterial = material { AssociationMaterial }
    #declare ShadowControlFlowObjectFlowMaterial = material { ControlFlowObjectFlowMaterial }
    #declare ShadowTransitionMaterial = material { TransitionMaterial }
    #declare ShadowRealizationMaterial = material { RealizationMaterial }
    #declare ShadowDependencyMaterial = material { DependencyMaterial }
    #declare ShadowIncludeMaterial = material { IncludeMaterial }
    #declare ShadowTemplateBindingMaterial = material { TemplateBindingMaterial }
    #declare ShadowStateMaterial = material { TransitionMaterial } 
    #declare ShadowSubmachineStateMaterial = material { SubmachineStateMaterial }
#else
    #declare ShadowLinkMaterial = material { ShadowMaterial }
    #declare ShadowLifelineLinkMaterial = material { ShadowMaterial } 
    #declare ShadowAssociationMaterial = material { ShadowMaterial }
    #declare ShadowControlFlowObjectFlowMaterial = material { ShadowMaterial }
    #declare ShadowTransitionMaterial = material { ShadowMaterial }
    #declare ShadowRealizationMaterial = material { ShadowMaterial } 
    #declare ShadowDependencyMaterial = material { ShadowMaterial }
    #declare ShadowIncludeMaterial = material { ShadowMaterial }
    #declare ShadowTemplateBindingMaterial = material { ShadowMaterial }
    #declare ShadowStateMaterial = material { ShadowMaterial } 
    #declare ShadowSubmachineStateMaterial = material { ShadowMaterial }
#end

/** Stage Texture for Diagram **/
#declare DiagramTexture = texture { pigment { hexagon color Pink color White color SkyBlue } finish { phong 0.2 } rotate -x*90 scale 64 }
#declare ClassDiagramTexture = texture { pigment { hexagon color Pink color White color SkyBlue } finish { phong 0.2 } rotate -x*90 scale 64 }
#declare CommunicationDiagramTexture = texture{ pigment{ bozo  color_map{[0.0 color LimeGreen][0.7 White]}scale 64 } finish { phong 0.2 } }
#declare ActivityDiagramTexture = texture { ActivityTexture rotate -x*90 scale 96 }
#declare UseCaseDiagramTexture = texture { pigment{ crackle form <-0.8,0.8,0>*3 scale 3 color_map{[0.0 color rgb<1.0,0.7,0.5>][0.5 White] }} finish { phong 0.2 } rotate -x*90 rotate z*45 scale 96 }
#declare StateMachineDiagramTexture = texture { pigment { brick White Flesh} finish { phong 0.2 } rotate -y*90 scale 16 }


