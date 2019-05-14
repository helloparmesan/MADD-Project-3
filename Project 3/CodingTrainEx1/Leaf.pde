// Coding Rainbow
// Daniel Shiffman
// http://patreon.com/codingtrain
// Code for: https://youtu.be/JcopTKXt8L8

class Leaf {
  PVector pos;
  boolean reached = false;

  Leaf() {
    pos = PVector.random3D();
    pos.mult(random(width/2));
    pos.y -= height/4;
  }

  void reached() {
    reached = true;
  }

  void show() {
    float p = 0;
    
  for ( int i = 0; i < in.bufferSize(); i++ ) {
    p += abs( in.mix.get( i ) ) * 1;
    float m = map(p, 0, in.bufferSize(), 1, 255);
    fill(255*sqrt(m), 255/sqrt(m), 255/sqrt(m));
  }
  
    
    stroke(50,50,200);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    //sphere(4);
    float v = map(p, 0, in.bufferSize(), 0, 200);
    ellipse(0,0, sqrt(10*v), sqrt(4*v));
    popMatrix();
  }
}
