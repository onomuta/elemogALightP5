class Scene10 {
  void init() {
    noStroke();
  };
  
  float time = 0;
  float y = 0;
  void run() {
    fill((baseColor[0]+ random(0.15)) % 1,baseColor[1],baseColor[2]);
    
    y = sin(time) *height;
    rect(0,y,width/8,height/4);
    
    
    time = time + 0.05;
  };
}