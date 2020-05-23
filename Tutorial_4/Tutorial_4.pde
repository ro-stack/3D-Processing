void setup(){
  size(900, 600, P3D);
}

void draw(){
  // Used camera to check different angles of geometry
  background(0);
  translate(width/2, height/2); // centre the geometry
  stroke(255); 
  rotateY(radians(frameCount*2)); // Rotates the barn around Y-axis
  
  // FRONT 
  pushMatrix();
  beginShape();
  fill(0,255,0); // GREEN
  vertex(-100, -100, 0);  // A
  vertex(0, -150, 0); //  // B
  vertex( 100, -100, 0);  // C
  vertex( 100,  100, 0);  // D
  vertex( 40,  100, 0);   // E
  vertex( 40,  -40, 0);   // F 
  vertex( -40,  -40, 0);  // G  
  vertex( -40,  100, 0);  // H
  vertex(-100,  100, 0);  // I 
  endShape(CLOSE); 
  
  // BACK 
  beginShape();
  fill(255,0,0); // RED
  vertex(-100, -100, -200);  // A
  vertex(0, -150, -200); //  // B
  vertex( 100, -100, -200);  // C
  vertex( 100,  100, -200);  // D
  vertex(-100,  100, -200);  // I 
  endShape(CLOSE);
  
  // BASE 
  beginShape();
  fill(0,255,255); // CYAN
  vertex( 100,  100, 0);     // A
  vertex(-100,  100, 0);     // B 
  vertex(-100,  100, -200);  // C 
  vertex( 100,  100, -200);  // D
  endShape(CLOSE);
  popMatrix();
  
  // SIDES
  pushMatrix();
  beginShape();
  fill(255,255,0); // YELLOW
  vertex(-100, -100, 0);  // A
  vertex(-100,  100, 0);  // I 
  vertex(-100,  100, -200);  // I 
  vertex(-100, -100, -200);  // A
  endShape(CLOSE);
  beginShape();
  translate(200,0,0);
  vertex(-100, -100, 0);  // A
  vertex(-100,  100, 0);  // I 
  vertex(-100,  100, -200);  // I 
  vertex(-100, -100, -200);  // A
  endShape(CLOSE);
  popMatrix();
  
  // ROOFS
  pushMatrix();
  beginShape();
  fill(200,0,200); // PURPLE
  vertex(-100, -100, 0);  // A
  vertex(0, -150, 0); //  // B
  vertex(0, -150, -200); //  // B
  vertex(-100, -100, -200);  // A
  endShape(CLOSE);
  beginShape();
  vertex(0, -150, 0); //  // B
  vertex( 100, -100, 0);  // C
  vertex( 100, -100, -200);  // C
  vertex(0, -150, -200); //  // B
  endShape(CLOSE);
  popMatrix();
}
