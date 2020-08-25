class Ball {
  float r;
  PVector location;
  PVector velocity;
  PVector acceleration;
  boolean isHeld;
  color c;
  float mass;
  Ball(float x, float y, float r_) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    r = r_;
    isHeld = false;
    c = color(255);
    mass = 1;
  }

  void update() {
    if (!isHeld) {
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
    if (location.x-r/2<0) {
      location.x = 0+r/2;
      velocity.x *= -1;
    } else if (location.x+r/2>width) {
      location.x = width-r/2;
      velocity.x *= -1;
    }
    if (location.y+r/2>height) {
      location.y = height-r/2;
      velocity.y *= -1;
    } else if (location.y-r/2<0) {
      location.y = 0+r/2;
      velocity.y *= -1;
    }
  }
  
  boolean checkCollide(Ball b) {
    float dist;
    dist = sqrt((this.location.y-b.location.y)*(this.location.y-b.location.y) + (this.location.x-b.location.x)*(this.location.x-b.location.x));
    if(dist<=b.r/2+this.r/2) {
    return true;
    } else {
      return false;
    }
  }
  
  void collide(Ball b) {
    PVector un, ut, v1nNewVector, v2nNewVector, v1tNewVector, v2tNewVector, newVelocity1, newVelocity2;
    float v1n, v1t, v2n, v2t, v1nNew, v2nNew;
    un = PVector.sub(this.location,b.location);
    un.normalize();
    ut = new PVector(-un.y,un.x);
    v1n = PVector.dot(un,this.velocity);
    v1t = PVector.dot(ut,this.velocity);
    v2n = PVector.dot(un,b.velocity);
    v2t = PVector.dot(ut,b.velocity);
    v1nNew = (2*b.mass*v2n)/(this.mass+b.mass);
    v2nNew = (2*this.mass*v1n)/(this.mass+b.mass);
    v1nNewVector = PVector.mult(un,v1nNew);
    v1tNewVector = PVector.mult(ut,v1t);
    v2nNewVector = PVector.mult(un,v2nNew);
    v2tNewVector = PVector.mult(ut,v2t);
    newVelocity1 = PVector.add(v1nNewVector, v1tNewVector);
    newVelocity2 = PVector.add(v2nNewVector, v2tNewVector);
    this.velocity = newVelocity1;
    b.velocity = newVelocity2;
    
    
  }
}
