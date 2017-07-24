class Scene5 {
  void init() {
    fill(0,0,0,0);
    stroke(baseColor[0],baseColor[1],baseColor[2]);
    strokeWeight(3);

  };
  int frame = 0;

  int ringNum = 10;
  int[] ringX = new int[ringNum];
  int[] ringY = new int[ringNum];
  int[] ringL = new int[ringNum];

  void run() {
    frame = frameCount * 8;
    background(0);
    for(int i = 0; i < ringNum; i ++){
      ellipse(ringX[i], ringY[i], ringL[i], ringL[i]);

      ringL[i] --;

      if(ringL[i]<=0){
        ringL[i] = 100;
        ringX[i] = int(random(width));
        ringY[i] = int(random(height));
      }
    };




    
  };
};