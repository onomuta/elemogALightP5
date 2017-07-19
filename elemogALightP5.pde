PGraphics main;
PGraphics top;

OPC opc;
Scene1 scene1;
Scene2 scene2;
Scene3 scene3;
Scene4 scene4;
Scene5 scene5;
Scene6 scene6;
Scene7 scene7;

import themidibus.*;
MidiBus myBus; 

float colW;
int num = 8;
float colH = 20;
float[] colY = new float[num];
float[] colYSpeed = new float[num];
int scene;

int btnCount = 0;

void setup(){
  colorMode(HSB,1);
  size(128,128);
  frameRate(60);

  MidiBus.list();
  //myBus = new MidiBus(this, "TouchOSC Bridge", -1);
  myBus = new MidiBus(this, 0, -1);
  colW = width/8;
  noStroke();
  for(int i = 0 ; i < num ; i++) {
    colYSpeed[i] = random(15)+15;
  };
  
  
  main= createGraphics(width, height/2);
  main.noStroke();
  main.colorMode(HSB,1);
  top= createGraphics(width, height/2);
  top.noStroke();
  top.colorMode(HSB,1);
  
  scene1 = new Scene1();
  scene2 = new Scene2();
  scene3 = new Scene3();
  scene4 = new Scene4();
};

int count = 0;
int push = 0;


boolean piano = false;
int pianoPos = 0;

//todo : currentSceneを作成してsceneのinitを呼び出す

void draw(){
  background(0);
  //fill(cc[0]/127.,1,1);
  println("piano"+piano + "/pos" +pianoPos);
  if(piano == true){
    
    rect(pianoPos, 0 , 20 , height);
  };
  if(scene == 1){
    scene1.init();
    scene1.run();
  }else if(scene==2){
    scene2.disp();
  }else if(scene==3){
    scene3.run();
  }else if(scene==4){
    scene4.init();
    scene4.run();
  }else if(scene==5){
    //scene5();
  };
  
  //cScene = scene; 
  
  for(int i = 0; i < cc.length; i++){
    //println("CC"+ i + cc[i]);
    print(nf(i,3) + " | ");
  } 
  println();
  for(int i = 0; i < cc.length; i++){
    print(nf(cc[i],3) + " | ");
  } 
  println();
  
  
  
  for(int i = 0; i < ccCount; i ++){
    if(ccS[i] != cc[i]){
      ccS[i] = cc[i];
      if(cc[i] > 0){
        scene = i ;
      };
    };
    
    btnCount += cc[i];
  };
   if(btnCount == 0){
     scene = 0 ;
   }else{
     btnCount = 0;
   }
    
    println(scene);
    
};


void opcSetup(){
  opc = new OPC(this, "127.0.0.1", 7890);
  opc.ledStrip(0 * 64, 54, width * 1/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(1 * 64, 54, width * 2/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(2 * 64, 54, width * 3/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(3 * 64, 54, width * 4/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(4 * 64, 54, width * 5/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(5 * 64, 54, width * 6/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(6 * 64, 54, width * 7/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(7 * 64, 54, width * 8/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  
  opc.ledStrip(8 * 64, 60, width * 3/4, height * 1/8 - height * 1/16, height/60/2, radians(0), false);
  opc.ledStrip(9 * 64, 60, width * 1/4, height * 1/8 - height * 1/16, height/60/2, radians(180), false); 
  opc.ledStrip(10 * 64, 60, width * 3/4, height * 2/8 - height * 1/16, height/60/2, radians(0), false);
  opc.ledStrip(11 * 64, 60, width * 1/4, height * 2/8 - height * 1/16, height/60/2, radians(180), false);
  opc.ledStrip(12 * 64, 60, width * 3/4, height * 3/8 - height * 1/16, height/60/2, radians(0), false);
  opc.ledStrip(13 * 64, 60, width * 1/4, height * 3/8 - height * 1/16, height/60/2, radians(180), false);
  opc.ledStrip(14 * 64, 60, width * 3/4, height * 4/8 - height * 1/16, height/60/2, radians(0), false);
  opc.ledStrip(15 * 64, 60, width * 1/4, height * 4/8 - height * 1/16, height/60/2, radians(180), false);
  
};

int midiNum;
int midiVal;
int midiCh;

int ccCount = 16;   //cc使用する数
int[] cc  = new int[ccCount];
int[] ccS  = new int[ccCount];

void controllerChange(int channel, int number, int value) {
  push = value;
  if(number == 13 && value == 127){
    piano = true;
  }else if(number == 13 && value == 0){
    piano = false;
  }
  
  for(int i = 0; i < cc.length; i++){
    if(i == number){
      cc[i] = value;
    }
  } 
};