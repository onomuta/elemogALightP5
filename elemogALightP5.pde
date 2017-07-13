import oscP5.*;
import netP5.*;
OscP5 oscP5;
OPC opc;

import themidibus.*;
MidiBus myBus; 

float colW;
int num = 8;
float colH = 20;
float[] colY = new float[num];
float[] colYSpeed = new float[num];
int scene;

void setup(){
  frameRate(60);
  oscP5 = new OscP5(this,8000);
  size(128,128);
  opcSetup();
  

  MidiBus.list();
  myBus = new MidiBus(this, "TouchOSC Bridge", -1);
  colW = width/8;
  noStroke();
  for(int i = 0 ; i < num ; i++) {
    colYSpeed[i] = random(15)+15;
  };
};

int count = 0;
int push = 0;


boolean piano = false;
int pianoPos = 0;


void draw(){
  background(0);
  
  println("piano"+piano + "/pos" +pianoPos);
  if(piano == true){
    
    rect(pianoPos, 0 , 20 , height);
  };
  if(scene == 1){
    scene1();
  }else if(scene == 2){
    scene2();
  }else if(scene == 3){
    scene3();
  }else if(scene == 4){
    //scene4();
  }else if(scene == 5){
    //scene5();
  };
};

void scene1(){
  for(int i = 0; i < num; i++){
    if(colY[i] < 0 - colH){
      colYSpeed[i] = random(15)+10;
      colY[i] = height + colH;
    }
    colY[i] = colY[i] - colYSpeed[i];
    rect(colW * i, colY[i],colW,colH);
  };
};

void scene2(){
  if(colY[0] < 0 - 20){
    colY[0] = height + 20;
  }
  colY[0] = colY[0] - 10;
  rect(0, colY[0], width, 20);
};

void scene3(){
  if(colY[0] < 0 - 20){
    colY[0] = width + 20;
  }
  colY[0] = colY[0] - 10;
  rect(colY[0], 0, 20, height);
};


void keyPressed() {
  if(key == 'a'){
    scene = 1;
  }else if(key == 's'){
    scene = 2;
  }else if(key == 'd'){
    scene = 3;
  }else if(key == 'f'){
    scene = 4;
  }else if(key == 'g'){
    scene = 5;
  }else if(key == 'h'){
    scene = 6;
  }else if(key == 'j'){
    scene = 7;
  }else if(key == 'k'){
    scene = 8;
  }
  
}

void keyReleased(){
  scene = 0;
}

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

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  //println();
  //println("Controller Change:");
  //println("--------");
  //println("Channel:"+channel);
  //println("Number:"+number);
  //println("Value:"+value);
  
  push = value;
  if(number == 13 && value == 127){
    piano = true;
  }else if(number == 13 && value == 0){
    piano = false;
  }
  
  if(number == 0){
    pianoPos = 127-value;
  };
}