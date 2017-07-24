class Scene3 {
  void init() {
    main.beginDraw();
    main.fill(baseColor[0],baseColor[1],baseColor[2]);
    main.noStroke();
    main.endDraw();
    top.beginDraw();
    top.fill(baseColor[0],baseColor[1],baseColor[2]);
    top.noStroke();
    top.endDraw();
  };
  void run() {
    main.beginDraw();
    main.background(0);
    main.rect(frameCount * 4 %width, 0, 20, height);
    main.endDraw();
   
    top.beginDraw();
    top.background(0);
    top.rect(127 - frameCount * 4 %width, 0, 20, height);
    top.endDraw();
    image(main,0,height/2);
    image(top,0,0);
  };
}