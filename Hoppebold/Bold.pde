class Bold {
  float r;
  PVector location;
  PVector velocity;
  PVector acceleration;
  Bold(float x, float y, float r_) {
    location = new PVector(x,y);
    r = r_;
  }
  
  void update() {

  }
  
  void render() {
   fill(0);
   circle(location.x, location.y, r);
  }
  
}
