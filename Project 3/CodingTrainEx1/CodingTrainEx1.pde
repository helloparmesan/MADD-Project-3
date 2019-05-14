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
//LiveInput in;
AudioInput in;
AudioOutput out;
FFT fft;
FFT fftLin;
FFT fftLog;

float min_dist = 5;
float max_dist = 200;

void setup() {
  //Create canvas and set framerate
  size(600, 600, P3D);
 
//Start capturing Audio
    minim = new Minim(this);
    in = minim.getLineIn();
    /*
 // Create the Input stream
    out = minim.getLineOut();
  
  // we ask for an input with the same audio properties as the output.
  AudioStream inputStream = minim.getInputStream( out.getFormat().getChannels(), 
                                                  out.bufferSize(), 
                                                  out.sampleRate(), 
                                                  out.getFormat().getSampleSizeInBits());
                                                 
  // construct a LiveInput by giving it an InputStream from minim.                                                  
  in = new LiveInput( inputStream );
  
  // create granulate UGen so we can hear the input being modfied before it goes to the output
  Delay myDelay = new Delay(0.25,0.5,false,false);
  
  // patch the input through the grain effect to the output
  in.patch(myDelay).patch(out);
  */
 
// Develop 3-D Space
  cam = new PeasyCam(this, 700);
  //cam.rotateY(random(radians(90)));
  //cam.rotateZ(random(radians(90)));
  tree = new Tree();
   // Using the default capture device
}


void draw() {
  background(51);
  cam.rotateY(radians(1));
  if (in.mix.level() < 0.01) {
    tree.grow();
  } else {
    tree.shrink();
  }
  tree.show();

}
void mouseClicked() {
  tree = new Tree();
  }
    
 
