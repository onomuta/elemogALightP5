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
  int[] ringLE = new int[ringNum];
  

  void run() {
    frame = frameCount * 8;
    background(0);
    for(int i = 0; i < ringNum; i ++){
      strokeWeight(ringL[i]/30);
      ellipse(ringX[i], ringY[i], ringLE[i] - ringL[i], ringLE[i] - ringL[i]);

      ringL[i] -= 2;

      if(ringL[i]<=0){
        ringL[i] = int(random(200));
        ringLE[i] = ringL[i];
        ringX[i] = int(random(width));
        ringY[i] = int(random(height));
      }
    };




    
  };
};