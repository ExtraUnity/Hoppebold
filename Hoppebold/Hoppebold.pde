Bold bold;
PVector gravity = new PVector(0,1);
void setup() {

  size(500, 500);
  bold = new Bold(width/2, height/2, 25);
}

void draw() {
  background(255);
  bold.render();
  bold.addForce(gravity);
  bold.update();
  bold.checkEdges();
}

void mouseDragged() {

  if (mouseX<bold.location.x+bold.r && mouseX>bold.location.x-bold.r && mouseY<bold.location.y+bold.r && mouseY>bold.location.y-bold.r) {
    bold.isHeld = true;
    bold.location.x = mouseX;
    bold.location.y = mouseY;

  }
}

void mouseReleased() {
 bold.isHeld = false; 
}
