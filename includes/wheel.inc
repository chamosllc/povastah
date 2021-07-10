/**
 * Wheel Object in POVRay Scene
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 */

/**
 * Wheel
 */
#declare LogPart=cylinder
{
  -1*z,  1*z,  0.02
  texture {T_Wood5 scale 0.01}
}

#declare FencePart1=union{
  object{LogPart translate  0.94*x}
  object{LogPart translate -0.94*x}
  object{LogPart rotate y*90 translate  0.94*z}
  object{LogPart rotate y*90 translate -0.94*z}
}

#declare FencePart2=union{
  object{LogPart scale z*0.1 rotate x*90 translate < 0.94, 0.0,  0.94>}
  object{LogPart scale z*0.1 rotate x*90 translate <-0.94, 0.0,  0.94>}
  object{LogPart scale z*0.1 rotate x*90 translate < 0.94, 0.0, -0.94>}
  object{LogPart scale z*0.1 rotate x*90 translate <-0.94, 0.0, -0.94>}
}

#declare Fence=union{
  object{FencePart1 translate 0.08*y}
  object{FencePart1 translate 0.16*y}
  object{FencePart2 translate 0.1*y}
}

#declare Wheel=union{
        torus{0.45, 0.1 texture{T_Chrome_3A}}
        cylinder{-0.08*y, 0.08*y, 0.16 texture{T_Copper_5A}}
        union{
                cylinder{-0.4*z,0.4*z,0.05}
                cylinder{-0.4*z,0.4*z,0.05 rotate y*45}
                cylinder{-0.4*z,0.4*z,0.05 rotate y*90}
                cylinder{-0.4*z,0.4*z,0.05 rotate y*135}
                texture{T_Silver_1A}               
        }
        scale 2
}
/******** End of Wheel ************/
