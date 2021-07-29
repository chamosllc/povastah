/**
 *  UML Links for povastah
 *
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 **/

/** Node Texture **/
#declare RobustnessTexture = texture { T_Chrome_4B }

/** Link Texture **/

#declare LinkTexture = texture { Yellow_Glass }
#declare AssociationTexture = texture { Yellow_Glass }
#declare ControlFlow_ObjectFlowTexture = texture { Yellow_Glass }
#declare TransitionTexture = texture { NBoldglass }
#declare GeneralizationTexture = texture { Orange_Glass }
#declare RealizationTexture = texture { Vicks_Bottle_Glass }
#declare DependencyTexture = texture { Peel }
#declare AssociationClassTexture = texture { Peel }
#declare IncludeTexture = texture { Yellow_Pine } 

#declare LabelTecture = texture { T_Grnt15 }
#declare LinkLabelTecture = texture { Peel }

#declare HierachyTecture = texture { T_Chrome_4A }

/** Stage Texture for Diagram **/
#declare DiagramTexture = texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 }
#declare ClassDiagramTexture = texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 }
#declare ActivityDiagramTexture = texture { pigment { checker color White color GreenYellow } rotate -x*90 rotate z*45 scale 96 }
#declare UseCaseDiagramTexture = texture { pigment{ crackle form <-0.8,0.8,0>*3 scale 3 color_map{[0.0 color rgb<1.0,0.7,0.5>][0.5 White] }} rotate -x*90 rotate z*45 scale 96 }
#declare StateMachineDiagramTexture = texture { pigment { brick White Flesh} rotate -y*90 scale 16 }