float zoom = 0.0;

void setup() {
  size(640, 400, P3D);
}

void draw() {
  background(0);
  lights();
  camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180) + zoom, width/2, height/2, 0, 0, 1, 0);
  translate(width/2, height/2);
  stroke(255);
  fill(160, 230, 150);
  box(100);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e>0) zoom += 20;
  else if (e<0) zoom -= 20;
}
