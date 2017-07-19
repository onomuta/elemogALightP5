class Scene1 {
  void init() {
    fill(1);
  };
  void run() {
    for(int i = 0; i < num; i++){
      if(colY[i] < 0 - colH){
        colYSpeed[i] = random(15)+10;
        colY[i] = height + colH;
      }
      colY[i] = colY[i] - colYSpeed[i];
      rect(colW * i, colY[i],colW,colH);
    };
  };
}