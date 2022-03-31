float ballX =200.0f;
float ballY =700.0f;
float ballVX =5.0f;
float ballVY =5.0f;
float ballRadius =20.0f;
float pballX;
float pballY;
int phit;

void moveball(){
  pballX = ballX;
  pballY = ballY;
  ballX = ballX + ballVX;
  ballY = ballY + ballVY;

  if(ballX > width || ballX < 0){
    ballVX = -ballVX;
  }
  if(ballY > height || ballY < 0){
    ballVY = -ballVY;
  }
    ballHitBar();
  

  

  ballHitBlock();
  
  
}

void ballHitBar(){
    if (!((ballX > barX) && (ballX < barX + barWidth) && (ballY > barY) && (ballY < barY + barHeight))) {
      return;
    }
    if(pballX > barX && pballX < barX + barWidth) {
      ballVY = -ballVY;
    //if (pballY > (barY+barHeight)/2) ballY = barY+barHeight+2;
    //else ballY = barY-2;
     se2.trigger();
      return;
    }
    if (pballY > barY && pballY < barY + barHeight){
      ballVX = -ballVX;
    //if (pballX > (barX+barWidth)/2) ballX = barX+barWidth+2;
    //else ballX = barX-2;
    se2.trigger();
      
      return;
    }
          //ballVX = -ballVX;
          //ballVY = -ballVY;
          
          
    
}

void ballHitBlock(){
  
      for ( int i = 0; i < MAX_BLOCKS; i++ ) {
    if  ( blockHitFlag[i] == false ) {
      if ((ballX > blockX[i] && ballX < blockX[i] + blockWidth[i] && ballY > blockY[i] && ballY < blockY[i] + blockHeight[i])) {
        if ( pballX > blockX[i] && pballX < blockX[i] + blockHeight[i] ) {
          ballVY = -ballVY;     
          blockHitFlag[i] = true;
          eballFlag[i] = true;
          eballX[i] = ballX;
          eballY[i] = ballY;
          eballVX[i]= -ballVX;
          eballVY[i] = ballVY;
          blocks = blocks -1 ;
          se2.trigger();
          return;
        }
        if ( pballY > blockY[i] && pballY < blockY[i] + blockHeight[i] ) {
          ballVX = -ballVX;     
          blockHitFlag[i] = true;
          eballFlag[i] = true;
          eballX[i] = ballX;
          eballY[i] = ballY;
          eballVX[i]= ballVX;
          eballVY[i] = -ballVY;
          blocks = blocks -1 ;
          se2.trigger();
          return;
        }
      }
      }
    }
 
  
  
}

void drawball(){
    fill(255,0,0);
    ellipse(ballX,ballY,ballRadius*2,ballRadius*2);
}
