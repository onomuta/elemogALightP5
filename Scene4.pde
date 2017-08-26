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
    
    stroke((baseColor[0]+ random(0.1)) % 1,baseColor[1],baseColor[2] -0.5);
    strokeWeight(20);
    ellipse(width/2,  3 * height/4, frame % (width * 2), frame % (width * 2));
    ellipse(width/2,  3 * height/4, (frame + width) % (width * 2), (frame + width) % (width * 2));
    
    
    stroke((baseColor[0]+ random(0.1)) % 1,baseColor[1],baseColor[2]);
    strokeWeight(6);
    ellipse(width/2,  3 * height/4, frame % (width * 2), frame % (width * 2));
    ellipse(width/2,  3 * height/4, (frame + width) % (width * 2), (frame + width) % (width * 2));

  };
}