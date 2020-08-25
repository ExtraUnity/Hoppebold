Ball[] ball;
PVector gravity = new PVector(0, 1);
PVector wind = new PVector(0.01, 0);
boolean ballHeld = false;
void setup() {
  size(500, 500);
  ball = new Ball[2];
  for (int i = 0; i<ball.length; i++) {
    ball[i] = new Ball(random(50, width-50), random(50, height-50), 25);
  }
}

void draw() {
  newBackground();  
  for (int i = 0; i<ball.length; i++) {
    ball[i].render();
    ball[i].addForce(gravity);
    ball[i].addForce(wind);
    ball[i].update();
    ball[i].checkEdges();
  }
  fill(255);
  text("Press 1 for red ball, 2 for green ball & 0 for white ball", 120, 40);
}

void mousePressed() {
  for (int i = 0; i<ball.length; i++) {
    if (mouseX<ball[i].location.x+ball[i].r && mouseX>ball[i].location.x-ball[i].r && mouseY<ball[i].location.y+ball[i].r && mouseY>ball[i].location.y-ball[i].r) {
      ball[i].isHeld = true;
    }
  }
}
void mouseDragged() {
  for (int i = 0; i<ball.length; i++) {
    if (ball[i].isHeld) {
      ball[i].velocity.mult(0);
      ball[i].location.x = mouseX;
      ball[i].location.y = mouseY;
    }
  }
}

void mouseReleased() {
  for (int i = 0; i<ball.length; i++) {
    ball[i].isHeld = false;
  }
  ballHeld = false;
}

void newBackground() {
  background(0);
  stroke(0);
  for (int i = 1; i<9; i++) {
    fill(0, 250-(i-1)*20, 5+(i-1)*20, 75);
    ellipse(250, 250, 400, i*50);
  }

  for (int i = 1; i<9; i++) {
    fill(0, 250-(i-1)*20, 5+(i-1)*20, 75);
    ellipse(250, 250, i*50, i*50);
  }
}

void keyPressed() {
  if (key=='1') {
    for (int i = 0; i<ball.length; i++) {
      ball[i].c = color(255, 0, 0);
    }
  } else if (key=='2') {
    for (int i = 0; i<ball.length; i++) {
      ball[i].c = color(0, 255, 0);
    }
  } else if (key=='0') {
    for (int i = 0; i<ball.length; i++) {
      ball[i].c = color(255);
    }
  }
}
