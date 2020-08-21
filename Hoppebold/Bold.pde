class Ball {
  float r;
  PVector location;
  PVector velocity;
  PVector acceleration;
  boolean isHeld;
  color c;
  Ball(float x, float y, float r_) {
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    r = r_;
    isHeld = false;
    c = color(255);
  }

  void update() {
    if(!isHeld) {
    velocity.add(acceleration);
    location.add(velocity);
    }
    acceleration.mult(0);
  }
  
  void render() {
    fill(c);
    circle(location.x, location.y, r);
  }
  void addForce(PVector force) {
    acceleration.add(force);
  }
  
  void checkEdges() {
   if(location.x-r/2<0) {
     location.x = 0+r/2;
     velocity.x *= -1;
   } else if(location.x+r/2>width) {
     location.x = width-r/2;
     velocity.x *= -1;
   }
   if(location.y+r/2>height) {
     location.y = height-r/2;
     velocity.y *= -1;
   } else if(location.y-r/2<0) {
     location.y = 0+r/2;
     velocity.y *= -1;
   }
  }
}
