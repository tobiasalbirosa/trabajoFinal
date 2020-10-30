class Cloud {
  weatherRequest wRequest;
  int cantidad; 
  float [] tamX = new float [180];
  float [] tamY = new float [180];
  float [] wind_speed = new float [180];
  float [] posX = new float [180];
  float [] posY = new float [180];
  float humidity;
  String pressure;
  String timezone;
  int tSize = 12;
  PImage background = loadImage("map.png");
  Cloud(float x, float y, int sizeX, int sizeY, float clouds, float temp, float speed,float humidity, String pressure, String timezone) {
    this.cantidad = round(clouds);
    this.tamX = new float[round(cantidad)];
    this.tamY = new float[round(cantidad)];
    this.posX = new float[round(cantidad)];
    this.posY = new float[round(cantidad)];
    this.wind_speed = new float[round(cantidad)];
    this.timezone = timezone;
    this.humidity = humidity;
    this.pressure = pressure;
    fill(temp, 255, 255, 127);
    for ( int i = 0; i < clouds-1; i++ ) {
      this.posX[i] = random(x-sizeX/3, x+sizeX/3);
      this.posY[i] = random(y-sizeY/4, y+sizeY/4);
      this.tamX[i] = random(20, 100);
      this.tamY[i] = random(10, 50);
      this.wind_speed[i] = speed;
    }
  }
  void display(float x, float y, int sizeX, int sizeY, float clouds, float temp, float wind_speed, float humidity, String pressure, String timezone) {
    pushStyle();
    background(background);
    fill(255, 180);
    rect(sizeX/2, sizeY/2, sizeX, sizeY);
    fill(temp, 255, 255, 120);
    rect(sizeX/2, sizeY/2, sizeX, sizeY);
    for (int i = 0; i <  this.cantidad; i++) {
      this.posX[i] = this.posX[i]+wind_speed;
      ellipse(this.posX[i], this.posY[i], this.tamX[i], this.tamY[i]);
      if (this.posX[i] > x  + 120) {
        this.reciclar(x, y, sizeX, sizeY, i);
      }
    }
    fill(0);
    this.textos(clouds, temp, wind_speed, humidity, pressure, timezone, sizeX, sizeY);
    popStyle();
  }
  void reciclar(float x, float y, int sizeX, int sizeY, int i) {
    this.posX[i] = random(x-sizeX/6, x+sizeX/6);
    this.posY[i] = random(y-sizeY/7, y+sizeY/7);
    this.tamX[i] = random(20, 100);
    this.tamY[i] = random(10, 50);
  }
  void textos(float clouds, float temp, float wind_speed, float humidity, String pressure, String timezone, int sizeX, int sizeY) {
    text("Así está el clima en la zona de: "+timezone+":", sizeX/20, sizeY/10);
    if (clouds < 5) {
      text("Despejado", sizeX/20, sizeY/10+tSize);
    }
    if (clouds < 25 && clouds >= 5) {
      text("Parcialmente nublado", sizeX/20, sizeY/10+tSize);
    }
    if (clouds >= 25) {
      text("Nublado", sizeX/20, sizeY/10+tSize);
    }
    if (temp < 5 && temp >= -10) {
      text("Hace demasiado calor ufff... (Temperatura extrema)", sizeX/20, sizeY/10+(tSize*2));
    }
    if (temp < 10 && temp >= 5) {
      text("Hace demasiado calor", sizeX/20, sizeY/10+(tSize*2));
    }
    if (temp < 20 && temp >= 10) {
      text("Hace calor", sizeX/20, sizeY/10+(tSize*2));
    }
    if (temp < 30 && temp >= 20) {
      text("Calorcito eee", sizeX/20, sizeY/10+(tSize*2));
    }
    if (temp < 70 && temp >= 30) {
      text("Temperatura agradable", sizeX/20, sizeY/10+(tSize*2));
    }
    if (temp < 120 && temp >= 70) {
      text("Se puso fresco", sizeX/20, sizeY/10+(tSize*2));
    }
    if (temp < 140 && temp >= 120) {
      text("¡Qué fresquete!", sizeX/20, sizeY/10+(tSize*2));
    }
    if (temp < 300 && temp >= 140) {
      text("¡Está helado, armemos un iglú! (Temperatura extrema)", sizeX/20, sizeY/10+(tSize*2));
    }
    if (wind_speed < 1 && wind_speed > 0) {
      text("Casi nada de viento che", sizeX/20, sizeY/10+(tSize*2)+tSize);
    }
   if (wind_speed < 3 && wind_speed >= 1) {
      text("Alguna brisa por ahí...", sizeX/20, sizeY/10+(tSize*2)+tSize);
    }
   if (wind_speed < 5 && wind_speed >= 3) {
      text("Hay viento", sizeX/20, sizeY/10+(tSize*2)+tSize);
    }
   if (wind_speed < 7 && wind_speed >= 5) {
      text("Mucho viento", sizeX/20, sizeY/10+(tSize*2)+tSize);
    }
    if (wind_speed < 15 && wind_speed >= 7) {
      text("Bastante viento, mucho cuidado", sizeX/20, sizeY/10+((tSize*2)+tSize));
    }
    if (wind_speed < 50 && wind_speed >= 15) {
      text("Muchísimo viento, mucho peligro (Viento extremo)", sizeX/20, sizeY/10+((tSize*2)+tSize));
    }
    if(humidity < 10 && humidity > 0){
       text("Está extremadamente seco", sizeX/20, sizeY/10+((tSize*2)+(tSize*2)));
    }
    if(humidity < 30 && humidity >=10){
       text("Poca humedad", sizeX/20, sizeY/10+((tSize*2)+(tSize*2)));
    }
    if(humidity < 50 && humidity >= 30){
       text("Humedad normal", sizeX/20, sizeY/10+((tSize*2)+(tSize*2)));
    }
    if(humidity < 75 && humidity >= 50){
       text("Algo húmedo", sizeX/20, sizeY/10+((tSize*2)+(tSize*2)));
    }
    if(humidity < 90 && humidity >= 75){
       text("Húmedo", sizeX/20, sizeY/10+((tSize*2)+(tSize*2)));
    }
    if(humidity < 250 && humidity >= 90){
       text("Húmedad extrema", sizeX/20, sizeY/10+((tSize*2)+(tSize*2)));
    }
    text("Presión atmosférica:"+pressure+" milibares/hectopascales", sizeX/20, sizeY/10+((tSize*2)+(tSize*2))+tSize);
  }
}
