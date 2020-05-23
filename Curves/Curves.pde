void setup() {
  size(1236, 800);
}
void draw() {
  background(85, 230, 200);
  noFill();
  stroke(190,85,230);
  strokeWeight(10);
  bezier(400, -10, 1000, 100, 900, 650, 700, 800);
  float t =  (frameCount/200.0)%1;
  float x = bezierPoint(400, 1000, 900, 700, t);
  float y = bezierPoint( -10, 100, 650, 800, t);
  fill(245, 140, 100);
  ellipse(x, y, 35, 35);                           // create ellipse with x,y coord
}
