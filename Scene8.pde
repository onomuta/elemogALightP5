class Scene8 {
  void init() {
    fill(baseColor[0],baseColor[1],baseColor[2]);
    noStroke();
  };
  
  int count = 0;
  
  void run() {
    
    if(count/4 %2 == 0){
      fill((baseColor[0]+ random(0.15)) % 1,baseColor[1],baseColor[2]);
    }else{
      fill(0);
    }
    
    rect(0,0,width, height);
    count ++;
  };
}