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

void mousePressed() {

}
