class Scene9 {
  void init() {
    fill(baseColor[0],baseColor[1],baseColor[2]);
    noStroke();
  };
  
  int num = 5;
  float[] life = new float[num];
  float[] s = new float[num];
  float[] r = new float[num];
  float[] c = new float[num];
  
  void run() {
    translate(width/2, height/2);
    translate(0, main.height/2);
    for(int i = 0; i < num; i++){
      fill(c[i],1,1);
      
      rotate(radians(r[i]));
      rect(life[i] - width * 0.8,-5,40,10);
      rotate(-radians(r[i]));
      life[i] -= s[i];
      
      if(life[i] <= 0){
        life[i] = width * 1.6;
        //r[i] = random(360);
        r[i] = (random(80)-40) + ( 180 * round(random(1)));
        s[i] = random(8) +6;
        c[i] = random(1);
      }
    }
  };
}