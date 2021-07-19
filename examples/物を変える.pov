/**
 * astah* Diagram 3D Visualization
 * SpringBoot基本 物を変える
 * created at 2021/07/15
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare ActivityDiagram_142_e5cc55d32d78a21ac17bb579a2e7b61a = union {
object { InitialNode rotate -x*90 scale 24.0 translate <181.90, -72.00, 0.00> }
object { Action rotate -x*90 scale 24.0 translate <181.90, -156.32, 0.00> }
 text { ttf LabelFont, "物の属性を見る", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <139.90, -192.32, 30.00> }
object { Action rotate -x*90 scale 24.0 translate <181.90, -235.32, 0.00> }
 text { ttf LabelFont, "物の属性の値を変える", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <121.90, -271.32, 30.00> }
object { ActivityFinal rotate -x*90 scale 24.0 translate <181.90, -344.00, 0.00> }
// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<181.90, -72.00, 4.00>, 3.0
<181.90, -156.32, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }
}
// link ControlFlow/ObjectFlow:
torus { 36.0, 3.0 translate <181.90, -156.32, -32.00>  texture { ControlFlow_ObjectFlowTexture }
}
// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<181.90, -156.32, 4.00>, 3.0
<181.90, -235.32, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }
}
// link ControlFlow/ObjectFlow:
sphere_sweep { linear_spline, 2, 
<181.90, -235.32, 4.00>, 3.0
<181.90, -344.00, 4.00>, 3.0
  texture { ControlFlow_ObjectFlowTexture }
}
}
object { ActivityDiagram_142_e5cc55d32d78a21ac17bb579a2e7b61a  }
#declare EYE = <190.00, -195.50, -417.50>;
#declare FOCUS = <190.00, -195.50, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { ActivityDiagramTexture }}
