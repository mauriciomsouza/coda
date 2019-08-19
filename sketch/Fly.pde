class Fly {
  float flyPosX, flyPosY, relativeSize;
  PImage flyImage;
  PImage[] fly = new PImage[3];
  boolean gotcha;
  int soundTrigger = 0;
  
  Fly(float tempPosX, float tempPosY) {
    gotcha = false;
    for (int i = 0; i < fly.length; i++) {
      fly[i] = loadImage("static/fly"+i+".png");
      fly[i].resize(int(moduleX*0.8),0);
    }
    if (tempPosY == 0) {
      relativeSize = -3000;
      flyPosY = 0;
    } else if (tempPosY == 1) {
      relativeSize = 0.5;
      flyPosY = gridY1 + moduleY/2;
    } else if (tempPosY == 2) {
      relativeSize = 0.5;
      flyPosY = gridY2 + moduleY/2;
    } else if (tempPosY == 3) {
      relativeSize = 0.5;
      flyPosY = gridY3 + moduleY/2;
    } else if (tempPosY == 4) {
      relativeSize = 0.5;
      flyPosY = gridY4 + moduleY/2;
    } else {
      relativeSize = 0.5;
      flyPosY = gridY5 + moduleY/2;
    } 
    if (tempPosX == 0) {
      relativeSize = -3000;
      flyPosX = 0;
    } else if (tempPosX == 1) {
      flyPosX = gridX1 + moduleX/2;
    } else if (tempPosX == 2) {
      flyPosX = gridX2 + moduleX/2;
    } else if (tempPosX == 3) {
      flyPosX = gridX3 + moduleX/2;
    } else if (tempPosX == 4) {
      flyPosX = gridX4 + moduleX/2;
    } else {
      flyPosX = gridX5 + moduleX/2;
    }  
  }
  
  boolean isCatch() {
    if (gotcha == true) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {

    imageMode(CENTER);
    
    if (gotcha == true && soundTrigger == 1 ) {
      flySound.play();
      image(fly[2], flyPosX, flyPosY);
    } if (gotcha == true && soundTrigger == 2 ) {
      flySound.play();
      image(fly[2], flyPosX, flyPosY);
    } else if (gotcha == true && soundTrigger == 3 ) {
      flySound.play();
      image(fly[2], flyPosX, flyPosY);
    } if (gotcha == true && soundTrigger == 4 ) {
      flySound.play();
      image(fly[2], flyPosX, flyPosY);
    } else if (gotcha == true && soundTrigger > 2) {
      image(fly[2], flyPosX, flyPosY);
    } else if (gotcha == false) {
       if(frame % 2 == 0){
        image(fly[0], flyPosX, flyPosY);
      } else {
        image(fly[1], flyPosX, flyPosY);
      }

    }
    
    if (flyPosY > (toad.toadPosY - 50)) {
      soundTrigger = 0;
      flyPosX = +3000;
      flyPosY = -3000;
    }
    
    
  }
  
}
