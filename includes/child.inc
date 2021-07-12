/**
 * Wheel Object in POVRay Scene
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 */

//blob constants
#declare T = 0.57;	//0.25	//threshold
#declare R = 2;	//1.5	//radius
#declare S = 1;	//0.81	//strength
#declare Q = seed(0);

// Arm_Angle
#declare Right_Arm_Angle = 25; //35.5
#declare Left_Arm_Angle = -25;
/******************************************/
//		Textures
/******************************************/
#declare Skin_Texture =
texture{
  pigment{ color (Orange*2+Flesh*6+Tan*2)/10 }
  normal{ bumps 0.0625 scale 0.05 }
  finish{
    ambient 0.1
    diffuse 0.6
    brilliance 1
  }
}
#declare Hair_Texture =
texture{
  pigment{ color (Orange*2+BakersChoc*3+DarkWood*5)/10 }
  normal{ bumps 0.3 scale <0.05,2,0.1> }
  finish{
    ambient 0.1
    diffuse 0.6
    brilliance 1
  }
}
#declare White_Shirt_Texture =
texture{
  pigment{ color (White*7+Tan*3)/10 }
  normal{ bumps 0.1 scale 0.05 }
  finish{
    ambient 0.1
    diffuse 0.6
    brilliance 0.75
  }
}
#declare Blue_Shirt_Texture =
texture{
  pigment{ color (SkyBlue*1+DarkSlateBlue*1+Navy*3)/5 }
  finish{
    ambient 0.1
    diffuse 0.6
    brilliance 0.75
  }
}
#declare Shorts_Texture =
texture{
  pigment{ color (SkyBlue*1+DarkSlateBlue*1+Gray50*1)/3 }
  normal{ bumps 0.1 scale 0.05 }
  finish{
    ambient 0.1
    diffuse 0.6
    brilliance 0.75
  }
}
#declare Socks_Texture =
texture{
  pigment{ color (White*7+Tan*3)/10 }
  normal{ bumps 0.5 scale <0.025,20,0.025> translate <0,1,0> }
  finish{
    ambient 0.1
    diffuse 0.6
    brilliance 1
  }
}
#declare Shoe_Texture =
texture{
  pigment{ color (Red+Scarlet)/2 }
  normal{ bumps 0.25 scale 0.25 }
  finish{
    ambient 0
    diffuse 0.5
    brilliance 0.75
  }
}
#declare Shoe_Sole_Texture =
texture{
  pigment{ color (White*7+Tan*3)/10 }
}
/******************************************/
#declare Shorts =
blob{
  threshold T
  //right pant leg
  sphere{ 0,R,S*3 scale <1,1.5,1.25>     translate <1.25,0,-0.5> }
  sphere{ 0,R,S*3 scale <1,1.5,1.25>     translate <1.25,0,0> }
  sphere{ 0,R,S*3 scale <1,1.5,1.25>     translate <1.25,-2,0> }
  sphere{ 0,R,-S*3 scale <0.9,1.5,1.25>  translate <1.25,-4,0> }
  
  //buttocks area
  sphere{ 0,R,S*3 scale <1.25,1.25,1.25> translate <0.5,0.5,-0.5> }
  sphere{ 0,R,S*3 scale <1.25,1.25,1.25> translate <-0.5,0.5,-0.5> }
  
  //left pant leg
  sphere{ 0,R,S*3 scale <1,1.5,1.25>     translate <-1.25,0,-0.5> }
  sphere{ 0,R,S*3 scale <1,1.5,1.25>     translate <-1.25,0,0> }
  sphere{ 0,R,S*3 scale <1,1.5,1.25>     translate <-1.25,-2,0> }
  sphere{ 0,R,-S*3 scale <0.9,1.5,1.25>  translate <-1.25,-4,0> }
  
  texture{ Shorts_Texture }
}
#declare Leg =
blob{
  threshold T
  //thigh
  sphere{ 0,R,S*1.5 scale <0.9,2,0.9> translate <0,-2,0> }
  sphere{ 0,R,S*1.5 scale <0.9,2,0.9> translate <0,-4,0> }
  
  //shin
  sphere{ 0,R,S*1.5 scale <0.65,2,0.65> translate <0,-8,0> }
  
  //calf
  sphere{ 0,R,S scale <0.5,1,0.5> translate <0,-6.75,-0.375> }
  
  //knee
  sphere{ 0,R,S scale <0.5,0.5,0.35> translate <0,-5.625,0.75> }
  
  texture{ Skin_Texture }
}
#declare Sock =
blob{
  threshold T
  sphere{ 0,R,S scale <0.8,2,0.8> translate <0,-9,0> }
  
  texture{ Socks_Texture }
}
#declare Shoe =
blob{
  threshold T
  sphere{ 0,R,-S*3 scale <1,2,1> translate <0,-7,0> }
  sphere{ 0,R,S scale 0.8 translate <0,-10.5,-0.25> }
  sphere{ 0,R,S scale 0.8 translate <0,-10,0> }
  sphere{ 0,R,S scale 0.8 translate <0,-10.5,0.5> }
  sphere{ 0,R,S scale <0.8,0.65,2> translate <0,-11,1.25> }
  texture{ Shoe_Texture }
}

#declare White_Shirt =
blob{
  threshold T
  //back of shirt
  sphere{ 0,R,S scale <1.25,3/2,1.5> translate <1.5,  0,-0.5> }
  sphere{ 0,R,S scale <1.25,3/2,1.5> translate <0.75, 0,-0.5> }
  sphere{ 0,R,S scale <1.25,3/2,1.5> translate <0,    0,-0.5> }
  sphere{ 0,R,S scale <1.25,3/2,1.5> translate <-0.75,0,-0.5> }
  sphere{ 0,R,S scale <1.25,3/2,1.5> translate <-1.5, 0,-0.5> }
  
  //upper-middle of shirt
  sphere{ 0,R,S scale <1.25,2.75,1.375> translate <1.5,  3,0> }
  sphere{ 0,R,S scale <1.25,2.75,1.375> translate <0.75, 3,0> }
  sphere{ 0,R,S scale <1.25,2.75,1.375> translate <0,    3,0> }
  sphere{ 0,R,S scale <1.25,2.75,1.375> translate <-0.75,3,0> }
  sphere{ 0,R,S scale <1.25,2.75,1.375> translate <-1.5, 3,0> }
  
  //lower-front of shirt
  sphere{ 0,R,S scale <1.25,1,1.25> translate <1.5,  1,0> }
  sphere{ 0,R,S scale <1.25,1,1.25> translate <0.75, 1,0> }
  sphere{ 0,R,S scale <1.25,1,1.25> translate <0,    1,0> }
  sphere{ 0,R,S scale <1.25,1,1.25> translate <-0.75,1,0> }
  sphere{ 0,R,S scale <1.25,1,1.25> translate <-1.5, 1,0> }
  
  //shoulders
  sphere{ 0,R,S scale <1.25,1.5,1.25> translate <1.5,  6,-0.25> }
  sphere{ 0,R,S scale <1.25,1.5,1.25> translate <0.75, 6,-0.25> }
  sphere{ 0,R,S scale <1.25,1.5,1.25> translate <0,    6,-0.25> }
  sphere{ 0,R,S scale <1.25,1.5,1.25> translate <-0.75,6,-0.25> }
  sphere{ 0,R,S scale <1.25,1.5,1.25> translate <-1.5, 6,-0.25> }
  sphere{ 0,R,S scale <1.25,1.5,1> translate <1.5,  6,0.5> }
  sphere{ 0,R,S scale <1.25,1.5,1> translate <0.75, 6,0.5> }
  sphere{ 0,R,S scale <1.25,1.5,1> translate <0,    6,0.5> }
  sphere{ 0,R,S scale <1.25,1.5,1> translate <-0.75,6,0.5> }
  sphere{ 0,R,S scale <1.25,1.5,1> translate <-1.5, 6,0.5> }
  
  //right sleeve
  sphere{ 0,R,S*5 scale <1.5,4,1.5>/2 translate <0,-5,0>/2 rotate z*Right_Arm_Angle translate <1.75,7,0> }
  sphere{ 0,R,-S*5 scale <1.25,6,1.25>/2 translate <0,-10,0>/2 rotate z*Right_Arm_Angle translate <1.75,7,0> }
  
  //left sleeve
  sphere{ 0,R,S*5 scale <1.5,3.5,1.5>/2 translate <0,-5,0>/2 rotate z*Left_Arm_Angle translate <-1.75,7,0> }
  sphere{ 0,R,-S*5 scale <1.25,4,1.25>/2 translate <0,-10,0>/2 rotate z*Left_Arm_Angle translate <-1.75,7,0> }
  
  //cuts hole for bottom of shirt
  sphere{ 0,R,-S*10 scale <2,1,1.75> translate <0,-1,-0.25> }
  
  texture{ White_Shirt_Texture }
}
#declare Blue_Shirt =
blob{
  threshold T
  //right sleeve band
  sphere{ 0,R,S scale <1.75,2,1.75>/2 translate <0.25,-3.75,0> rotate z*Right_Arm_Angle translate <1.75,7,0> }
  sphere{ 0,R,S scale <1.75,2,1.75>/2 translate <-0.35,-3.75,0> rotate z*Right_Arm_Angle translate <1.75,7,0> }
  sphere{ 0,R,-S*5 scale <2,1,2>/2 translate <0,-4.75,0> rotate z*Right_Arm_Angle translate <1.75,7,0> }
  
  //left sleeve band
  sphere{ 0,R,S scale <2,1.5,2>/2 translate <-0.25,-3.875,0> rotate z*Left_Arm_Angle translate <-1.75,7,0> }
  sphere{ 0,R,S scale <2,1.5,2>/2 translate <0.35,-3.875,0> rotate z*Left_Arm_Angle translate <-1.75,7,0> }
  sphere{ 0,R,-S*5 scale <2,1,2>/2 translate <0,-4.75,0> rotate z*Left_Arm_Angle translate <-1.75,7,0> }
  
  //back of shirt band
  sphere{ 0,R,S scale <1.6,3/2,1.4> translate <1.5,  0,-0.5> }
  sphere{ 0,R,S scale <1.65,3/2,1.5> translate <0.75, 0,-0.5> }
  sphere{ 0,R,S scale <1.65,3/2,1.55> translate <0,    0,-0.5> }
  sphere{ 0,R,S scale <1.65,3/2,1.5> translate <-0.75,0,-0.5> }
  sphere{ 0,R,S scale <1.6,3/2,1.4> translate <-1.5, 0,-0.5> }
  sphere{ 0,R,S scale <1.5,3/3,1.3> translate <1.5,-.2,0> }
/*  sphere{ 0,R,S scale <1.65,3/2,1.5> translate <0.75, 0,0> }
  sphere{ 0,R,S scale <1.65,3/2,1.55> translate <0,    0,0> }
  sphere{ 0,R,S scale <1.65,3/2,1.5> translate <-0.75,0,0> }
  sphere{ 0,R,S scale <1.6,3/2,1.4> translate <-1.5, 0,0> }*/
  
  //trims bottom of shirt
  sphere{ 0,R,-S*10 scale <2,1,1.75> translate <0,-1,-0.25> }
  sphere{ 0,R,-S*10 scale <2,0.5,5> rotate x*10 translate <0,1.5,-0.25> }
  sphere{ 0,R,-S*10 scale <1,0.5,5> rotate z*-20 rotate x*10 translate <2.25,1.5,-0.25> }
  sphere{ 0,R,-S*10 scale <1,0.5,5> rotate z*20 rotate x*10 translate <-2.25,1.5,-0.25> }
  
  //collar
  sphere{ 0,R,S scale <2,1,1.5> translate <0,8.25,0.25> }
  sphere{ 0,R,-S*5 scale <1.25,2,1> translate <0,11.25,0.25> }
  
  texture{ Blue_Shirt_Texture }
}
#declare Right_Arm =
blob{
  threshold T
  //upper arm
  sphere{ 0,R,S scale <1.75,6.5,1.75>/2 translate <0,-6.5,0>/2 rotate z*Right_Arm_Angle translate <1.75,8,0> }
  //elbow
  sphere{ 0,R,S scale <0.75,1,0.75>/2 translate <0,0,-0.125> rotate y*-45 translate <0,-5.5,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
  //forearm
  sphere{ 0,R,S scale <0.5,1.75,0.5> translate <0,-7,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
  //hand
  sphere{ 0,R,S scale <0.25,0.5,0.7> rotate y*-120 translate <0,-9,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
  sphere{ 0,R,S scale <0.25,0.5,0.7> rotate y*-120 translate <0,-9.5,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
  sphere{ 0,R,S scale <0.25,0.5,0.7> rotate y*-120 translate <0,-10,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
/*  //fingers
  sphere{ 0,R,S*4 scale <0.8,0.2,0.80>/2 translate <-0.25,-0.00,-0.25> rotate x*45 rotate y*-120 translate <0,-9.5,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
  sphere{ 0,R,S*4 scale <0.8,0.2,0.75>/2 translate <-0.25,-0.25,-0.15> rotate x*45 rotate y*-120 translate <0,-9.5,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
  sphere{ 0,R,S*4 scale <0.8,0.2,0.70>/2 translate <-0.25,-0.50,-0.05> rotate x*45 rotate y*-120 translate <0,-9.5,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
  sphere{ 0,R,S*4 scale <0.8,0.2,0.65>/2 translate <-0.25,-0.75,0.15> rotate x*45 rotate y*-120 translate <0,-9.5,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
  //thumb
  sphere{ 0,R,S*4 scale <0.3,0.2,0.65>/2 translate <-0.45,-0.75,-0.05> rotate x*-60 rotate y*-120 translate <0,-9.5,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
  sphere{ 0,R,S*4 scale <0.3,0.2,0.65>/2 translate <-0.35,-0.75,-0.05> rotate x*-60 rotate y*-120 translate <0,-9.5,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
  sphere{ 0,R,S*4 scale <0.3,0.2,0.65>/2 translate <-0.25,-0.75,-0.05> rotate x*-60 rotate y*-120 translate <0,-9.5,0> rotate z*Right_Arm_Angle translate <1.75,8,0> }
  */
  texture{ Skin_Texture }
}
#declare Left_Arm =
blob{
  threshold T
  //upper arm
  sphere{ 0,R,S scale <1.75,6.5,1.75>/2 translate <0,-6.5,0>/2 rotate z*Left_Arm_Angle translate <-1.75,8,0> }
  //elbow
  sphere{ 0,R,S scale <0.75,1,0.75>/2 translate <0,0,-0.125> rotate y*0 translate <0,-5.5,0> rotate z*Left_Arm_Angle translate <-1.75,8,0> }
  //forearm
  sphere{ 0,R,S scale <0.5,1.75,0.5> translate <0,-7,0> rotate z*Left_Arm_Angle translate <-1.75,8,0> }
//  sphere{ 0,R,S scale <0.5,2.75,0.5> translate <0,-2.75,0> rotate x*-35 rotate y*30 translate <0,-5.25,0> rotate z*Left_Arm_Angle translate <-1.75,8,0> }
  //hand
  sphere{ 0,R,S scale <0.25,0.5,0.7> rotate y*-120 translate <0,-9,0> rotate z*Left_Arm_Angle translate <-1.75,8,0> }
  sphere{ 0,R,S scale <0.25,0.5,0.7> rotate y*-120 translate <0,-9.5,0> rotate z*Left_Arm_Angle translate <-1.75,8,0> }
  sphere{ 0,R,S scale <0.25,0.5,0.7> rotate y*-120 translate <0,-10,0> rotate z*Left_Arm_Angle translate <-1.75,8,0> }
  
  texture{ Skin_Texture }
}
#declare Head =
blob{
  threshold T
  //neck
  sphere{ 0,R,S*10 scale <0.75,2,0.75> translate <0,9,0.5> }
  
  //back of skull
  sphere{ 0,R,S scale 2.25 translate <0,11.75,0.5> }
  
  //chin
  sphere{ 0,R,S/2 scale 1 translate <0,11,1.5> }
  sphere{ 0,R,S/2 scale 0.75 translate <0,10.75,2> }
  
  //ears
  sphere{ 0,R,S scale <0.15,1/3,1/4> rotate z*-15 translate <2.4,11.5,0.5> }
  sphere{ 0,R,S scale <0.15,1/3,1/4> rotate z*15 translate <-2.4,11.5,0.5> }
  
  texture{ Skin_Texture }
}
#declare Hair =
union{
  blob{
    threshold T
    //back of head
    sphere{ 0,R,S scale <2.25,2.5,2.25> translate <0,12.5,-0.5> }
    sphere{ 0,R,S scale 1.75 translate <0,13,1> }
    
    //cuts back of hair
    sphere{ 0,R,-S*15 scale 2.25 translate <0,8,3> }
    sphere{ 0,R,-S*15 scale 2.25 translate <0,7,1> }
    
    //cuts hole for ear
    sphere{ 0,R,-S*15 scale <5,3/4,1/3> translate <0,10.625,0.5> }
  }
  #declare N = 5;
  #declare C = 0;
  #while (C < N)
    difference{
      torus{ 0.9,0.065 rotate z*90 }
      box{ <0.125,1.25,0.125>,<-0.125,-1.25,-1.25> }
      box{ <0.125,0,1.25>,<-0.125,-1.25,-1.25> }
      translate <0,0,-0.9>
      scale <1,0.7+0.6*rand(Q),0.75+0.25*rand(Q)>
      rotate y*(360*C/N+20-10*rand(Q))
      translate <0,2.25,0>
      rotate x*-20
      translate <0,12.25,-0.5>
    }
    #declare C = C+1;
  #end
  texture{ Hair_Texture }
}
/******************************************/
#declare Child =
union{
  object{ Shorts }
  object{ Leg translate <1.25,0,0> }
  object{ Leg translate <-1.25,0,0> }
  object{ Sock translate <1.25,0,0> }
  object{ Sock translate <-1.25,0,0> }
  object{ Shoe translate <1.25,0,0> }
  object{ Shoe translate <-1.25,0,0> }
  object{ White_Shirt translate <0,1,0> }
  object{ Blue_Shirt translate <0,1,0> }
  object{ Right_Arm }
  object{ Left_Arm }
  object{ Head }
  object{ Hair }
}