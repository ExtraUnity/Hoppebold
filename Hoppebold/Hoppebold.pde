Bold bold;

void setup() {
  size(500, 500);
  bold = new Bold(width/2, height/2, 25);
  
}

void draw() {
  newBackground();  
  bold.render();
  bold.update();

}

void mousePressed() {

}

void newBackground() {
  background(0);
  stroke(0);
      for(int i = 1; i<9; i++) {
    fill(0,250-(i-1)*20,5+(i-1)*20,75);
    ellipse(250,250,400,i*50);
    
    }
  
  for(int i = 1; i<9; i++) {
    fill(0,250-(i-1)*20,5+(i-1)*20,75);
    ellipse(250,250,i*50,i*50);
  }
}
