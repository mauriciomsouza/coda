class Level {
  color c;
  float xpos;
  float ypos;
  String type;
  float sizeButtonX;
  PImage buttonLoad1, buttonLoad2, buttonLoad3, buttonLoad4, buttonLoad5, buttonLoad6, buttonLoad7, buttonLoad8, buttonLoad9, buttonLoad10;
  PImage buttonImage;
  
  Level(float tempX, float tempY, String tempType) {
    buttonLoad1 = loadImage("static/level1.png");
    buttonLoad2 = loadImage("static/level2.png");
    buttonLoad3 = loadImage("static/level3.png");
    buttonLoad4 = loadImage("static/level4.png");
    buttonLoad5 = loadImage("static/level5.png");
    buttonLoad6 = loadImage("static/level6.png");
    buttonLoad7 = loadImage("static/level7.png");
    buttonLoad8 = loadImage("static/level8.png");
    buttonLoad9 = loadImage("static/level9.png");
    buttonLoad10 = loadImage("static/level10.png");
    c = color(255);
    xpos = tempX + 20;  
    ypos = tempY + 20;
    sizeButtonX = moduleX*3 - 100;
    type = tempType;
  }
  
  void display(int tempLevel) {
    if (tempLevel == 1) {
      buttonImage = buttonLoad1;
    } else if (tempLevel == 2) {
      buttonImage = buttonLoad2;
    } else if (tempLevel == 3) {
      buttonImage = buttonLoad3;
    }  else if (tempLevel == 4) {
      buttonImage = buttonLoad4;
    } else if (tempLevel == 5) {
      buttonImage = buttonLoad5;
    }  else if (tempLevel == 6) {
      buttonImage = buttonLoad6;
    } else if (tempLevel == 7) {
      buttonImage = buttonLoad7;
    }   else if (tempLevel == 8) {
      buttonImage = buttonLoad8;
    } else if (tempLevel == 9) {
      buttonImage = buttonLoad9;
    }  else if (tempLevel == 10) {
      buttonImage = buttonLoad10;
    }
    buttonImage.resize(int(sizeButtonX), 0);
    if (type == "level") {
      imageMode(CORNER);
      image(buttonImage,xpos,ypos);
    } else if (type == "result") {
      
      imageMode(CENTER);
      image(buttonImage,width/2,ypos);
    }   
    
  }
}
