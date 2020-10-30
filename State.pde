class State {  
  Adventure adv;
  Cloud cloud;
  String stateArray [] = {"Empty","Requested","Waiting"};
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
  float humidity;
  String pressure;
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
    //this.lvl = state[1];
    this.posX = x;
    this.posY = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    adv = new Adventure(x, y, sizeX, sizeY);
    cloud = new Cloud(x, y, sizeX, sizeY, this.clouds, this.temp, this.wind_speed, this.humidity, this.pressure, this.timezone);
  }
  void clouds() {
    switch(this.lvl){
      case "Empty" :
      background(0);
      text("Toca en cualquier lado de la pantalla para comenzar", sizeX/4, sizeY/2);
      break;
      case "Waiting" :
      background(0);
      text("Esperando...", sizeX/4, sizeY/2);
      break;
      case "Requested" :
      text("Busca un lugar en el mapa para obtener el clima, regrese con la tecla '0'", sizeX/8, sizeY/2);
      cloud.display(this.posX, this.posY, this.sizeX, this.sizeY, this.clouds, this.temp, this.wind_speed,this.humidity, this.pressure, this.timezone);
      break;
      default :
      background(0);
      text("Esperando...", sizeX/4, sizeY/2);
      break;
    }
  }
}
