class ParticleSystem {
  ArrayList<Particle> particles;
  //origin of the emitter
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    for (int i = 0; i < 5; i++) {
    particles.add(new Particle(origin)); // added for loop here for more particles
    }                                    // but made it too slow 
  }

  void run() {
   
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}


// A simple Particle class
class Particle {
  //shape that makes the particle
  PShape s;  
  //give a lifespan to each particle
  float lifespan;
  //particle position, velocity and acceleration
  PVector position;
  PVector velocity;
  PVector acceleration;

 
  Particle(PVector pos) {
    s = createShape(SPHERE,4); // Made into sphere
    s.disableStyle();
    lifespan = 255.0;
    position = pos.copy();
    velocity = new PVector(random(-5, -1), random(-1,1)); // Changed angle of particles
    acceleration = new PVector(-0.005, -0.01);  // Changed speed
  }

  void run() {
    display();
    update();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 5.0;
  }

  // Method to display
  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    shape(s, position.x, position.y);
  }

  // Check if particle still alive
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
