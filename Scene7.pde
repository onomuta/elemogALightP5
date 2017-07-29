class Scene7 {
  void init() {
    fill(baseColor[0],baseColor[1],baseColor[2]);
  };
  void run() {
    
    translate(width/2, height/2);
    translate(0, main.height/2);
    
    rotate(radians(frameCount *4));
    rect(-width,-3,2*width,6);
    rotate(radians(60));
    rect(-width,-3,2*width,6);
    rotate(radians(60));
    rect(-width,-3,2*width,6);
    
  };
}