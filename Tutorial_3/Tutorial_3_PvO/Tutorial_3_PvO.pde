PImage img;

void setup() {
  size(626, 366, P3D);
  img = loadImage("nature.jpg");
}

void draw() {  
  fill(70, 70, 70);
  stroke(10, 200, 10);
  background(img);
  camera(50.0, 50.0, 120.0, 50.0, 50.0, 0.0, 0.0, 1.0, 0.0);
  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  if (mousePressed == true) {
    perspective(fov, float(width)/float(height), 
      cameraZ/10.0, cameraZ*10.0);
  } else {
    ortho(-width/6, width/6, -height/6, height/6); // Same as ortho()
  }
  translate(50, 50, 0);
  rotateX(-PI/6);
  rotateY(PI/3);
  box(45);
}
