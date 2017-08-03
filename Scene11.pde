class Scene11 {
  int num = 8;
  float colH = 20;
  float[] colY = new float[num];
  void init() {
    noStroke();
    fill(baseColor[0],baseColor[1],baseColor[2]);
  };
  void run() {
     if(colY[0] < 0 - 20){
      colY[0] = height + 20;
    }
    colY[0] = colY[0] - 10;
    rect(0, colY[0], width, 20);
  };
}