import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import peasy.*;



Tree tree;
//Initialize PeasyCam
PeasyCam cam;
Minim minim;
AudioInput in;
FFT fft;
FFT fftLin;
FFT fftLog;

float min_dist = 5;
 float max_dist = 200;

void setup() {
  //Create canvas and set framerate
  fullScreen(P3D);
  frameRate(24);
 
//Start capturing Audio
    minim = new Minim(this);
    in = minim.getLineIn();
 // Create the Input stream
 
 
 
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
  tree = new Tree();
  }
    
 
