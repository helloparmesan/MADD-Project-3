import peasy.*;


Tree tree;
PeasyCam cam;

 float min_dist = 5;
 float max_dist = 200;

void setup() {
  //Create canvas and set framerate
  size(1280, 720, P3D);
  frameRate(10);
 

 
// Develop 3-D Space
  cam = new PeasyCam(this, 500);
  cam.rotateY(random(radians(90)));
  cam.rotateZ(random(radians(-90)));
  tree = new Tree();
   // Using the default capture device
}


void draw() {
  background(51);
   cam.rotateY(radians(1));
  tree.show();
  tree.grow();

}
void mouseClicked() {
       setup();
  }
    
