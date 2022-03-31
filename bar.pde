float barX = 500.0f;
float barY = 500.0f;
float barVX;
float barVY;
float barWidth = 200.0f;
float barHeight = 200.0f;
int life = 5;




//void movebar(){
//   if (keyPressed){
//  if (keyCode == RIGHT){
//    barX = barX + barVX;
//   }else if ( keyCode == LEFT){
//    barX = barX - barVX;
//   }else if (keyCode == UP){
//    barY = barY - barVY;
//   }else if ( keyCode == DOWN){
//    barY = barY + barVY;
   
//    }
//   }
//}


void movebar(){
      if (space ==1){
      barVX = 20.0f;
      barVY = 20.0f;
    }else{
      barVX = 5.0f;
      barVY = 5.0f;
    }
    if (right == 1)  barX = barX + barVX;
    if (left == 1)   barX = barX - barVX;
    if (up == 1)     barY = barY - barVY;
    if (down == 1)   barY = barY + barVY;


      
}



void drawbar(){
  fill(255,255,255);
   //rect(barX , barY , barWidth , barHeight); 
   //textSize(100);
   //fill(0);
   //text(life,barX+30,barY+150);
   image(plain, barX,barY);
}
