class Scene2 {
  void init() {
    fill(1);
  };
  void run() {
     if(colY[0] < 0 - 20){
      colY[0] = height + 20;
    }
    colY[0] = colY[0] - 10;
    rect(0, colY[0], width, 20);
  };
}