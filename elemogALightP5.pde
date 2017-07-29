import oscP5.*;
import netP5.*;
OscP5 oscP5; 
NetAddress myRemoteLocation;    //送信用のアドレスを保持する変数

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
Scene8 scene8;
Scene9 scene9;

//シーン切り替え
int sceneCount = 9;
float[] sceneBtn  = new float[sceneCount];
float[] currentSceneBtn  = new float[sceneCount];

float[] baseColor ={0.5,1,1};
int scene;

int btnCount = 0;

void setup(){
  blendMode(ADD);
  colorMode(HSB,1);
  size(128,128);
  frameRate(60);


  //受信用の変数。右の数字はポート番号。送信側のポート番号とあわせる。
  oscP5 = new OscP5(this,8000);
  //送信用オブジェクト。左側の数字が相手のIPアドレス、右側が相手のポート番号。
  myRemoteLocation = new NetAddress("127.0.0.1", 9000);
  
  
  noStroke();
  colorMode(HSB,1);
  main= createGraphics(width, height/2);
  main.beginDraw();
  main.noStroke();
  main.colorMode(HSB,1);
  main.endDraw();

  top= createGraphics(width, height/2);
  top.beginDraw();
  top.noStroke();
  top.colorMode(HSB,1);
  top.endDraw();
  
  scene1 = new Scene1();
  scene2 = new Scene2();
  scene3 = new Scene3();
  scene4 = new Scene4();
  scene5 = new Scene5();
  scene6 = new Scene6();
  scene7 = new Scene7();
  scene8 = new Scene8();
  scene9 = new Scene9();
};

int count = 0;
int push = 0;


int piano = 0;
float pianoPos = 0;
int currentScene = 0;


void draw(){
  background(0);
  //fill(cc[0]/127.,1,1);
  println("piano"+piano + "/pos" +pianoPos);
  if(piano == 1){
    rect(pianoPos * width - 10, 0 , 20 , height);
  };
  if(scene == 1){
    if(currentScene != scene){
      scene1.init();
    };    scene1.run();
  }else if(scene==2){
    if(currentScene != scene){
      scene2.init();
    };
    scene2.run();
  }else if(scene==3){
    if(currentScene != scene){
      scene3.init();
    };
    scene3.run();
  }else if(scene==4){
    if(currentScene != scene){
      scene4.init();
    };
    scene4.run();
  }else if(scene==5){
    if(currentScene != scene){
      scene5.init();
    };
    scene5.run();
  }else if(scene==6){
    if(currentScene != scene){
      scene6.init();
    };
    scene6.run();
  }else if(scene==7){
    if(currentScene != scene){
      scene7.init();
    };
    scene7.run();
  }else if(scene==8){
    if(currentScene != scene){
      scene8.init();
    };
    scene8.run();
  }else if(scene==9){
    if(currentScene != scene){
      scene9.init();
    };
    scene9.run();
  };
  
  
  currentScene = scene;
  sceneSelect();
};



void sceneSelect(){
  //for(int i = 0; i < sceneBtn.length; i++){
  //  print(nf(i + 1,2) + " | ");
  //} ;
  //println();
  //for(int i = 0; i < sceneBtn.length; i++){
  //  print(nf(sceneBtn[i],2,0) + " | ");
  //} ;
  //println();
  for(int i = 0; i < sceneCount; i ++){
    if(currentSceneBtn[i] != sceneBtn[i]){
      currentSceneBtn[i] = sceneBtn[i];
      if(sceneBtn[i] > 0){
        scene = i +1 ;
      };
    };
    btnCount += sceneBtn[i];
  };
  if(btnCount == 0){
    scene = md%10 ;
  }else{
    btnCount = 0;
  }
  println("Scene : "+scene);
  println(baseColor[0]);
};

int md = 0;
  
  void mouseClicked(){
    md ++;
    println(md);
  }

//OSCメッセージを受信した際に実行するイベント
void oscEvent(OscMessage msg) {
  if(msg.checkAddrPattern("/scene1")==true) {
    sceneBtn[0] = msg.get(0).floatValue();
  }else if(msg.checkAddrPattern("/scene2")==true) {
    sceneBtn[1] = msg.get(0).floatValue();
  }else if(msg.checkAddrPattern("/scene3")==true) {
    sceneBtn[2] = msg.get(0).floatValue();
  }else if(msg.checkAddrPattern("/scene4")==true) {
    sceneBtn[3] = msg.get(0).floatValue();
  }else if(msg.checkAddrPattern("/scene5")==true) {
    sceneBtn[4] = msg.get(0).floatValue();
  }else if(msg.checkAddrPattern("/scene6")==true) {
    sceneBtn[5] = msg.get(0).floatValue();
  }else if(msg.checkAddrPattern("/scene7")==true) {
    sceneBtn[6] = msg.get(0).floatValue();
  }else if(msg.checkAddrPattern("/scene8")==true) {
    sceneBtn[7] = msg.get(0).floatValue();
  }else if(msg.checkAddrPattern("/scene9")==true) {
    sceneBtn[8] = msg.get(0).floatValue();
  }else if(msg.checkAddrPattern("/fader1")==true) {
    pianoPos = msg.get(0).floatValue();
  }else if(msg.checkAddrPattern("/fader1/z")==true) {
    piano = int(msg.get(0).floatValue());
    println(piano);
  };

  if(msg.checkAddrPattern("/hue")==true) {
    baseColor[0] = msg.get(0).floatValue();
  }
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