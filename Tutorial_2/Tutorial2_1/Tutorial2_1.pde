float i, j;
void setup() {
  size(400, 400);
}

void draw() {
  frameRate(5);
  background(255, 100, 100);
  fill(random(255), random(255), random(255)); 
  i = random(400);
  j = random(400);
  rect(i, j, 100, 100, 2);
}

// Simpler way:
// Or remove the float j;
// Delete both the i and j within draw.
// Set i as the first two parameters for rect();
// Add i++; after rect to increment the value.
// Like below: 

/*
float i;
 void setup() {
  size(400, 400);
}

void draw() {
  frameRate(5);
  background(255, 100, 100);
  fill(random(255), random(255), random(255)); 
  rect(i, i, 100, 100, 2);
  i++;
}*/
