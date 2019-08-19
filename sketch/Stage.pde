class Stage {
  PImage stageBackground;
  
  Stage() {
    stageBackground = loadImage("static/stage1.png");
  }
  
  void display() {
    imageMode(CORNER);
    image(stageBackground, 0, 0, width, height);
  }
}
