import processing.video.*;
Movie Movie1;



void menu(){
      fill(0,255,255);
      rect(200, 500, 200, 100);
      fill(255,0,0);
      rect(600, 500, 200, 100);
      fill(0);
      textSize(50);
      text("START",210,570);
      text("EXIT",650,570);
      if(mousePressed){
        if(mouseX > 200 && mouseX < 400 && mouseY > 500 && mouseY <600) scene = 1;
        if(mouseX > 600 && mouseX < 800 && mouseY > 500 && mouseY <600) exit();
      }


}
