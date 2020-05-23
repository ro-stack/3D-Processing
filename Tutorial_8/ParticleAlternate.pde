// For this to work I added ArrayList<Particle> particles; to the beginning of the main class
// Then particles = new ArrayList<Particle>(); within setup()
/* And this within draw 
  pushMatrix(); 
  // translate z point 
  translate(0, 0, -90);

  for (int i = 0; i < 10; i++) {
    Particle p = new Particle();
    particles.add(p);
  }
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    p.show();
    if (p.finished()) {
      particles.remove(i);
    }
  }
  popMatrix();
  */
// This way however didn't use acceleration,position or velocity
// I used the code from tutorial

/*class Particle {
  float x;
  float y;
  float vx;
  float vy;
  float life;


  Particle() {
    x = 100;  // changed these values so in right position
    y = 360; 
    vx = random(-5, -1);
    vy = random(-1, 1);
    life = 255;
  }

  boolean finished() {
    return life < 0;
  }

  void update() {
    x += vx;
    y += vy;
    life -= 5;
  }

  /*void show() {
    noStroke(); 
    fill(255, life);
    pushMatrix();
    translate(this.x, this.y);
    sphere(8);
    popMatrix();
  }
}*/
