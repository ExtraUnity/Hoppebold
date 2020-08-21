Bold bold;
PVector gravity = new PVector(0,1);
PVector wind = new PVector(0.01,0);
void setup() {
  size(500, 500);
  bold = new Bold(width/2, height/2, 25);
}

void draw() {
  newBackground();  
  bold.render();
  bold.addForce(gravity);
  bold.addForce(wind);
  bold.update();
  bold.checkEdges();
  fill(255);
  text("Press 1 for red ball, 2 for green ball & 0 for white ball",120,40);
}

void mouseDragged() {

  if (mouseX<bold.location.x+bold.r && mouseX>bold.location.x-bold.r && mouseY<bold.location.y+bold.r && mouseY>bold.location.y-bold.r) {
    bold.isHeld = true;
    bold.velocity.mult(0);
    bold.location.x = mouseX;
    bold.location.y = mouseY;

  }
}

void mouseReleased() {
 bold.isHeld = false; 
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

void keyPressed() {
 if(key=='1') {
   bold.c = color(255,0,0);
 } else if(key=='2') {
bold.c = color(0,255,0);   
 } else if (key=='0') {
  bold.c = color(255); 
 }
}
