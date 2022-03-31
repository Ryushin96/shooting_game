float[] xballX = new float[life];
float[] xballY = new float[life];
float[] xballVX = new float[life];
float[] xballVY = new float[life];
float[] xballRadius = new float[life];
float[] xpballX = new float[life];
float[] xpballY = new float[life];
boolean[] xballFlag = new boolean[life];




void arrangexball(){
  int i = 0;
  while ( i < life ) {
    eballFlag[i] = false;
    i++;
  }
}


void movexball(){
    int i = 0;
  while ( i < life ) {
  xpballX[i] = xballX[i];
  xpballY[i] = xballY[i];
  xballX[i] = xballX[i] + eballVX[i];
  xballY[i] = xballY[i] + eballVY[i];

  if(xballX[i] > width || xballX[i] < 0){
    xballVX[i] = -xballVX[i];
  }
  if(xballY[i] > height || xballY[i] < 0){
    xballVY[i] = -xballVY[i];
  }
    
  xballHitBar(i);
  xballHitBlock(i);
  //eballHitBall(i);
      i++;
  }
  
}

void makexball(){
//////////////////////////////////////////////////マウスクリック
if(mousePressed == true){
  if(life > 0){
  xballFlag[life-1] = true;
  xballX[life-1] = (barX + barWidth)/2;
  xballY[life-1] = barY;
  xballVX[life-1] = sqrt(ballVX*ballVY/((mouseX - xballX[life-1])*(mouseX - xballX[life-1])+(mouseY - xballY[life-1])*(mouseY - xballY[life-1]))) * (mouseX - xballX[life-1]);
  xballVY[life-1] = sqrt(ballVX*ballVY/((mouseX - xballX[life-1])*(mouseX - xballX[life-1])+(mouseY - xballY[life-1])*(mouseY - xballY[life-1]))) * (mouseY - xballY[life-1]);
  life = life - 1;
  }
}


}



void xballHitBar(int i){

    if(xballFlag[i] == true){
        if (!((xballX[i] > barX) && (xballX[i] < barX + barWidth) && (xballY[i] > barY) && (xballY[i] < barY + barHeight))) {
      return;
    }
    if(xpballX[i] > barX && xpballX[i] < barX + barWidth) {
      xballVY[i] = -xballVY[i];
        if(c == 1) {
          life = life - 1;
          c = time;
        }
      return;
    }
    if (xpballY[i] > barY && xpballY[i] < barY + barHeight){
      xballVX[i] = -xballVX[i];
     
               if(d == 1) {
          life = life - 1;
          d = time;
        }
      return;
    }
          xballVX[i] = -xballVX[i];
          xballVY[i] = -xballVY[i];
    }
    
  }





void xballHitBlock(int k){
          if(xballFlag[k]==true){
      for ( int i = 0; i < life; i++ ) {
    if  ( blockHitFlag[i] == false ) {
      if ((xballX[k] > blockX[i] && xballX[k] < blockX[i] + blockWidth[i] && xballY[k] > blockY[i] && xballY[k] < blockY[i] + blockHeight[i])) {
        if ( xpballX[k] > blockX[i] && xpballX[k] < blockX[i] + blockHeight[i] ) {
          xballVY[k] = -xballVY[k];
          return;
        }
        if ( xpballY[k] > blockY[i] && xpballY[k] < blockY[i] + blockHeight[i] ) {
          xballVX[k] = -xballVX[k];     
          return;
        }
      }
      }
    }
        }
        }


  
  





void xdraweball(){
    int i = 0;
  while ( i < life ) {
    if(xballFlag[i] == true){
      xballRadius[i] = 20.0f;
      fill(0,255,0);
      ellipse(xballX[i],xballY[i],xballRadius[i]*2,xballRadius[i]*2);
    }
    i++; 
  }
}
