class Scene1 {
  int num = 8;
  float colW = width/8;
  float colH = 20;
  float[] colY = new float[num];
  float[] colYSpeed = new float[num];
  float[] colColor = new float[num];
  void init() {
    noStroke();
    fill(baseColor[0],baseColor[1],baseColor[2]);
    
    for(int i = 0 ; i < num ; i++) {
      colYSpeed[i] = random(15)+15;
    };
  };
  void run() {
    
    for(int i = 0; i < num; i++){
      if(colY[i] < 0 - colH){
        colYSpeed[i] = random(15)+10;
        colY[i] = height + colH;
        colColor[i] = (baseColor[0]+ random(0.3)) % 1;
      }
      colY[i] = colY[i] - colYSpeed[i];
      fill(colColor[i],baseColor[1],baseColor[2]);
      rect(colW * i, colY[i],colW,colH);
    };
  };
}