PShape wheel1, wheel2, wheel3, wheel4; // Create PShape wheels
PShape top, bottom; // Create PShape body parts

void setup(){
 size(400,400,P3D);
 // Call createCylinderShape() and make 4 wheels with sizes
 wheel1 = createCylinderShape(30,50,30);
 wheel2 = createCylinderShape(30,50,30);
 wheel3 = createCylinderShape(30,50,30);
 wheel4 = createCylinderShape(30,50,30); 
 top = createShape(BOX, 170, 70, 80); // use createShape() to make top part
 bottom = createShape(BOX, 340, 80, 160); // same again but larger for bottom
}


void draw(){
  rotateY(radians(40)); // Angle of car
  translate(-200, 0, -20); // Start position
  background(240,170,170);
  translate(frameCount*4, 0, 0); // Speed car moves at
  
  // Create 4 wheels
  pushMatrix();
  wheel1.rotate(frameCount*2, 0.0, 0.0, 1.0); // Speed wheel moves
  shape(wheel1, 200, 400); // Create wheel and set position
  popMatrix();
  
  pushMatrix();
  wheel2.rotate(frameCount*2, 0.0, 0.0, 1.0); // Speed wheel moves
  shape(wheel2, 400, 400); // Create wheel and set position
  popMatrix();
  
  pushMatrix();
  translate(0, 0, -200); // Move wheels Z position
  wheel3.rotate(frameCount*2, 0.0, 0.0, 1.0); // Speed wheel moves
  shape(wheel3, 200, 400); // Create wheel and set position
  popMatrix();
  
  pushMatrix();
  translate(0, 0, -200); // Move wheels Z position
  wheel4.rotate(frameCount*2, 0.0, 0.0, 1.0); // Speed wheel moves
  shape(wheel4, 400, 400); // Create wheel and set position
  popMatrix();
  
  //Bottom
  pushMatrix(); 
  fill(45,60,160);
  translate(300, 360, -100); // Set position
  shape(bottom); // Create bottom
  bottom.disableStyle(); // Removes fill problem
  popMatrix();
  
  //Top
  pushMatrix(); 
  fill(90,115,250);
  translate(290, 290, -80); // Set position
  shape(top); // Create top 
  popMatrix();
  
}

// TALK ABOUT THIS !!!! 
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
