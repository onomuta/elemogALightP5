class Scene4 {
  void init() {
    fill(0,0,0,0);
    stroke(baseColor[0],baseColor[1],baseColor[2]);
    strokeWeight(6);

  };
  int frame = 0;
  void run() {
    frame = frameCount * 6;
    background(0);
    ellipse(width/2,  3 * height/4, frame % (width * 2), frame % (width * 2));
    ellipse(width/2,  3 * height/4, (frame + width) % (width * 2), (frame + width) % (width * 2));

  };
}