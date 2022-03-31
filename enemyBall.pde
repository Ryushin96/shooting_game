float[] eballX = new float[MAX_BLOCKS];
float[] eballY = new float[MAX_BLOCKS];
float[] eballVX = new float[MAX_BLOCKS];
float[] eballVY = new float[MAX_BLOCKS];
float[] eballRadius = new float[MAX_BLOCKS];
float[] epballX = new float[MAX_BLOCKS];
float[] epballY = new float[MAX_BLOCKS];
boolean[] eballFlag = new boolean[MAX_BLOCKS];
int c = 1;
int d = 1;



void arrangeeball(){
  int i = 0;
  while ( i < MAX_BLOCKS ) {
    eballFlag[i] = false;
    i++;
  }
}

void vanisheball(int t){
  if(t % 20000 < 20){
    int i = 0 ;
    while(i < MAX_BLOCKS){
    if(eballFlag[i] == true){
    eballFlag[i] = false;
    break;
    }
    i++;
 
    }
  
  }


}


void moveeball(){
    int i = 0;
  while ( i < MAX_BLOCKS ) {
  epballX[i] = eballX[i];
  epballY[i] = eballY[i];
  eballX[i] = eballX[i] + eballVX[i];
  eballY[i] = eballY[i] + eballVY[i];

  if(eballX[i] > width || eballX[i] < 0){
    eballVX[i] = -eballVX[i];
  }
  if(eballY[i] > height || eballY[i] < 0){
    eballVY[i] = -eballVY[i];
  }
    
  eballHitBar(i);
  eballHitBlock(i);
  //eballHitBall(i);
      i++;
  }
  

  
  
}

//void eballHitBall(int k){
//  float x,x1;
//      for ( int i = 0; i < MAX_BLOCKS; i++ ) {
//        x = (eballX[k]-eballX[i])*(eballX[k]-eballX[i])+(eballX[k]-eballY[i])*(eballX[k]-eballY[i]) ;
//        x1 = (eballX[k]-ballX)*(eballX[k]-ballX)+(eballX[k]-ballY)*(eballX[k]-ballY) ;
//        if (x < eballRadius[k]*eballRadius[k] && x > 50.0f){
//          x = eballVX[k];
//          eballVX[k] = eballVX[i];
//          eballVX[i] = x;
//          x = eballVY[k];
//          eballVY[k] = eballVY[i];
//          eballVY[i] = x;
//      }else return;
//        if (x1 < eballRadius[k]*eballRadius[k]){
//          x = eballVX[k];
//          eballVX[k] = ballVX;
//          ballVX= x;
//          x = eballVY[k];
//          eballVY[k] = ballVY;
//          ballVY = x;
//      }
//      }
  
//}

void eballHitBar(int i){

    if(eballFlag[i] == true){
        if (!((eballX[i] > barX) && (eballX[i] < barX + barWidth) && (eballY[i] > barY) && (eballY[i] < barY + barHeight))) {
      return;
    }
    if(epballX[i] > barX && epballX[i] < barX + barWidth) {
      eballVY[i] = -eballVY[i];
        if(c == 1) {
          life = life - 1;
              se1.trigger();
          c = time;
        }
      return;
    }
    if (epballY[i] > barY && epballY[i] < barY + barHeight){
      eballVX[i] = -eballVX[i];
     
               if(d == 1) {
          life = life - 1;
              se1.trigger();
          d = time;
        }
      return;
    }
          eballVX[i] = -eballVX[i];
          eballVY[i] = -eballVY[i];
    }
    
  }





void eballHitBlock(int k){
          if(eballFlag[k]==true){
      for ( int i = 0; i < MAX_BLOCKS; i++ ) {
    if  ( blockHitFlag[i] == false ) {
      if ((eballX[k] > blockX[i] && eballX[k] < blockX[i] + blockWidth[i] && eballY[k] > blockY[i] && eballY[k] < blockY[i] + blockHeight[i])) {
        if ( epballX[k] > blockX[i] && epballX[k] < blockX[i] + blockHeight[i] ) {
          eballVY[k] = -eballVY[k];
          return;
        }
        if ( epballY[k] > blockY[i] && epballY[k] < blockY[i] + blockHeight[i] ) {
          eballVX[k] = -eballVX[k];     
          return;
        }
      }
      }
    }
        }
        }


  
  





void draweball(){
    int i = 0;
  while ( i < MAX_BLOCKS ) {
    if(eballFlag[i] == true){
      eballRadius[i] = 20.0f;
      fill(0,255,0);
      ellipse(eballX[i],eballY[i],eballRadius[i]*2,eballRadius[i]*2);
    }
    i++; 
  }
}
