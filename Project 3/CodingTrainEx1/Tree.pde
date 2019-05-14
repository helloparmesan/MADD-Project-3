// Coding Rainbow
// Daniel Shiffman
// http://patreon.com/codingtrain
// Code for: https://youtu.be/JcopTKXt8L8

class Tree {
  ArrayList<Branch> branches = new ArrayList<Branch>();
  ArrayList<Leaf> leaves = new ArrayList<Leaf>();
  float numberReached = 0;

  Tree() {
    for (int i = 0; i < 300; i++) {
      leaves.add(new Leaf());
    }    
    Branch root = new Branch(new PVector(0,height/2), new PVector(0, -1));
    branches.add(root);
    Branch current = new Branch(root);

    while (!closeEnough(current)) {
      Branch trunk = new Branch(current);
      branches.add(trunk);
      current = trunk;
    }
  }

  boolean closeEnough(Branch b) {

    for (Leaf l : leaves) {
      float d = PVector.dist(b.pos, l.pos);
      if (d < max_dist) {
        return true;
      }
    }
    return false;
  }

  void grow() {
    for (Leaf l : leaves) {
      Branch closest = null;
      PVector closestDir = null;
      float record = -1;

      for (Branch b : branches) {
        PVector dir = PVector.sub(l.pos, b.pos);
        float d = dir.mag();
        if (d < min_dist) {
          if (!l.reached) {
            l.reached();
            numberReached++;
          }
          closest = null;
          break;
        } else if (d > max_dist) {
        } else if (closest == null || d < record) {
          closest = b;
          closestDir = dir;
          record = d;
        }
      }
      if (closest != null) {
        closestDir.normalize();
        closest.dir.add(closestDir);
        closest.count++;
      }
    }
    /*
    for (int i = leaves.size()-1; i >= 0; i--) {
      if (leaves.get(i).reached) {
        leaves.remove(i);
      }
    }
    */
    for (int i = branches.size()-1; i >= 0; i--) {
      Branch b = branches.get(i);
      if (b.count > 0) {
        b.dir.div(b.count);
        PVector rand = PVector.random2D();
        rand.setMag(0.04);
        b.dir.add(rand);
        b.dir.normalize();
        Branch newB = new Branch(b);
        branches.add(newB);
        b.reset();
      }
    }
   
  }
  
  void shrink() {
    for (int i = 0; i < branches.size()/20; i++) {
      Branch b = branches.get(branches.size() - 1);
      for (Leaf l : leaves) {
        PVector dir = PVector.sub(l.pos, b.pos);
        float d = dir.mag();
        if (d < min_dist) {
          if (l.reached) {
            l.reached = false;
            numberReached--;
          }
        }
      }
      if (b.parent != null && branches.size() > 45) {
        branches.remove(b);
      }
    }
  }

  void show() {
    for (Leaf l : leaves) {
      if (l.reached) {
        l.show();
      }
    }    
    //for (Branch b : branches) {
    for (int i = 0; i < branches.size(); i++) {
      Branch b = branches.get(i);
      if (b.parent != null) {
        float sw = map(i, 0, branches.size(), 3, 0);
        strokeWeight(sw);
        //Change Branch color to audio
          float p = 0;
          for ( int j = 0; j < in.bufferSize(); j++ ) {
              p += abs( in.mix.get( j ) ) * 1;
          }
         float v = map(p, 0, in.bufferSize(), 1, 255);
         stroke(255/sqrt(v), 255*sqrt(v), 255/sqrt(v));
        line(b.pos.x, b.pos.y, b.pos.z, b.parent.pos.x, b.parent.pos.y, b.parent.pos.z);

  }   
      }
    }
  }
