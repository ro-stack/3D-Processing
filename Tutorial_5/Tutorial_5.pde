PImage bg; // Create variable for Image
float rotation = 0; // Rotation speed variable

void setup() {
  size(626, 438, P3D);
  lights();
  bg = loadImage("stars.jpg"); // Load image
  translate(width/2, height/2);
  fill(255, 200, 50);
  noStroke();
  sphere(75); // Create Sun centre
  // Use for loop to create 10 triangles/spikes around the Sun
  pushMatrix();
  fill(255,255,50);
  for(int i = 0; i < 10; i++){
   rotate(PI/5);
   triangle(-60, 0, 0, 120, 60, 0);  
  }
  popMatrix();  

}

void draw() {
  background(bg); // Set background as loaded image
  setup(); // Call setup() so Sun is static
  // Create large planet
  pushMatrix();
  rotateY(rotation);
  translate(170, 0, 0);
  fill(50, 200, 255); // blue
  noStroke();
  sphere(30);
  // Don't popMatrix() so smaller planet rotates around it
  // Create smaller planet around larger planet.
  pushMatrix();
  rotateY(-rotation);
  rotateZ(rotation); // Orbits around larger planet
  translate(0, 50, 0);
  fill(255);
  noStroke();
  sphere(5);  
  popMatrix();
  
  popMatrix(); // pops small one 
  
  // Medium planet
  pushMatrix();
  rotateY(rotation-40); // Little bit slower
  translate(150, 0, 0);
  fill(240, 150, 140);
  noStroke();
  sphere(20);
  popMatrix();
  
  // Small planet
  pushMatrix();
  rotateY(rotation*1.5); // Makes it quickest planet
  translate(220, 0, 0);
  fill(40, 250, 140);
  noStroke();
  sphere(12);
  popMatrix();
  
  rotation += 0.035; // increase speed 

}
