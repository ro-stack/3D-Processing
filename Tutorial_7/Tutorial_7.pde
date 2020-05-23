PShape wheel1, wheel2, wheel3, wheel4; 
PShape top, bottom;
PVector acceleration, position, velocity; // Create the 3 PVectors

void setup(){
 size(400,400,P3D);
 wheel1 = createCylinderShape(30,50,30);
 wheel2 = createCylinderShape(30,50,30);
 wheel3 = createCylinderShape(30,50,30);
 wheel4 = createCylinderShape(30,50,30); 
 top = createShape(BOX, 170, 70, 80);
 bottom = createShape(BOX, 340, 80, 160);
 
 acceleration = new PVector(2, 0, 0); // Suitable speed along X
 position = new PVector(100, 100, 0); // Simple to change X,Y value
 velocity = new PVector(1, 0, 0); // Suitable velocity to keep car level
}


void draw(){
  rotateY(radians(40)); 
  translate(-200, 0, -20); 
  background(240,170,170);
  velocity.add(acceleration); // Add acceleration to velocity
  position.add(velocity); // Add velocity to position
  
  
  pushMatrix();
  wheel1.rotate(frameCount*2, 0.0, 0.0, 1.0);
  shape(wheel1, position.x+100, position.y+300); // Give x,y the position PVector
  popMatrix();
  
  pushMatrix();
  wheel2.rotate(frameCount*2, 0.0, 0.0, 1.0);
  shape(wheel2, position.x+300, position.y+300); // Give x,y the position PVector
  popMatrix();
  
  pushMatrix();
  translate(0, 0, -200);
  wheel3.rotate(frameCount*2, 0.0, 0.0, 1.0);
  shape(wheel3, position.x+100, position.y+300); // Give x,y the position PVector
  popMatrix();
  
  pushMatrix();
  translate(0, 0, -200);
  wheel4.rotate(frameCount*2, 0.0, 0.0, 1.0);
  shape(wheel4, position.x+300, position.y+300); // Give x,y the position PVector
  popMatrix();
  
  //bottom
  pushMatrix(); 
  fill(45,60,160);
  translate(0, 0, -100); 
  shape(bottom, position.x+200, position.y+260); // Give x,y the position PVector
  bottom.disableStyle();
  popMatrix();
  
  //top
  pushMatrix(); 
  fill(90,115,250);
  translate(0, 0, -80);
  shape(top, position.x+190, position.y+190); // Give x,y the position PVector
  popMatrix();
  
}


// Creates wheel/cylinder as a PShape
PShape createCylinderShape(int sides, float radius, float height) { 
  
  PShape wheel = createShape(GROUP);
 
  float angle = 360 / sides;
  float halfHeight = height / 2;
 
  // draw top of the tube
  PShape top = createShape();
  fill(45,60,160);
  stroke(255);
  top.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= sides; i++) {
    float x = cos( radians( i * angle ) ) * radius;
    float y = sin( radians( i * angle ) ) * radius;
    top.vertex( x, y, -halfHeight);
    top.vertex(0,0,-halfHeight);
  }
  top.endShape();
 
  // draw bottom of the tube
  PShape bottom = createShape();
  fill(90,115,250);
  bottom.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= sides; i++) {
    float x = cos( radians( i * angle ) ) * radius;
    float y = sin( radians( i * angle ) ) * radius;
    bottom.vertex( x, y, halfHeight);
    bottom.vertex(0,0,halfHeight);
  }
  bottom.endShape();
 
 
  // draw sides
  PShape body = createShape();
  body.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x = cos( radians( i * angle ) ) * radius;
    float y = sin( radians( i * angle ) ) * radius;
    body.vertex( x, y, halfHeight);
    body.vertex( x, y, -halfHeight);
  }
  body.endShape(CLOSE);
  
  wheel.addChild(top);
  wheel.addChild(bottom);
  wheel.addChild(body);
 
  return wheel;
}
