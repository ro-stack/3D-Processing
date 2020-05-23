void setup()  {
  size(640, 600, P3D);
}

void draw()  {
  background(0);
  lights();

  if ((keyPressed == true) && (key == 'x')) {
    camera(0, 200, 150, width/2, height/2, 0, 0,1,0);
  } 

  else if ((keyPressed == true) && (key == 'y')) {
    camera(30, 150, 0, width/2, height/2, 0, 0,1,0);
  }
  else if ((keyPressed == true) && (key == 'z')) {
    camera(150, 0, 200, width/2, height/2, 0, 0,1,0);
  }

  translate(width/2, height/2, 0);
  stroke(255);
  fill(20,40,255);
  box(90); 
  //saveFrame("frame/t_####.png");
}
