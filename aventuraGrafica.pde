/*
 Tobías Albirosa
 
 Tecnología Multimedial I 
 
 2020
 
 Aventura gráfica: "wwwClima"
 
 */
import http.requests.*;
State state;
void setup() {
  frameRate(12);
  state = new State(0, 0, width, height, "Empty");
  ellipseMode(CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  colorMode(HSB);
  size(579, 290);
  noStroke();
  smooth();
  //surface.setResizable(true);
}
void draw() { 
  state.clouds();
}
void mouseClicked() {
  state.update(mouseX, mouseY, width, height);
}
void keyPressed() {
  println(state.lvl);
  //state.pressed(key);
}
