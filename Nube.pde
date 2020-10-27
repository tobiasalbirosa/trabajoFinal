class Nube {
  weatherRequest wRequest;
  int cantidad; 
  float [] tamX = new float [180];
  float [] tamY = new float [180];
  float [] wind_speed = new float [180];
  float [] posX = new float [180];
  float [] posY = new float [180];
  String timezone;
  PImage background = loadImage("map.png");
  Nube(float x, float y, int sizeX, int sizeY, float clouds, float temp, float speed, String timezone) {
    this.cantidad = round(clouds);
    tamX = new float[round(cantidad)];
    tamY = new float[round(cantidad)];
    posX = new float[round(cantidad)];
    posY = new float[round(cantidad)];
    wind_speed = new float[round(cantidad)];
    this.timezone = timezone;
    fill(temp, 255, 255, 127);
    for ( int i = 0; i < clouds-1; i++ ) {
      posX[i] = random(x-sizeX/3, x+sizeX/3);
      posY[i] = random(y-sizeY/4, y+sizeY/4);
      tamX[i] = random(20, 100);
      tamY[i] = random(10, 50);
      wind_speed[i] = speed;
    }
  }
  void display(float x, float y, int sizeX, int sizeY, float clouds, float temp, float velX, String timezone) {
    background(background);
    fill(255,180);
    rect(width/2,height/2,width,height);
    pushStyle();
    fill(temp, 255, 255, 127);
    rect(sizeX/2, sizeY/2, sizeX, sizeY);
    popStyle();
    pushStyle();
    fill(255);
    textSize(12);
    popStyle();
    pushStyle();
    fill(0);
    text("Este es el clima de: "+timezone, sizeX/8, sizeY/8);
    if (clouds > 25) {
      text("Nublado", sizeX/8, sizeY/8+12);
    }
    if (clouds < 25 && clouds > 5) {
      text("Parcialmente nublado", sizeX/8, sizeY/8+12);
    }
    if (clouds < 5) {
      text("Despejado", sizeX/8, sizeY/8+12);
    }
    fill(temp, 255, 255, 120);
    for (int i = 0; i <  this.cantidad; i++) {
        posX[i] = posX[i]+velX;
        ellipse(posX[i], posY[i], tamX[i], tamY[i]);
        if(posX[i] > x  + 120){
          reciclar(x,y,sizeX,sizeY,i);
        }
    }
    popStyle();
  }
  void reciclar(float x, float y, int sizeX, int sizeY, int i) {
    posX[i] = random(x-sizeX/6, x+sizeX/6);
    posY[i] = random(y-sizeY/7, y+sizeY/7);
    tamX[i] = random(20, 100);
    tamY[i] = random(10, 50);
  }
}
