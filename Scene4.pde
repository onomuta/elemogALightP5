class Scene4 {
  void init() {
    fill(1);
  };
  void run() {
    main.beginDraw();
    main.background(0);
    main.fill(0);
    main.stroke(255);
    main.strokeWeight(6);
    main.ellipse(main.width/2,  main.height/2, frameCount * 4 % main.width *2,frameCount * 4 % main.width *2);
    main.endDraw();
   
    top.beginDraw();
    top.background(0);
    top.rect(127 - frameCount * 4 %width, 0, 20, height);
    top.endDraw();
    image(main,0,height/2);
    image(top,0,0);
  };
}