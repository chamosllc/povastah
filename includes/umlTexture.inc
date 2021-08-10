/**
 *  UML Links for povastah
 *
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 **/

/** Node Texture **/
#declare RobustnessTexture = texture { T_Chrome_4B }

#declare InterfaceMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Blue_02 } }

#declare ActivityTexture = texture{checker texture{T_Stone8} texture{T_Stone5}}

#declare LabelTecture = texture { T_Grnt15 }
#declare LinkLabelTecture = texture { Peel }
#declare UsageMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Amber_08 } }

/** Link Texture **/

// among instances
#declare LinkMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Yellow_04 } }
// among classes
#declare AssociationMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Gypsum_06 } }
// among actions
#declare ControlFlow_ObjectFlowMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Beerbottle } }
// among states
#declare TransitionMaterial = material { texture { pigment { Col_Glass_Green } finish{ F_Glass1 } } interior { ior 1.5 } }
 

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

// arrow pattern
//#declare ArrowTexture = texture { pigment{ color Red } finish{ phong 0.3 }}

#declare ArrowTexture = texture{ pigment { gradient x+y color_map {
        [0.25 rgbf <1.0, 0.2, 0.2, 0.2>]
        [0.25 rgbf <1.0, 1.0, 1.0, 1.0>]
        [0.75 rgbf <1.0, 1.0, 1.0, 1.0>]
        [0.75 rgbf <1.0, 0.2, 0.2, 0.2>] } scale 5 }  finish{ phong 0.3 }}


//#declare HierachyTecture = texture { T_Chrome_4A }

/** Stage Texture for Diagram **/
#declare DiagramTexture = texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 }
#declare ClassDiagramTexture = texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 }
#declare ActivityDiagramTexture = texture { ActivityTexture rotate -x*90 rotate z*45 scale 96 }
#declare UseCaseDiagramTexture = texture { pigment{ crackle form <-0.8,0.8,0>*3 scale 3 color_map{[0.0 color rgb<1.0,0.7,0.5>][0.5 White] }} rotate -x*90 rotate z*45 scale 96 }
#declare StateMachineDiagramTexture = texture { pigment { brick White Flesh} rotate -y*90 scale 16 }
// stateinternal
#declare InternalTransitionMaterial = material { texture { pigment { color Clear } finish { F_Glass1 } } interior { I_Glass1 fade_color Col_Amethyst_04 } } 

