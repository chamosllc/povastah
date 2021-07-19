/**
 * astah* Diagram 3D Visualization
 * 給与システムSalaryMan SalaryMan_6_0_画面遷移
 * created at 2021/07/18
 * presented by povastah
 **/

#version 3.7
#global_settings { assumed_gamma 2.2 }
#global_settings { charset utf8 }

#include "astahuml.inc"

#declare StateMachineDiagram_79p3_3885535429bae75d78e3378cdc11db25 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <-47.33, -24.93, 0.00> }
object { State rotate -x*90 scale 24.0 translate <49.83, -24.93, 0.00> }
 text { ttf LabelFont, "depend.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <9.33, -60.93, 30.00> }
object { State rotate -x*90 scale 24.0 translate <236.00, -193.59, 0.00> }
 text { ttf LabelFont, "dependEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <162.00, -229.59, 30.00> }
object { State rotate -x*90 scale 24.0 translate <329.17, -24.93, 0.00> }
 text { ttf LabelFont, "dependConfirm.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <238.67, -60.93, 30.00> }
object { FinalState rotate -x*90 scale 24.0 translate <49.83, -193.59, 0.00> }
// link Transition:id [depend{id}]
sphere_sweep { cubic_spline, 6, 
<49.83, -24.93, 4.00>, 3.0
<49.83, -24.93, 4.00>, 3.0
<87.33, -48.24, 4.00>, 3.0
<175.33, -78.24, 4.00>, 3.0
<329.17, -24.93, 4.00>, 3.0
<329.17, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<-47.33, -24.93, 4.00>, 3.0
<49.83, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<49.83, -24.93, 4.00>, 3.0
<49.83, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <329.17, -24.93, -32.00>  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<236.00, -193.59, 4.00>, 3.0
<49.83, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset / back
sphere_sweep { cubic_spline, 5, 
<329.17, -24.93, 4.00>, 3.0
<294.00, -0.62, 4.00>, 3.0
<186.67, 30.43, 4.00>, 3.0
<49.83, -24.93, 4.00>, 3.0
<49.83, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { cubic_spline, 5, 
<329.17, -24.93, 4.00>, 3.0
<329.17, -24.93, 4.00>, 3.0
<320.00, -145.57, 4.00>, 3.0
<236.00, -193.59, 4.00>, 3.0
<236.00, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [error]
torus { 36.0, 3.0 translate <329.17, -24.93, -32.00>  texture { TransitionTexture }}

}
#declare StateMachineDiagram_abv5_3885535429bae75d78e3378cdc11db25 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <-47.33, -24.93, 0.00> }
object { State rotate -x*90 scale 24.0 translate <47.83, -24.93, 0.00> }
 text { ttf LabelFont, "reward.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <9.33, -60.93, 30.00> }
object { State rotate -x*90 scale 24.0 translate <234.00, -193.59, 0.00> }
 text { ttf LabelFont, "rewardEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <162.00, -229.59, 30.00> }
object { State rotate -x*90 scale 24.0 translate <327.17, -24.93, 0.00> }
 text { ttf LabelFont, "rewardConfirm.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <238.67, -60.93, 30.00> }
object { FinalState rotate -x*90 scale 24.0 translate <47.83, -193.59, 0.00> }
// link Transition:id [depend{id}]
sphere_sweep { cubic_spline, 6, 
<47.83, -24.93, 4.00>, 3.0
<47.83, -24.93, 4.00>, 3.0
<87.33, -48.24, 4.00>, 3.0
<175.33, -78.24, 4.00>, 3.0
<327.17, -24.93, 4.00>, 3.0
<327.17, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<-47.33, -24.93, 4.00>, 3.0
<47.83, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<47.83, -24.93, 4.00>, 3.0
<47.83, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <327.17, -24.93, -32.00>  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<234.00, -193.59, 4.00>, 3.0
<47.83, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset / back
sphere_sweep { cubic_spline, 5, 
<327.17, -24.93, 4.00>, 3.0
<293.06, -0.62, 4.00>, 3.0
<186.67, 30.43, 4.00>, 3.0
<47.83, -24.93, 4.00>, 3.0
<47.83, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { cubic_spline, 5, 
<327.17, -24.93, 4.00>, 3.0
<327.17, -24.93, 4.00>, 3.0
<320.00, -145.57, 4.00>, 3.0
<234.00, -193.59, 4.00>, 3.0
<234.00, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [error]
torus { 36.0, 3.0 translate <327.17, -24.93, -32.00>  texture { TransitionTexture }}

}
#declare StateMachineDiagram_anmi_3885535429bae75d78e3378cdc11db25 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <-47.33, -24.93, 0.00> }
object { State rotate -x*90 scale 24.0 translate <60.83, -24.93, 0.00> }
 text { ttf LabelFont, "residentTax.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-10.67, -60.93, 30.00> }
object { State rotate -x*90 scale 24.0 translate <269.00, -193.59, 0.00> }
 text { ttf LabelFont, "residentTaxEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <164.00, -229.59, 30.00> }
object { State rotate -x*90 scale 24.0 translate <340.17, -24.93, 0.00> }
 text { ttf LabelFont, "residentTaxConfirm.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <218.67, -60.93, 30.00> }
object { FinalState rotate -x*90 scale 24.0 translate <60.83, -193.59, 0.00> }
// link Transition:id [depend{id}]
sphere_sweep { cubic_spline, 6, 
<60.83, -24.93, 4.00>, 3.0
<60.83, -24.93, 4.00>, 3.0
<87.33, -48.24, 4.00>, 3.0
<175.33, -78.24, 4.00>, 3.0
<340.17, -24.93, 4.00>, 3.0
<340.17, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<-47.33, -24.93, 4.00>, 3.0
<60.83, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<60.83, -24.93, 4.00>, 3.0
<60.83, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <340.17, -24.93, -32.00>  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<269.00, -193.59, 4.00>, 3.0
<60.83, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset / back
sphere_sweep { cubic_spline, 5, 
<340.17, -24.93, 4.00>, 3.0
<299.18, -0.62, 4.00>, 3.0
<186.67, 30.43, 4.00>, 3.0
<60.83, -24.93, 4.00>, 3.0
<60.83, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { cubic_spline, 5, 
<340.17, -24.93, 4.00>, 3.0
<340.17, -24.93, 4.00>, 3.0
<320.00, -145.57, 4.00>, 3.0
<269.00, -193.59, 4.00>, 3.0
<269.00, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [error]
torus { 36.0, 3.0 translate <340.17, -24.93, -32.00>  texture { TransitionTexture }}

}
#declare StateMachineDiagram_b3gf_3885535429bae75d78e3378cdc11db25 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <-47.33, -24.93, 0.00> }
object { State rotate -x*90 scale 24.0 translate <56.33, -24.93, 0.00> }
 text { ttf LabelFont, "insurance.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <-2.67, -60.93, 30.00> }
object { State rotate -x*90 scale 24.0 translate <242.50, -193.59, 0.00> }
 text { ttf LabelFont, "insuranceEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <150.00, -229.59, 30.00> }
object { State rotate -x*90 scale 24.0 translate <335.67, -24.93, 0.00> }
 text { ttf LabelFont, "insuranceConfirm.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <226.67, -60.93, 30.00> }
object { FinalState rotate -x*90 scale 24.0 translate <56.33, -193.59, 0.00> }
// link Transition:id [depend{id}]
sphere_sweep { cubic_spline, 6, 
<56.33, -24.93, 4.00>, 3.0
<56.33, -24.93, 4.00>, 3.0
<87.33, -48.24, 4.00>, 3.0
<175.33, -78.24, 4.00>, 3.0
<335.67, -24.93, 4.00>, 3.0
<335.67, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<-47.33, -24.93, 4.00>, 3.0
<56.33, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<56.33, -24.93, 4.00>, 3.0
<56.33, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <335.67, -24.93, -32.00>  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<242.50, -193.59, 4.00>, 3.0
<56.33, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset / back
sphere_sweep { cubic_spline, 5, 
<335.67, -24.93, 4.00>, 3.0
<297.06, -0.62, 4.00>, 3.0
<186.67, 30.43, 4.00>, 3.0
<56.33, -24.93, 4.00>, 3.0
<56.33, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { cubic_spline, 5, 
<335.67, -24.93, 4.00>, 3.0
<335.67, -24.93, 4.00>, 3.0
<320.00, -145.57, 4.00>, 3.0
<242.50, -193.59, 4.00>, 3.0
<242.50, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [error]
torus { 36.0, 3.0 translate <335.67, -24.93, -32.00>  texture { TransitionTexture }}

}
#declare StateMachineDiagram_bhm0_3885535429bae75d78e3378cdc11db25 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <-47.33, -24.93, 0.00> }
object { State rotate -x*90 scale 24.0 translate <73.50, -24.93, 0.00> }
 text { ttf LabelFont, "retire.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <40.00, -60.93, 30.00> }
object { State rotate -x*90 scale 24.0 translate <251.08, -193.59, 0.00> }
 text { ttf LabelFont, "retireEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <184.00, -229.59, 30.00> }
object { State rotate -x*90 scale 24.0 translate <322.17, -24.93, 0.00> }
 text { ttf LabelFont, "retireConfirm.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <238.67, -60.93, 30.00> }
object { FinalState rotate -x*90 scale 24.0 translate <73.50, -193.59, 0.00> }
// link Transition:id [depend{id}]
sphere_sweep { cubic_spline, 6, 
<73.50, -24.93, 4.00>, 3.0
<73.50, -24.93, 4.00>, 3.0
<87.33, -48.24, 4.00>, 3.0
<175.33, -78.24, 4.00>, 3.0
<322.17, -24.93, 4.00>, 3.0
<322.17, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<-47.33, -24.93, 4.00>, 3.0
<73.50, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<73.50, -24.93, 4.00>, 3.0
<73.50, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <322.17, -24.93, -32.00>  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<251.08, -193.59, 4.00>, 3.0
<73.50, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset / back
sphere_sweep { cubic_spline, 5, 
<322.17, -24.93, 4.00>, 3.0
<290.70, -0.62, 4.00>, 3.0
<186.67, 30.43, 4.00>, 3.0
<73.50, -24.93, 4.00>, 3.0
<73.50, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { cubic_spline, 5, 
<322.17, -24.93, 4.00>, 3.0
<322.17, -24.93, 4.00>, 3.0
<320.00, -145.57, 4.00>, 3.0
<251.08, -193.59, 4.00>, 3.0
<251.08, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [error]
torus { 36.0, 3.0 translate <322.17, -24.93, -32.00>  texture { TransitionTexture }}

}
#declare StateMachineDiagram_bslb_3885535429bae75d78e3378cdc11db25 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <-47.33, -24.93, 0.00> }
object { State rotate -x*90 scale 24.0 translate <87.50, -24.93, 0.00> }
 text { ttf LabelFont, "create.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <40.00, -60.93, 30.00> }
object { State rotate -x*90 scale 24.0 translate <236.60, -193.59, 0.00> }
 text { ttf LabelFont, "entry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <208.00, -229.59, 30.00> }
object { State rotate -x*90 scale 24.0 translate <306.67, -24.93, 0.00> }
 text { ttf LabelFont, "confirm.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <262.67, -60.93, 30.00> }
object { FinalState rotate -x*90 scale 24.0 translate <87.50, -193.59, 0.00> }
// link Transition:submit
sphere_sweep { cubic_spline, 5, 
<87.50, -24.93, 4.00>, 3.0
<87.50, -24.93, 4.00>, 3.0
<175.33, -78.24, 4.00>, 3.0
<306.67, -24.93, 4.00>, 3.0
<306.67, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<-47.33, -24.93, 4.00>, 3.0
<87.50, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<87.50, -24.93, 4.00>, 3.0
<87.50, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<236.60, -193.59, 4.00>, 3.0
<87.50, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset / back
sphere_sweep { cubic_spline, 5, 
<306.67, -24.93, 4.00>, 3.0
<283.40, -0.62, 4.00>, 3.0
<186.67, 30.43, 4.00>, 3.0
<87.50, -24.93, 4.00>, 3.0
<87.50, -24.93, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { cubic_spline, 5, 
<306.67, -24.93, 4.00>, 3.0
<306.67, -24.93, 4.00>, 3.0
<320.00, -145.57, 4.00>, 3.0
<236.60, -193.59, 4.00>, 3.0
<236.60, -193.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <87.50, -24.93, -32.00>  texture { TransitionTexture }}

// link Transition:submit [error]
torus { 36.0, 3.0 translate <87.50, -24.93, -32.00>  texture { TransitionTexture }}

}
#declare StateMachineDiagram_edbb_3885535429bae75d78e3378cdc11db25 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <127.33, -56.11, 0.00> }
object { State rotate -x*90 scale 24.0 translate <211.50, -56.11, 0.00> }
 text { ttf LabelFont, "list.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <192.00, -92.11, 30.00> }
object { State rotate -x*90 scale 24.0 translate <436.83, -56.11, 0.00> }
 text { ttf LabelFont, "inspect.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <393.33, -92.11, 30.00> }
object { FinalState rotate -x*90 scale 24.0 translate <211.50, -198.11, 0.00> }
// link Transition:id
sphere_sweep { cubic_spline, 6, 
<211.50, -56.11, 4.00>, 3.0
<211.50, -56.11, 4.00>, 3.0
<262.00, -79.43, 4.00>, 3.0
<319.33, -108.00, 4.00>, 3.0
<436.83, -56.11, 4.00>, 3.0
<436.83, -56.11, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<127.33, -56.11, 4.00>, 3.0
<211.50, -56.11, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit [@{.}]
sphere_sweep { linear_spline, 2, 
<211.50, -56.11, 4.00>, 3.0
<211.50, -198.11, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset / back
sphere_sweep { cubic_spline, 5, 
<436.83, -56.11, 4.00>, 3.0
<413.83, -38.97, 4.00>, 3.0
<302.67, -16.67, 4.00>, 3.0
<211.50, -56.11, 4.00>, 3.0
<211.50, -56.11, 4.00>, 3.0
  texture { TransitionTexture }}

}
#declare StateMachineDiagram_74ko_3885535429bae75d78e3378cdc11db25 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <420.00, 30.67, 0.00> }
object { SubmachineState rotate -x*90 scale 24.0 translate <188.67, -237.83, 0.00> }
 text { ttf LabelFont, "扶養", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <127.67, -273.83, 30.00> }
object { StateMachineDiagram_79p3_3885535429bae75d78e3378cdc11db25 scale 0.18970352564102563 translate <156.5751535790601, -220.98528896233972, -8.5129> }
object { State rotate -x*90 scale 24.0 translate <419.70, -47.50, 0.00> }
 text { ttf LabelFont, "管理者操作", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <381.67, -83.50, 30.00> }
object { SubmachineState rotate -x*90 scale 24.0 translate <391.50, -193.83, 0.00> }
 text { ttf LabelFont, "基本給", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <349.00, -229.83, 30.00> }
object { StateMachineDiagram_abv5_3885535429bae75d78e3378cdc11db25 scale 0.18970352564102563 translate <359.7878939636751, -176.98528896233972, -8.5129> }
object { SubmachineState rotate -x*90 scale 24.0 translate <556.17, -258.83, 0.00> }
 text { ttf LabelFont, "住民税", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <500.67, -294.83, 30.00> }
object { StateMachineDiagram_anmi_3885535429bae75d78e3378cdc11db25 scale 0.18970352564102563 translate <521.9884147970088, -241.98528896233972, -8.5129> }
object { SubmachineState rotate -x*90 scale 24.0 translate <705.17, -180.83, 0.00> }
 text { ttf LabelFont, "保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <638.67, -216.83, 30.00> }
object { StateMachineDiagram_b3gf_3885535429bae75d78e3378cdc11db25 scale 0.18970352564102563 translate <671.8420806623933, -163.98528896233972, -8.5129> }
object { SubmachineState rotate -x*90 scale 24.0 translate <704.83, -47.50, 0.00> }
 text { ttf LabelFont, "退職", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <675.33, -83.50, 30.00> }
object { StateMachineDiagram_bhm0_3885535429bae75d78e3378cdc11db25 scale 0.18970352564102563 translate <673.7851896367521, -30.651955629006423, -8.5129> }
object { SubmachineState rotate -x*90 scale 24.0 translate <139.00, -40.50, 0.00> }
 text { ttf LabelFont, "登録", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <100.00, -76.50, 30.00> }
object { StateMachineDiagram_bslb_3885535429bae75d78e3378cdc11db25 scale 0.1788141993957704 translate <112.77391742195374, -26.274957908484403, -8.5129> }
object { SubmachineState rotate -x*90 scale 24.0 translate <121.67, -143.59, 0.00> }
 text { ttf LabelFont, "一覧", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <72.67, -179.59, 30.00> }
object { StateMachineDiagram_edbb_3885535429bae75d78e3378cdc11db25 scale 0.23030155642023345 translate <52.84488488975359, -119.2150672279054, -8.5129> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<420.00, 30.67, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:depend
sphere_sweep { cubic_spline, 5, 
<419.70, -47.50, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
<297.33, -123.33, 4.00>, 3.0
<188.67, -237.83, 4.00>, 3.0
<188.67, -237.83, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reward
sphere_sweep { linear_spline, 2, 
<419.70, -47.50, 4.00>, 3.0
<391.50, -193.83, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:residentTax
sphere_sweep { cubic_spline, 5, 
<419.70, -47.50, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
<531.33, -162.00, 4.00>, 3.0
<556.17, -258.83, 4.00>, 3.0
<556.17, -258.83, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:insurance
sphere_sweep { cubic_spline, 5, 
<419.70, -47.50, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
<676.67, -114.00, 4.00>, 3.0
<705.17, -180.83, 4.00>, 3.0
<705.17, -180.83, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:retire
sphere_sweep { cubic_spline, 5, 
<419.70, -47.50, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
<551.67, -19.91, 4.00>, 3.0
<704.83, -47.50, 4.00>, 3.0
<704.83, -47.50, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:create
sphere_sweep { cubic_spline, 5, 
<419.70, -47.50, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
<267.00, -17.91, 4.00>, 3.0
<139.00, -40.50, 4.00>, 3.0
<139.00, -40.50, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<188.67, -237.83, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { cubic_spline, 5, 
<391.50, -193.83, 4.00>, 3.0
<391.50, -193.83, 4.00>, 3.0
<394.00, -158.67, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { cubic_spline, 5, 
<556.17, -258.83, 4.00>, 3.0
<556.17, -258.83, 4.00>, 3.0
<591.33, -146.67, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<705.17, -180.83, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { cubic_spline, 5, 
<704.83, -47.50, 4.00>, 3.0
<704.83, -47.50, 4.00>, 3.0
<563.00, -68.57, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { cubic_spline, 5, 
<139.00, -40.50, 4.00>, 3.0
<139.00, -40.50, 4.00>, 3.0
<250.33, -59.91, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:list
sphere_sweep { cubic_spline, 5, 
<419.70, -47.50, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
<238.00, -79.33, 4.00>, 3.0
<121.67, -143.59, 4.00>, 3.0
<121.67, -143.59, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<121.67, -143.59, 4.00>, 3.0
<419.70, -47.50, 4.00>, 3.0
  texture { TransitionTexture }}

}
#declare StateMachineDiagram_7922_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.67, -131.33, 0.00> }
object { State rotate -x*90 scale 24.0 translate <210.83, -10.05, 0.00> }
 text { ttf LabelFont, "employ.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <171.33, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <407.00, -10.05, 0.00> }
 text { ttf LabelFont, "employEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <334.00, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <380.83, -140.71, 0.00> }
 text { ttf LabelFont, "employList.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <315.33, -176.71, 30.00> }
object { ChoicePseudostate rotate -x*90 scale 24.0 translate <167.50, -130.17, 0.00> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<88.67, -131.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:entry
sphere_sweep { linear_spline, 2, 
<167.50, -130.17, 4.00>, 3.0
<210.83, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit / save
sphere_sweep { linear_spline, 2, 
<210.83, -10.05, 4.00>, 3.0
<407.00, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { linear_spline, 2, 
<407.00, -10.05, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <210.83, -10.05, -32.00>  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { cubic_spline, 5, 
<210.83, -10.05, 4.00>, 3.0
<210.83, -10.05, 4.00>, 3.0
<159.33, -56.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { linear_spline, 2, 
<380.83, -140.71, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:list
sphere_sweep { cubic_spline, 5, 
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<258.67, -185.00, 4.00>, 3.0
<380.83, -140.71, 4.00>, 3.0
<380.83, -140.71, 4.00>, 3.0
  texture { TransitionTexture }}

}
#declare StateMachineDiagram_7922_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.67, -131.33, 0.00> }
object { State rotate -x*90 scale 24.0 translate <210.83, -10.05, 0.00> }
 text { ttf LabelFont, "employ.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <171.33, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <407.00, -10.05, 0.00> }
 text { ttf LabelFont, "employEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <334.00, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <380.83, -140.71, 0.00> }
 text { ttf LabelFont, "employList.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <315.33, -176.71, 30.00> }
object { ChoicePseudostate rotate -x*90 scale 24.0 translate <167.50, -130.17, 0.00> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<88.67, -131.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:entry
sphere_sweep { linear_spline, 2, 
<167.50, -130.17, 4.00>, 3.0
<210.83, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit / save
sphere_sweep { linear_spline, 2, 
<210.83, -10.05, 4.00>, 3.0
<407.00, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { linear_spline, 2, 
<407.00, -10.05, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <210.83, -10.05, -32.00>  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { cubic_spline, 5, 
<210.83, -10.05, 4.00>, 3.0
<210.83, -10.05, 4.00>, 3.0
<159.33, -56.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { linear_spline, 2, 
<380.83, -140.71, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:list
sphere_sweep { cubic_spline, 5, 
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<258.67, -185.00, 4.00>, 3.0
<380.83, -140.71, 4.00>, 3.0
<380.83, -140.71, 4.00>, 3.0
  texture { TransitionTexture }}

}
#declare StateMachineDiagram_7gkj_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.67, -131.33, 0.00> }
object { State rotate -x*90 scale 24.0 translate <207.83, -10.05, 0.00> }
 text { ttf LabelFont, "health.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <171.33, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <404.00, -10.05, 0.00> }
 text { ttf LabelFont, "healthEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <334.00, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <377.83, -140.71, 0.00> }
 text { ttf LabelFont, "healthList.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <315.33, -176.71, 30.00> }
object { ChoicePseudostate rotate -x*90 scale 24.0 translate <167.50, -130.17, 0.00> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<88.67, -131.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:entry
sphere_sweep { linear_spline, 2, 
<167.50, -130.17, 4.00>, 3.0
<207.83, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit / save
sphere_sweep { linear_spline, 2, 
<207.83, -10.05, 4.00>, 3.0
<404.00, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { linear_spline, 2, 
<404.00, -10.05, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <207.83, -10.05, -32.00>  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { cubic_spline, 5, 
<207.83, -10.05, 4.00>, 3.0
<207.83, -10.05, 4.00>, 3.0
<159.33, -56.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { linear_spline, 2, 
<377.83, -140.71, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:list
sphere_sweep { cubic_spline, 5, 
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<258.67, -185.00, 4.00>, 3.0
<377.83, -140.71, 4.00>, 3.0
<377.83, -140.71, 4.00>, 3.0
  texture { TransitionTexture }}

}
#declare StateMachineDiagram_7pya_e8128ac6c1d56428bfcbc5567f70b355 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <88.67, -131.33, 0.00> }
object { State rotate -x*90 scale 24.0 translate <198.55, -10.05, 0.00> }
 text { ttf LabelFont, "tax.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <183.33, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <395.36, -10.05, 0.00> }
 text { ttf LabelFont, "taxEntry.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <346.00, -46.05, 30.00> }
object { State rotate -x*90 scale 24.0 translate <368.33, -140.71, 0.00> }
 text { ttf LabelFont, "taxList.html", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <327.33, -176.71, 30.00> }
object { ChoicePseudostate rotate -x*90 scale 24.0 translate <167.50, -130.17, 0.00> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<88.67, -131.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:entry
sphere_sweep { linear_spline, 2, 
<167.50, -130.17, 4.00>, 3.0
<198.55, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit / save
sphere_sweep { linear_spline, 2, 
<198.55, -10.05, 4.00>, 3.0
<395.36, -10.05, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:submit
sphere_sweep { linear_spline, 2, 
<395.36, -10.05, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:reset
torus { 36.0, 3.0 translate <198.55, -10.05, -32.00>  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { cubic_spline, 5, 
<198.55, -10.05, 4.00>, 3.0
<198.55, -10.05, 4.00>, 3.0
<159.33, -56.33, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:back
sphere_sweep { linear_spline, 2, 
<368.33, -140.71, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:list
sphere_sweep { cubic_spline, 5, 
<167.50, -130.17, 4.00>, 3.0
<167.50, -130.17, 4.00>, 3.0
<258.67, -185.00, 4.00>, 3.0
<368.33, -140.71, 4.00>, 3.0
<368.33, -140.71, 4.00>, 3.0
  texture { TransitionTexture }}

}
#declare StateMachineDiagram_17bc2_39aff7367173f652afc310de89302491 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <236.44, 47.78, 0.00> }
object { State rotate -x*90 scale 24.0 translate <236.19, -24.03, 0.00> }
 text { ttf LabelFont, "管理者操作", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <198.16, -60.03, 30.00> }
object { SubmachineState rotate -x*90 scale 24.0 translate <267.00, -146.03, 0.00> }
 text { ttf LabelFont, "厚生年金保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <199.50, -182.03, 30.00> }
object { StateMachineDiagram_7922_e8128ac6c1d56428bfcbc5567f70b355 scale 0.2026969178082192 translate <212.0353524543379, -131.45394890351255, -8.5129> }
object { SubmachineState rotate -x*90 scale 24.0 translate <89.83, -146.03, 0.00> }
 text { ttf LabelFont, "雇用保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <38.33, -182.03, 30.00> }
object { StateMachineDiagram_7922_e8128ac6c1d56428bfcbc5567f70b355 scale 0.2026969178082192 translate <34.86868578767116, -131.45394890351255, -8.5129> }
object { SubmachineState rotate -x*90 scale 24.0 translate <440.50, -146.03, 0.00> }
 text { ttf LabelFont, "健康保険", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <392.00, -182.03, 30.00> }
object { StateMachineDiagram_7gkj_e8128ac6c1d56428bfcbc5567f70b355 scale 0.2026969178082192 translate <386.1434432077626, -131.45394890351255, -8.5129> }
object { SubmachineState rotate -x*90 scale 24.0 translate <475.17, -24.03, 0.00> }
 text { ttf LabelFont, "源泉徴収税額", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <420.70, -60.03, 30.00> }
object { StateMachineDiagram_7pya_e8128ac6c1d56428bfcbc5567f70b355 scale 0.2026969178082192 translate <422.53303367579906, -9.453948903512561, -8.5129> }
// link Transition:[employ]
sphere_sweep { linear_spline, 2, 
<236.19, -24.03, 4.00>, 3.0
<89.83, -146.03, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:[annuity]
sphere_sweep { linear_spline, 2, 
<236.19, -24.03, 4.00>, 3.0
<267.00, -146.03, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:[health]
sphere_sweep { linear_spline, 2, 
<236.19, -24.03, 4.00>, 3.0
<440.50, -146.03, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:[tax]
sphere_sweep { linear_spline, 2, 
<236.19, -24.03, 4.00>, 3.0
<475.17, -24.03, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:
sphere_sweep { linear_spline, 2, 
<236.44, 47.78, 4.00>, 3.0
<236.19, -24.03, 4.00>, 3.0
  texture { TransitionTexture }}

}
#declare StateMachineDiagram_iwpg_3885535429bae75d78e3378cdc11db25 = union {
object { InitialPseudostate rotate -x*90 scale 24.0 translate <236.44, 47.78, 0.00> }
object { State rotate -x*90 scale 24.0 translate <236.19, -24.03, 0.00> }
 text { ttf LabelFont, "管理者操作", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <198.16, -60.03, 30.00> }
object { SubmachineState rotate -x*90 scale 24.0 translate <530.83, -19.82, 0.00> }
 text { ttf LabelFont, "社員データベース", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <435.33, -55.82, 30.00> }
object { StateMachineDiagram_74ko_3885535429bae75d78e3378cdc11db25 scale 0.1553477690288714 translate <465.2506835083114, -0.5787401574802438, -8.23> }
object { SubmachineState rotate -x*90 scale 24.0 translate <530.51, -126.48, 0.00> }
 text { ttf LabelFont, "社会保険・所得税データベース", 1, 0 scale <16.0, 16.0, 2> texture { LabelTecture }
 translate <371.67, -162.48, 30.00> }
object { StateMachineDiagram_17bc2_39aff7367173f652afc310de89302491 scale 0.20767543859649124 translate <473.22285818713465, -114.28747563352825, -8.23> }
// link Transition:
sphere_sweep { linear_spline, 2, 
<236.44, 47.78, 4.00>, 3.0
<236.19, -24.03, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:memberdb
sphere_sweep { linear_spline, 2, 
<236.19, -24.03, 4.00>, 3.0
<530.83, -19.82, 4.00>, 3.0
  texture { TransitionTexture }}

// link Transition:socialdb
sphere_sweep { linear_spline, 2, 
<236.19, -24.03, 4.00>, 3.0
<530.51, -126.48, 4.00>, 3.0
  texture { TransitionTexture }}

}
object { StateMachineDiagram_iwpg_3885535429bae75d78e3378cdc11db25 }
#declare EYE = <407.66, -49.22, -488.88>;
#declare FOCUS = <407.66, -49.22, 0.00>;
camera { location EYE direction 1*z look_at FOCUS }
light_source { <-1000.00, -1000.00, -3000.00> color White }
plane { z, 32.0 texture { StateMachineDiagramTexture }}
