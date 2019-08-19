class Tag {
  PImage check;
  float minx;
  float miny;
  float maxx;
  float maxy;
  String Type = "none";
  color fill;
  float size;
  float distThreshold = 20;//Antes 25 limiar de distâcia entre um novo pixel identificado e a borda de um grupo de pixels

  
  Tag(float x, float y, String recogType, color cColor) {
    minx = x;
    miny = y;
    maxx = x;
    maxy = y;
    Type = recogType;
    fill = cColor;
    check = loadImage("static/check.png");
  }
  
  void show() {
    check.resize(int(moduleX/2),0);
    image(check, minx, miny+300);
  }
  
  void add(float x, float y, String recogType, color cColor) {
    minx = min(minx,x);
    miny = min(miny,y);
    maxx = max(maxx,x);
    maxy = max(maxy,y);
    Type = recogType;
    fill = cColor;
  }
  
  boolean isNear(float x, float y) {
    float cx = min(x, maxx);
    cx = max(cx,minx);
    
    float cy = min(y, maxy);
    cy = max(cy,miny);
    

    float d = distSq(cx, cy, x, y);
    
    
    if (d < distThreshold*distThreshold) {
      return true;
    } else {
      return false;
    }
  }
}
