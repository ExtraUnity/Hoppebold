Bold bold;

void setup() {
  size(500, 500);
  bold = new Bold(width/2, height/2, 25);
}

void draw() {
  background(255);
  bold.render();
  bold.update();
}


void mouseDragged() {

  if (mouseX<bold.location.x+bold.r && mouseX>bold.location.x-bold.r && mouseY<bold.location.y+bold.r && mouseY>bold.location.y-bold.r) {
    bold.location.x = mouseX;
    bold.location.y = mouseY;
  }
}
