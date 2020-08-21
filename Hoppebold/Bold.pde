class Bold {
  float r;
  PVector location;
  PVector velocity;
  PVector acceleration;
  boolean isHeld;
  Bold(float x, float y, float r_) {
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    r = r_;
    isHeld = false;
  }

  void update() {
    if(!isHeld) {
    velocity.add(acceleration);
    location.add(velocity);
    }
    acceleration.mult(0);
  }
  void render() {
    fill(0);
    circle(location.x, location.y, r);
  }
  void addForce(PVector force) {
    acceleration.add(force);
  }
  
  void checkEdges() {
   if(location.x-r<=0 || location.x+r>=width) {
     velocity.x = velocity.x * -1;
   }
   if(location.y-r<0 || location.y+r>height) {
     location.y = height-r;
     velocity.y = velocity.y * -1;
   }
  }
}
