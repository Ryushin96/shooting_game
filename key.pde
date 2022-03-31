int right,left,up,down,space;






void keyPressed() {
  if (keyCode == RIGHT) right=1;
  if (keyCode == LEFT)  left=1;
  if (keyCode == UP)    up=1;
  if (keyCode == DOWN)  down=1;
  if (keyCode == ' ')  space=1;
}

void keyReleased() {
  if (keyCode == RIGHT) right=0;
  if (keyCode == LEFT)  left=0;
  if (keyCode == UP)    up=0;
  if (keyCode == DOWN)  down=0;
  if (keyCode == ' ')  space=0;
}
