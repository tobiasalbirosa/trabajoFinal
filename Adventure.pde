class Adventure {   
  weatherRequest wRequest;
  Adventure(float x, float y,int sizeX,int sizeY) {
    updateAdventure(x,y,sizeX, sizeY);
  }  
  void updateAdventure(float x, float y, int sizeX, int sizeY) {
    wRequest = new weatherRequest(x,y,sizeX, sizeY);
  }
}
