/**
 * astah* Diagram 3D Visualization
 * povastah povastah実装クラス
 * created at 2021/07/10
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare HierachyTecture = texture { T_Chrome_4A }
#declare PlaneTexture = texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 }
#declare LabelTecture = texture { T_Grnt15 }
#declare LinkTecture = texture { Yellow_Glass }
#declare LabelFont = "msgothic.ttc"

#declare ClassDiagram0 = union {
object { Class rotate -x*90 scale 24  translate <387.64, -294.00, -0.00> }
 text { ttf LabelFont, "ActivityDiagram", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <342.64, -330.00, 30.00> }
object { Class rotate -x*90 scale 24  translate <101.81, -294.00, -0.00> }
 text { ttf LabelFont, "StateMachineDiagram", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <44.81, -330.00, 30.00> }
object { Class rotate -x*90 scale 24  translate <253.35, -197.00, -64.00> }
 text { ttf LabelFont, "Diagram", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <232.35, -233.00, 30.00> }
object { Class rotate -x*90 scale 24  translate <253.35, -294.00, -32.00> }
 text { ttf LabelFont, "ClassDiagram", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <217.35, -330.00, 30.00> }
object { Class rotate -x*90 scale 24  translate <253.35, -375.00, -0.00> }
 text { ttf LabelFont, "UseCaseDiagram", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <211.35, -411.00, 30.00> }
object { Class rotate -x*90 scale 24  translate <-66.20, -197.00, 0.00> }
 text { ttf LabelFont, "TranslateAction", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-111.20, -233.00, 30.00> }
object { Class rotate -x*90 scale 24  translate <110.50, -197.00, 0.00> }
 text { ttf LabelFont, "SceneProducer", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <71.50, -233.00, 30.00> }
// Links
// Generalization:
sphere_sweep { linear_spline, 2, 
<387.64, -294.00, 4.00>, 3.0
<253.35, -197.00, -60.00>, 3.0
  texture { HierachyTecture }
}
// Generalization:
sphere_sweep { linear_spline, 2, 
<101.81, -294.00, 4.00>, 3.0
<253.35, -197.00, -60.00>, 3.0
  texture { HierachyTecture }
}
// Generalization:
sphere_sweep { linear_spline, 2, 
<253.35, -294.00, -28.00>, 3.0
<253.35, -197.00, -60.00>, 3.0
  texture { HierachyTecture }
}
// Generalization:
sphere_sweep { linear_spline, 2, 
<253.35, -375.00, 4.00>, 3.0
<253.35, -294.00, -28.00>, 3.0
  texture { HierachyTecture }
}
// Association:
sphere_sweep { linear_spline, 2, 
<110.50, -197.00, 4.00>, 3.0
<253.35, -197.00, -60.00>, 3.0
  texture { LinkTecture }
}
// Association:
sphere_sweep { linear_spline, 2, 
<-66.20, -197.00, 4.00>, 3.0
<110.50, -197.00, 4.00>, 3.0
  texture { LinkTecture }
}
}
object { ClassDiagram0  }
#declare EYE = <600.89, 100.50, -353.39>;
#declare FOCUS = <240.89, -228.50, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { PlaneTexture }}
