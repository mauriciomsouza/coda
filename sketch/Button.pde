class Button {
  color c;
  float xpos;
  float ypos;
  String type;
  float sizeButton;
  PImage buttonImage1, buttonImage2, buttonImage3, buttonImage4, buttonImage5, buttonImage6;
  float minX;
  float maxX;
  float minY;
  float maxY;
  
  Button(float tempX, float tempY) {
    buttonImage1 = loadImage("static/play.png");
    buttonImage2 = loadImage("static/scan.png");
    buttonImage3 = loadImage("static/close.png");
    buttonImage4 = loadImage("static/next.png");
    buttonImage5 = loadImage("static/actionFrame.png");
    buttonImage6 = loadImage("static/download.png");
    c = color(255);
    xpos = tempX;
    ypos = tempY;
    sizeButton = moduleX;
    minX = xpos - sizeButton/2;
    maxX = xpos + sizeButton/2;
    minY = ypos - sizeButton/2;
    maxY = ypos + sizeButton/2;
  }
  
  void display(String tempType) {
    if (tempType == "Play") {
      imageMode(CENTER);
      sizeButton = moduleX*1.5;
      minX = xpos - sizeButton/2;
      maxX = xpos + sizeButton/2;
      minY = ypos - sizeButton/2;
      maxY = ypos + sizeButton/2;
      image(buttonImage1, xpos, ypos, sizeButton, sizeButton);
    } else if (tempType == "Scan") {
      imageMode(CENTER);
      image(buttonImage2, xpos, ypos, sizeButton, sizeButton);
    } else if (tempType == "Download") {
      imageMode(CENTER);
      image(buttonImage6, xpos, ypos, sizeButton, sizeButton);
    } else if (tempType == "Back") {
      imageMode(CENTER);
      sizeButton = moduleX-moduleX/4;
      minX = xpos - sizeButton/2;
      maxX = xpos + sizeButton/2;
      minY = ypos - sizeButton/2;
      maxY = ypos + sizeButton/2;
      image(buttonImage3, xpos, ypos, sizeButton, sizeButton);
    } else if (tempType == "Next") {
      imageMode(CENTER);
      image(buttonImage4, xpos, ypos, sizeButton, sizeButton);
    } else if (tempType == "actionFrame") {
      imageMode(CENTER);
      image(buttonImage5, xpos, ypos, sizeButton, sizeButton);
    }
    
  }
}
