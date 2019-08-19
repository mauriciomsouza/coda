import processing.sound.*;
boolean loadedIntro = false;
import ketai.camera.*;
KetaiCamera cam;
PImage screen, star, starBlacked, resultBg, message0, message1, message2, message3, image, imageScan, tagLeft, tagRight, tagEat, bar, initBg, logo, downloadText, scanFrame;
SoundFile eatSound, st1, st2, flySound,  victorySound, forestNoise, failSound, hungrySound;
Level levelTag, resultTag;
Button button, buttonEnter, buttonBack, buttonNext, buttonDownload, actionFrame;
float dWidth, dHeight, sizeX, sizeY, position1, position2, position3, position4, position5, gridX1, gridX2, gridX3, gridX4, gridX5, gridY0, gridY1, gridY2, gridY3, gridY4, gridY5, gridY6, gridY7, moduleX, moduleY;;
int state, scanned, splashCounter;
color moveLeftColor, eatColor, moveRightColor;
boolean flySoundTrigger = false;
int m, startTime, frame, frameIdle, openCredits;


void settings() {
  fullScreen(); 
  
}

void setup() {
  background(0);
  frameRate(48);
  orientation(PORTRAIT); 

  sizeX = width;
  sizeY = height;
  moduleX = sizeX / 5;
  moduleY = sizeY / 8;
  gridX1 = 0;
  gridX2 = moduleX;
  gridX3 = moduleX*2;
  gridX4 = moduleX*3;
  gridX5 = moduleX*4;
  gridY0 = 0;
  gridY1 = moduleY;
  gridY2 = moduleY*2;
  gridY3 = moduleY*3;
  gridY4 = moduleY*4;
  gridY5 = moduleY*5;
  gridY6 = moduleY*6;
  gridY7 = moduleY*7;
  openCredits = 0;
 
 levelTag = new Level(gridX1, gridY0, "level");
 resultTag = new Level(width/2, (height/2)-(moduleY*2),"result");
 button = new Button(gridX5+moduleX/2, gridY7+moduleY/2);
 actionFrame = new Button(gridX1+moduleX/2, gridY7+moduleY/2);
 buttonNext = new Button(width/2, (height/2)+(moduleY));
 buttonEnter = new Button(gridX3+moduleX/2, gridY4);
 buttonBack = new Button(gridX5+moduleX/2, gridY0+moduleY/2);
 buttonDownload = new Button(gridX4+moduleX/2, gridY6+moduleY/2);
 state = 0;
 scanned = 0;

 cloud0 = new Cloud(int(random(0,7)), random(200, width+600), random(0,gridY5));
  cloud1 = new Cloud(int(random(0,7)), random(200,width+700), random(0,gridY5));
  cloud2 = new Cloud(int(random(0,7)), random(200,width+400), random(0,gridY5));
  cloud3 = new Cloud(int(random(0,7)), random(200,width+600), random(0,gridY5));
  cloud4 = new Cloud(int(random(0,7)), random(200,width+300), random(0,gridY5));
  cloud5 = new Cloud(int(random(0,7)), random(200,width+300), random(0,gridY5));
  cloud6 = new Cloud(int(random(0,7)), random(200,width+400), random(0,gridY5));
  cloud7 = new Cloud(int(random(0,7)),random(200,width+600), random(0,gridY5));


 cam = new KetaiCamera(this, 720, 720, 24);
 frame = 0;
 frameIdle = 0;
 startTime = 0;
 thread("loadFiles");
}

synchronized void draw() {
  if(!loadedIntro){
    splashScreen();
  } else {
 
      if(millis() > startTime + 120) { 
     startTime += 120;
     frame++; 
     frameIdle++;
     if (frame > 60) {
       frame = 0;
     }
    }
    if (state == 0) {
      if (openCredits == 0) {
        st2.stop();
        forestNoise.stop();
        initScreen();
      } else {
        creditScreen();
      }
      
    } else if (state == 1) {
        playScreen();
    } else if (state == 2) {
      scanScreen();
      scan(screen);
      clean();
      check();
      tags.clear();
    } else if (state == 4) {
      resultScreen();
    }
  
    
    
  } 
  
}

boolean checkCollision(float toadX, float collisionTip, float flyX, float flyY) {
  if (toadX >= (flyX-moduleX/2) && toadX <= (flyX+moduleX/2)) {
    if (collisionTip >= (flyY-moduleY/2) && collisionTip <= (flyY+moduleY/2)) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
};

void mousePressed() {
   if (state == 6) {
      if (mouseX > button.minX && mouseX < button.maxX && mouseY > button.minY && mouseY < button.maxY) {
          state = 1;
          createStage();
          createFly();
          createToad(); 
      }
  }
  if (state == 0) {
    if (mouseX > buttonEnter.minX && mouseX < buttonEnter.maxX && mouseY > buttonEnter.minY && mouseY < buttonEnter.maxY) {
      st1.stop();
      st2.loop();
      forestNoise.loop();
      state = 1;
      createStage();
      createFly();
      createToad(); 
       
    } if (mouseX > buttonDownload.minX && mouseX < buttonDownload.maxX && mouseY > buttonDownload.minY && mouseY < buttonDownload.maxY) {
      link("http://coda.mauriciomelo.design/BlocosCoda.pdf");
    }
  } else if (state == 1) {
     if (mouseX > buttonBack.minX && mouseX < buttonBack.maxX && mouseY > buttonBack.minY && mouseY < buttonBack.maxY) {
         state = 0;
         for (int i = flies.size() - 1; i >= 0; i--) {
            flies.remove(i);
         } 
      }
    if (mouseX > button.minX && mouseX < button.maxX && mouseY > button.minY && mouseY < button.maxY) {
      cam.start();
      state = 2;
    } else if (mouseY <= 40) {
      if (mouseX > 0 && mouseX < width/4) {
        state = 1;
      } else if (mouseX > 3*(width/4) && mouseX < width) {  
      }
    }
  } else if (state == 2) {
    if (mouseX > buttonBack.minX && mouseX < buttonBack.maxX && mouseY > buttonBack.minY && mouseY < buttonBack.maxY) {
         state = 1;
     }  
     if (mouseX > button.minX && mouseX < button.maxX && mouseY > button.minY && mouseY < button.maxY) { 
          scan(screen);
          clean();
          check(); 
          cam.stop();
          state = 1;
          scanned = 1;
          listSize = tags.size();
           
    }
  } else if (state == 4) {
    if (mouseX > buttonBack.minX && mouseX < buttonBack.maxX && mouseY > buttonBack.minY && mouseY < buttonBack.maxY) {
              
         state = 0;
         st1.loop();
      
          
    } if (mouseX > buttonNext.minX && mouseX < buttonNext.maxX && mouseY > buttonNext.minY && mouseY < buttonNext.maxY) {
          if (ratio == 1) {
            level++;  
          } else if (ratio == 0) {
            
          } else {
            level++;
          }
          if (level == 6) {
              openCredits = 1;
              st1.loop();
              state = 0;
          }
          for (int i = flies.size() - 1; i >= 0; i--) {
             flies.remove(i);
          }
          if (openCredits == 1) {
            score = 0;
          } else {
            state = 1;
            score = 0;
            st2.loop();
            forestNoise.loop();
            createStage();
            createFly();
            createToad(); 
          }
          
    }
  }
}

void onCameraPreviewEvent() {
  cam.read();
}

void loadFiles(){
  bar = loadImage("static/bar.png");
  message0 = loadImage("static/message0.png");
  message1 = loadImage("static/message1.png");
  message2 = loadImage("static/message2.png");
  message3 = loadImage("static/message3.png");
  resultBg = loadImage("static/resultBackground.png");
  st1 = new SoundFile(this, "st1.wav");
  st2 = new SoundFile(this, "st2.wav");
  eatSound = new SoundFile(this, "eatSound.wav");
  flySound = new SoundFile(this, "flySound.wav");
  forestNoise = new SoundFile(this, "forestNoise.wav");
  victorySound = new SoundFile(this, "victorySound.wav");
  failSound = new SoundFile(this, "failSound.wav");
  hungrySound = new SoundFile(this, "hungrySound.wav");
  imageScan = loadImage("tagv7.png");
  downloadText = loadImage("static/downloadText.png");
  initBg = loadImage("static/stage1.png");
  scanFrame = loadImage("static/scanFrame.png");
  logo = loadImage("static/logo.png");
  tagLeft = loadImage("static/left.png");
  tagRight = loadImage("static/right.png");
  tagEat = loadImage("static/eat.png");
  star = loadImage("static/star.png");
  starBlacked = loadImage("static/starBlacked.png");
  synchronized(this){
  loadedIntro = true;
  st1.loop();
  }
}  
