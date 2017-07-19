class Scene3 {
  void init() {
    fill(1);
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