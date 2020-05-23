PImage img;

void setup(){
  size(626,366,P3D);
  img = loadImage("nature.jpg");
  smooth(8);
}
 
void draw(){
 
  noStroke();
  background(img);
 

  //spotLight(255, 0, 0, 0, height/2, 400, 1, 0, -1, PI, 32);
  //spotLight(0, 0, 255, width, height/2, 400, -1, 0, -1, PI/16.0, 32);


  //pointLight(255, 0, 0, mouseX, mouseY, 64);
  //pointLight(0, 0, 255, width - mouseX, height - mouseY, 64);
 
  
  //ambientLight(128, 128, 128);
  
  directionalLight(128,128,128, mouseX, mouseY, -1);
 
  pushMatrix();
    translate(width * 0.5, height * 0.5, 0);
    sphere(width * 0.2);
  popMatrix();

}
