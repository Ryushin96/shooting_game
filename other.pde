PImage back1,back2,plain;
int backX;
int backY1=0;
int backY2=-1200;
int scene = 0;

import ddf.minim.*;
Minim minim;
AudioPlayer bgm1,bgm2;
AudioSample se1,se2,se3,se4;

void  setupOther(){
  back1 = loadImage ("./data/picture/back1.png");
  back1.resize(1000, 1200);
  back2 = loadImage ("./data/picture/back1.png");
  back2.resize(1000, 1200);
  plain = loadImage ("./data/picture/plain.png");
  plain.resize(210, 210);

  
  
  
  minim = new Minim(this);
  bgm2 = minim.loadFile ("./data/bgm/BGM2.mp3");
  bgm1 = minim.loadFile ("./data/bgm/BGM1.mp3");
  se1 = minim.loadSample("./data/bgm/hidan.mp3");
  se2 = minim.loadSample("./data/bgm/kougeki.mp3");
  se3 = minim.loadSample("./data/bgm/gc.wav");
  //se4 = minim.loadSample("./data/bgm/go.wav");

}

void moveBack(){
    image(back1 ,backX,backY1);
    backY1 = backY1+5;
    image(back2, backX,backY2);
    backY2 = backY2+5;
    if(backY1>=height) {
      backY1 = 0;
      backY2 = -1200;
    }

    

}
