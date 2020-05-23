PShape wheel1, wheel2, wheel3, wheel4; 
PShape top, bottom;
PShape exhaust;

ParticleSystem ps;
int i = 0;
PVector acceleration, position, velocity;

void setup() {
  size(400, 400, P3D);
  wheel1 = createCylinderShape(30, 50, 30);
  wheel2 = createCylinderShape(30, 50, 30);
  wheel3 = createCylinderShape(30, 50, 30);
  wheel4 = createCylinderShape(30, 50, 30); 
  top = createShape(BOX, 170, 70, 80);
  bottom = createShape(BOX, 340, 80, 160);

  exhaust = createCylinderShape(15, 10, 30); // Create exhaust
  exhaust.rotateY(30); // Rotate it to match car position

  acceleration = new PVector(0.05, 0, 0);
  position = new PVector(100, 100, 0); 
  velocity = new PVector(2, 0, 0);
  ps = new ParticleSystem(new PVector(position.x, position.y)); // Used position x,y 
}


void draw() {
  rotateY(radians(40)); 
  translate(-200, 0, -20); 
  background(240, 170, 170);
  //translate(frameCount*2, 0, 0); 
  velocity.add(acceleration);
  position.add(velocity);

  pushMatrix();
  wheel1.rotate(frameCount*2, 0.0, 0.0, 1.0);
  shape(wheel1, position.x+100, position.y+300);
  popMatrix();

  pushMatrix();
  wheel2.rotate(frameCount*2, 0.0, 0.0, 1.0);
  shape(wheel2, position.x+300, position.y+300);
  popMatrix();

  pushMatrix();
  translate(0, 0, -200);
  wheel3.rotate(frameCount*2, 0.0, 0.0, 1.0);
  shape(wheel3, position.x+100, position.y+300);
  popMatrix();

  pushMatrix();
  translate(0, 0, -200);
  wheel4.rotate(frameCount*2, 0.0, 0.0, 1.0);
  shape(wheel4, position.x+300, position.y+300);
  popMatrix();

  //bottom
  pushMatrix(); 
  fill(45, 60, 160);
  stroke(255);
  translate(0, 0, -100); 
  shape(bottom, position.x+200, position.y+260); 
  bottom.disableStyle(); 
  popMatrix();

  //top
  pushMatrix(); 
  fill(90, 115, 250);
  translate(0, 0, -80);
  shape(top, position.x+190, position.y+190);
  popMatrix();

  pushMatrix();
  translate(0, 0, -90);
  exhaust.disableStyle();
  shape(exhaust, position.x+20, position.y+260); // Creates exhaust
  popMatrix();

  pushMatrix(); 
  translate(position.x-100, position.y+160, -90); // Set position
  ps.addParticle(); // Add functions
  ps.run();
  popMatrix();
}




// Creates wheel/cylinder as a PShape
PShape createCylinderShape(int sides, float radius, float height) { 

  PShape wheel = createShape(GROUP);

  float angle = 360 / sides;
  float halfHeight = height / 2;

  // draw top of the tube
  PShape top = createShape();
  fill(45, 60, 160);
  stroke(255);
  top.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= sides; i++) {
    float x = cos( radians( i * angle ) ) * radius;
    float y = sin( radians( i * angle ) ) * radius;
    top.vertex( x, y, -halfHeight);
    top.vertex(0, 0, -halfHeight);
  }
  top.endShape();

  // draw bottom of the tube
  PShape bottom = createShape();
  fill(90, 115, 250);
  bottom.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= sides; i++) {
    float x = cos( radians( i * angle ) ) * radius;
    float y = sin( radians( i * angle ) ) * radius;
    bottom.vertex( x, y, halfHeight);
    bottom.vertex(0, 0, halfHeight);
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
