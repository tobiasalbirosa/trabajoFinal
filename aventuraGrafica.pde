import http.requests.*;
State state;
void setup() {
  frameRate(12);
  state = new State(0,0,width,height,"Empty");
  ellipseMode(CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  colorMode(HSB);
  size(579, 290);
  noStroke();
  smooth();
}
void draw() { 
  state.clouds();
}
void mouseClicked(){
  state.update(mouseX,mouseY, width, height);
}
void keyPressed(){
  state.pressed(key);
}
