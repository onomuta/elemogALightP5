class Scene6 {
  
  int num = 8;
  float YS[] = new float[num];
  float colW = main.width/8;
  float colH = 10;
  float colY[] = new float[num];
  float[] colHue = new float[num];
  
  int topNum = 8;
  float topS[] = new float[topNum];
  float topColW = top.width/8;
  float topColH = 10;
  float topColX[] = new float[topNum];
  float[] topColHue = new float[topNum];
  
  void init() {
    fill(1);
    for(int i = 0; i < num; i++){
      YS[i] = random(6)+2;
      colHue[i] = (baseColor[0]+ random(0.3)) % 1;
    };
    
    for(int i = 0; i < topNum; i++){
      topS[i] = random(8)+2;
      topColHue[i] = (baseColor[0]+ random(0.3)) % 1;
    };
  };

  void run() {
    main.beginDraw();
    main.background(0);
    main.endDraw();
    
    top.beginDraw();
    top.background(0);
    top.endDraw();
    
    for(int i = 0; i < num; i++){
      if(colY[i] < 0 - colH){
        YS[i] = (random(6)+2);
        colHue[i] = (baseColor[0]+ random(0.2)) % 1;
      }
      if(colY[i] > main.height - colH){
        YS[i] = -(random(6)+2);
        colHue[i] = (baseColor[0]+ random(0.2)) % 1;
      }
      colY[i] = colY[i] + YS[i];
        
      main.beginDraw();
      main.fill(colHue[i],baseColor[1],baseColor[2]);
      main.noStroke();
      main.rect(colW * i, colY[i],colW,colH);
      main.endDraw();  
    };
    image(main,0,height/2);
    
    
    for(int i = 0; i < topNum; i++){
      if(topColX[i] < 0 - topColW){
        topS[i] = (random(8)+2);
        topColHue[i] = (baseColor[0]+ random(0.2)) % 1;
      }
      if(topColX[i] > top.width - topColW){
        topS[i] = -(random(8)+2);
        topColHue[i] = (baseColor[0]+ random(0.2)) % 1;
      }
      topColX[i] = topColX[i] + topS[i];
        
      top.beginDraw();
      top.fill(topColHue[i],baseColor[1],baseColor[2]);
      top.noStroke();
      top.rect(topColX[i],topColW * i,topColH,topColW);
      top.endDraw();  
    };
    image(top,0, 0);
  };
}