class State {  
  Adventure adv;
  Nube nube;
  String stateArray [] = {"Empty","Requested"};
  int lvls = stateArray.length;
  String lvl = stateArray[0];
  String state[] = new String [lvls];
  float posX;
  float posY;
  int sizeX;
  int sizeY;
  float temp;
  float  wind_speed;
  float clouds;
  String timezone;
  State(float x, float y, int sizeX, int sizeY, String state) {
    this.posX = x;
    this.posY = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.lvl = state;
    for (int i = 0; i < 2; i++) {
      this.state[i] = this.stateArray[i];
    }
  }
  void pressed(char keyPress) {
    println(keyPress);
    ellipse(posX,posY, sizeX/10,sizeY/10);
    if (keyPress == '0') {
      fill(255);
      this.lvl = state[0];
    }else
    if (keyPress == 'd') {
      fill(255);
      this.posX = this.posX+20;
    } else
    if (keyPress == 'a') {
      fill(255);
      this.posX = this.posX-20;
    } else
    if (keyPress == 'w') {
      fill(255);
      this.posY = this.posY-20;
    } else
    if (keyPress == 's') {
      fill(255);
      this.posY = this.posY+20;
    }
  }
  void update(float x, float y, int sizeX, int sizeY) {
    this.lvl = state[1];
    this.posX = x;
    this.posY = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    adv = new Adventure(x, y, sizeX, sizeY);
    nube = new Nube(x, y, sizeX, sizeY, this.clouds, this.temp, this.wind_speed, this.timezone);
  }
  void clouds() {
    if (this.lvl == state[0]) {
      background(0);
      text("Toca en cualquier lado de la pantalla para comenzar", sizeX/4, sizeY/2);
    }
     else if (this.lvl == state[1]) {
      pushStyle();
      text("Busca un lugar en el mapa para obtener el clima, regrese con la tecla '0'", sizeX/8, sizeY/2);
      nube.display(this.posX, this.posY, this.sizeX, this.sizeY, this.clouds , this.temp, this.wind_speed, this.timezone);
      popStyle();
    }
  }
}
