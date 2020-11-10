class weatherRequest { 
  Nube nube;  //JL: wRequest crea un objeto Nube y viceversa... it's okey?
  int onRequest;
  int halfSizeX;
  int halfSizeY;
  float lat;
  float lon;
  float clouds;
  float temp;
  float wind_speed;
  float xMaped;
  float yMaped;
  PImage background;
  String timezone;
  weatherRequest(float x, float y, int sizeX, int sizeY) {
    this.xMaped = map(x, 0, sizeX, -180, 180);
    this.yMaped = map(y, 0, sizeY, 90, -90);
    this.buscar(x, y, sizeX, sizeY, xMaped, yMaped);
    this.background = loadImage("map3.png");
  }
  void buscar(float x, float y, int sizeX, int sizeY, float xMaped, float yMaped) {
    GetRequest get = new GetRequest("https://api.openweathermap.org/data/2.5/onecall?lat="+yMaped+"&lon="+xMaped+"&appid=22c138f2c522f60863b5dd52b099283c");
    get.send();
    JSONObject response = null; 
    response = parseJSONObject(get.getContent());  //JL: muy potente esta conection!!
    JSONObject objNew = response.getJSONObject("current");
    this.lat = response.getFloat("lat");
    this.lon = response.getFloat("lon");
    this.temp = objNew.getFloat("temp");
    this.temp = map(temp,210,300,220,1);
    this.clouds = objNew.getFloat("clouds");
    this.clouds = map(clouds, 0, 320, 1, 200);
    this.clouds = round(clouds);
    this.wind_speed = objNew.getFloat("wind_speed");
    this.onRequest = 0;
    this.halfSizeX = sizeX/2;
    this.halfSizeY = sizeY/2;
    if(this.clouds <= 1){
      this.clouds = 2;
    }
    state.clouds = this.clouds;
    state.timezone = response.getString("timezone");
    state.temp = temp;
    state.wind_speed = wind_speed;
    state.lvl = "Requested";
    println(objNew);
    nube = new Nube(x, y, sizeX, sizeY, this.clouds, this.temp, this.wind_speed, this.timezone);
  }
}
