final int MAX_BLOCKS = 12;

float[] blockX = new float[MAX_BLOCKS];
float[] blockY = new float[MAX_BLOCKS];

float[] blockWidth = new float[MAX_BLOCKS];
float[] blockHeight = new float[MAX_BLOCKS];
boolean[] blockHitFlag = new boolean[MAX_BLOCKS];

//float[] blockVX = new float[MAX_BLOCKS];
//float[] blockVY = new float[MAX_BLOCKS];
float blockVX;
float blockVY;

final int BLOCK_ROWS  =  3;  // ブロックの横一列の個数
final int BLOCK_GAP  =  2;    // ブロックとブロックの間隔
final float BLOCK_WIDTH = 100.0f;
final float BLOCK_HEIGHT = 100.0f;
int blocks = MAX_BLOCKS -3 ;

int time;


void drawBlocks() {
    fill(80,70,70);
  for (int i = 0; i < MAX_BLOCKS; i++ ) {
    if ( blockHitFlag[i]  ==  false ) {
      rect(blockX[i], blockY[i], blockWidth[i], blockHeight[i]);
    }
  }
}


void arrangeBlocks() {
  int i = 0;
  while ( i < MAX_BLOCKS ) {
    blockWidth[i] = BLOCK_WIDTH ;
    blockHeight[i] = BLOCK_HEIGHT;
    blockHitFlag[i] = false;
    blockX[i] = 100+BLOCK_GAP + i % BLOCK_ROWS * (blockWidth[i] + BLOCK_GAP);
    blockY[i] = 100+BLOCK_GAP + i / BLOCK_ROWS * (blockHeight[i] + BLOCK_GAP);
    i++;
  }
    blockHitFlag[1] = true;
    blockHitFlag[9] = true;
    blockHitFlag[11] = true;
  
  
}

void rearrangeBlocksX(int m) {
  int i = 0;
  int k = m % BLOCK_ROWS;
  if(blockX[m] < width/2){
  while ( i < MAX_BLOCKS ) {
    blockWidth[i] = BLOCK_WIDTH ;
    blockHeight[i] = BLOCK_HEIGHT ;
    blockX[i] = BLOCK_GAP + i % BLOCK_ROWS * (blockWidth[i] + BLOCK_GAP) - k*(2 * BLOCK_GAP + blockWidth[i]);
    i++;
  }
    blockVX = random(0.0f,3.0f);
    blockVY = random(-3.0f,3.0f);
  }else{
    while ( i < MAX_BLOCKS ) {
    blockWidth[i] = BLOCK_WIDTH ;
    blockHeight[i] = BLOCK_HEIGHT ;
    blockX[i] = BLOCK_GAP + i % BLOCK_ROWS * (blockWidth[i] + BLOCK_GAP) - (k+1)*(2 * BLOCK_GAP + blockWidth[i]) + width;
    i++;
    
  }
    blockVX = random(-5.0f,0.0f);
    blockVY = random(-3.0f,3.0f);
  }
  
    blockVX = random(-3.0f,3.0f);
    blockVY = random(-3.0f,3.0f);
}
void rearrangeBlocksY(int m) {
  int i = 0;
  int k = m / BLOCK_ROWS;
  
  if(blockY[m] < height/4){
  while ( i < MAX_BLOCKS ) {
    blockWidth[i] = BLOCK_WIDTH ;
    blockHeight[i] = BLOCK_HEIGHT ;
    blockY[i] = BLOCK_GAP + i / BLOCK_ROWS * (blockHeight[i] + BLOCK_GAP) - k*(2 * BLOCK_GAP + blockHeight[i]);
    i++;

  }
    blockVX = random(-3.0f,3.0f);
    blockVY = random(0.0f,5.0f);
  }
  else{
    while ( i < MAX_BLOCKS ) {
    blockWidth[i] = BLOCK_WIDTH ;
    blockHeight[i] = BLOCK_HEIGHT ;
    blockY[i] = BLOCK_GAP + i / BLOCK_ROWS * (blockHeight[i] + BLOCK_GAP) - (k+1)*(2 * BLOCK_GAP + blockHeight[i]) + height/2;
    i++;
    

  }
    blockVX = random(-3.0f,3.0f);
    blockVY = random(-5.0f,0.0f);
  }

}
  
void moveBlocks(int t){
    int i = 0;
    if(t % 2000 > 1500){
    blockVX = random(-3.0f,3.0f);
    blockVY = random(-3.0f,3.0f);
    }
    
  while ( i < MAX_BLOCKS ) {
    blockX[i] = blockX[i]+blockVX;
    blockY[i] = blockY[i]+blockVY;
    if(blockHitFlag[i] == false && (blockX[i] < 0 || blockX[i]+blockWidth[i] > width)){
    rearrangeBlocksX(i);
    }
    if(blockHitFlag[i] == false && (blockY[i] < 0 || blockY[i]+blockHeight[i] > height/2)){
    rearrangeBlocksY(i);
    }
    i++;
}
  
}
