





///////////////////ライブラリを追加しています。動画再生のライブラリです。→video | GStreamer-based video liblary fo Processing




void setup(){
  size(1000, 1200);
  setupOther();
  arrangeBlocks();
  arrangeeball();
  arrangexball();
  Movie1 = new Movie(this,"movie1.mp4");
  Movie1.play();
  Movie1.loop();

}
void draw(){
  if(scene ==0){
    image(Movie1, 0, 0);
    menu();
    bgm2.play();
    
  }
  
  
  
  if(scene == 1){
  bgm2.pause();
  bgm1.play();
  background(255);
  moveBack();
  time = millis();



  if(time > c+500) c = 1;
  if(time > d+500) d = 1;


  


  moveBlocks(time);
  
  


  /*ボールの動き*/
  moveball();
  drawball();
  //追加ボール
  //makexball();
  //movexball();
  //xdraweball();
  
  //敵ボール
  moveeball();
  vanisheball(time);
  draweball();

  /*バーの動き*/
  movebar();
  drawbar();
  drawBlocks();
  
  fill(0,255,255);
  text("TIME : "+time/1000,0,100);
  fill(255,0,70);
  text("LIFE : "+life,0,300);
  
  ////クリア
if(blocks == 0) scene =2;
  ////オーバー
  if(life == 0) scene = 3;
  
  }
  
  if(scene ==2){
      bgm1.pause();
      se3.trigger();
      background(255);
  text("GAME CLEAR !!!!",310,570);

    
  }
  
  if(scene == 3){
      bgm1.pause();
      //se4.trigger();
      background(255);
  text("GAME OVER !!!!",310,570);

    
    
    
  }
  
}

void movieEvent(Movie m) {
  m.read();
}
