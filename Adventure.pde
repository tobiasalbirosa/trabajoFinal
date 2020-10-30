class Adventure {   
  weatherRequest wRequest;
  Adventure(float x, float y,int sizeX,int sizeY) {
    this.updateAdventure(x,y,sizeX, sizeY);
  }  
  void updateAdventure(float x, float y, int sizeX, int sizeY) {
    this.wRequest = new weatherRequest(x,y,sizeX, sizeY);
  }
}
