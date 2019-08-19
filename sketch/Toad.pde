class Toad {
  float toadPosX, toadPosY, collisionTip, toadRelativeX, tongueAnchor;
  //PImage toadImage;
  PImage[] idle = new PImage[8];
  PImage[] moveleft = new PImage[8];
  PImage[] moveright = new PImage[8];
  PImage[] eatMove = new PImage[3];
  PImage[] intro = new PImage[8];
  PImage toadImageSize;
  
  Toad(float tempPosX) {
    for (int i = 0; i < idle.length; i++) {
      idle[i] = loadImage("static/idle"+i+".png");
      idle[i].resize(int(moduleX*1.5),0);
    }
    for (int i = 0; i < moveleft.length; i++) {
      moveleft[i] = loadImage("static/left"+i+".png");
      moveleft[i].resize(int(moduleX*1.5),0);
    } 
    for (int i = 0; i < eatMove.length; i++) {
      eatMove[i] = loadImage("static/eat"+i+".png");
      eatMove[i].resize(int(moduleX*1.5),0);
    } 
    for (int i = 0; i < moveright.length; i++) {
      moveright[i] = loadImage("static/right"+i+".png");
      moveright[i].resize(int(moduleX*1.5),0);
    }
    for (int i = 0; i < intro.length; i++) {
      intro[i] = loadImage("static/intro"+i+".png");
      intro[i].resize(int(moduleX*1.5),0);
    }
    if (tempPosX == 1) {
      toadPosX = gridX1;
    } else if (tempPosX == 2) {
      toadPosX = gridX2;
    } else if (tempPosX == 3) {
      toadPosX = gridX3;
    } else if (tempPosX == 4) {
      toadPosX = gridX4;
    } else if (tempPosX == 5) {
      toadPosX = gridX5;
    }
    toadRelativeX = toadPosX + (moduleX/2);
    toadPosY = gridY6+(moduleY/3);
    tongueAnchor = toadPosY - (moduleY/4);
    collisionTip = toadPosY; 
}
  
  void display() {
      if (frame >= 60) {
        frame = 0;
      }
      
      imageMode(CENTER);
      
      if (scanned == 0) {
        if (frame == 0) {
          image(intro[frame], toadRelativeX, toadPosY);
        } else if (frame > 0 && frame <= 2) {
          image(intro[frame], toadRelativeX, toadPosY);
        }  else if (frame > 2 && frame <= 3) {
          image(intro[frame], toadRelativeX, toadPosY);
          hungrySound.play();
        }  else if (frame > 3 && frame <= 7) {
          image(intro[frame], toadRelativeX, toadPosY);
        } else if (frame > 7 && frame <= 60) {
            if (frameIdle == 0) {
              image(idle[frameIdle], toadRelativeX, toadPosY);
            } else if (frameIdle > 0 && frameIdle <= 7) {
              image(idle[frameIdle], toadRelativeX, toadPosY);
            } else {
              image(idle[0], toadRelativeX, toadPosY);
              frameIdle = 0;
            }
        } else if (frame > 59) {
          image(intro[0], toadRelativeX, toadPosY);
          frame = 0;
        }
      } else if (eatIn == true) {
          if (frame == 0) { 
            image(eatMove[frame], toadRelativeX, toadPosY);
          } else if (frame > 0 && frame <= 1) {
            image(eatMove[frame], toadRelativeX, toadPosY);
            stroke(217,133,184);
            strokeWeight(moduleX/5);
            line(toadRelativeX, tongueAnchor, toadRelativeX, collisionTip);
            noStroke();
            fill(217,133,184);
            ellipseMode(CENTER);
            ellipse(toadRelativeX, collisionTip, moduleX/4, moduleX/4);
          } else if (frame > 1 && frame <= 2) { 
            image(eatMove[frame], toadRelativeX, toadPosY);
            stroke(217,133,184);
            strokeWeight(moduleX/5);
            line(toadRelativeX, tongueAnchor, toadRelativeX, collisionTip);
            
            noStroke();
            fill(217,133,184);
            ellipseMode(CENTER);
            ellipse(toadRelativeX, collisionTip, moduleX/4, moduleX/4);
          } else {
            image(eatMove[2], toadRelativeX, toadPosY);
            stroke(217,133,184);
            strokeWeight(moduleX/5);
            line(toadRelativeX, tongueAnchor, toadRelativeX, collisionTip);
                  
            noStroke();
            fill(217,133,184);
            ellipseMode(CENTER);
            ellipse(toadRelativeX, collisionTip, moduleX/4, moduleX/4);
          }
      } else if (eatOut == true) {
      if (frame == 0 && collisionTip <= toadPosY-(moduleY*1.2)) {
            image(eatMove[2], toadRelativeX, toadPosY);
            stroke(217,133,184);
            strokeWeight(moduleX/5);
            line(toadRelativeX, tongueAnchor, toadRelativeX, collisionTip);
       
            noStroke();
            fill(217,133,184);
            ellipseMode(CENTER);
            ellipse(toadRelativeX, collisionTip, moduleX/4, moduleX/4);
          } else if (frame == 0 && collisionTip > toadPosY-200) {
            image(eatMove[1], toadRelativeX, toadPosY);
            stroke(217,133,184);
            strokeWeight(moduleX/5);
            line(toadRelativeX, tongueAnchor, toadRelativeX, collisionTip);
            noStroke();
            fill(217,133,184);
            ellipseMode(CENTER);
            ellipse(toadRelativeX, collisionTip, moduleX/4, moduleX/4);
          } else if (frame > 0 && frame <= 1) {
            image(eatMove[0], toadRelativeX, toadPosY);
            stroke(217,133,184);
            strokeWeight(moduleX/5);
            line(toadRelativeX, tongueAnchor, toadRelativeX, collisionTip);
            noStroke();
            fill(217,133,184);
            ellipseMode(CENTER);
            ellipse(toadRelativeX, collisionTip, moduleX/4, moduleX/4);
          } else if (frame > 1) {
            image(eatMove[0], toadRelativeX, toadPosY);
            stroke(217,133,184);
            strokeWeight(moduleX/5);
            line(toadRelativeX, tongueAnchor, toadRelativeX, collisionTip);
            noStroke();
            fill(217,133,184);
            ellipseMode(CENTER);
            ellipse(toadRelativeX, collisionTip, moduleX/4, moduleX/4);
          }
      } else if (moveRight == true) {
          if (frame == 0) {
            image(moveright[frame], toadRelativeX, toadPosY);
          } else if (frame > 0 && frame <= 7) {
            image(moveright[frame], toadRelativeX, toadPosY);
          } else {
            image(moveright[0], toadRelativeX, toadPosY);
            frame = 0;
            
          }
      } else if (moveLeft == true) {
          if (frame == 0) {
            image(moveleft[frame], toadRelativeX, toadPosY);
          } else if (frame > 0 && frame <= 7) {
            image(moveleft[frame], toadRelativeX, toadPosY);
          } else {
            image(moveleft[0], toadRelativeX, toadPosY);
            frame = 0;
          }
      } else {
        if (frame >= idle.length) {
          image(idle[0], toadRelativeX, toadPosY);
          frame = 0;
        } else {
          if (frame == 0) {
            image(idle[frame], toadRelativeX, toadPosY);
          } else if (frameIdle > 0 && frameIdle <= 7) {
            image(idle[frame], toadRelativeX, toadPosY);
          } else {
            image(idle[0], toadRelativeX, toadPosY);
            frame = 0;
         }
        }
        
      }
      
  }
}
