import http.requests.*;  //JL: no tengo esta librería, instalar
State state;
void setup() {
  frameRate(12);  //JL: a que se debe esta decisión?
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
