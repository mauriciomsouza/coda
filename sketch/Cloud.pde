class Cloud {
  PImage[] cloud = new PImage[8];
  int shape;
  float x, y, vel;
  
  Cloud(int cloudShape, float tempX, float tempY) {
    vel = int(random(1,3));
    for (int i = 0; i < cloud.length; i++) {
    cloud[i] = loadImage("static/cloud"+i+".png");
    }
    shape = cloudShape;
    x = tempX;
    y = tempY;
    int resizeFactor = int(moduleY+random(0,100));
    cloud[shape].resize(resizeFactor, 0);
  }
  
  void display() {
      x -= vel;
      imageMode(CENTER);
      image(cloud[shape], x, y);
      if (x < -400) {
        x = width + random(200,650);
      }
  }  
  
}
