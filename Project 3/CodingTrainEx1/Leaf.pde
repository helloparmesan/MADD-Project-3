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
    fill(79,188,62);
    stroke(50,50,200);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    //sphere(4);
    ellipse(0,0, 5, 2);
    popMatrix();
  }
}
