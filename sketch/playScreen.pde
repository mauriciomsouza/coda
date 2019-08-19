Fly fly1, fly2, fly3, fly4, fly5, fly6, fly7, fly8, fly9, fly10;
Toad toad;
Stage stage;
int tongueSize;
float level = 1;
float score = 0;
boolean eat = false;
boolean eatIn = false;
boolean eatOut = false;
boolean moveLeft = false;
boolean moveRight = false;
int listLoop = 0;
int listSize = 0;
float tempToadPosition;
float tempToadTarget;
float ratio;
ArrayList<Fly> flies = new ArrayList<Fly>();

void playScreen() {
  stage.display();
  cloud0.display();
  cloud1.display();
  cloud2.display();
  cloud3.display();
  cloud4.display();
  cloud5.display();
  cloud6.display();
  cloud7.display();
  toad.display();
  for (Fly f : flies) {
    f.display();
  }
  
  noStroke();
  imageMode(CORNER);
  image(bar, 0, gridY7, width, moduleY);
  imageMode(CENTER);
  
  button.display("Scan");
  actionFrame.display("actionFrame");
  
  if (listSize != 0) {
    if (scanned == 1) {
      if (onEat() == true) {
        image(tagEat, actionFrame.xpos, actionFrame.ypos, moduleX, moduleX);
      } else if (moveLeft() == true) {
        image(tagLeft, actionFrame.xpos, actionFrame.ypos, moduleX, moduleX);
      } else if (moveRight() == true) {
        image(tagRight, actionFrame.xpos, actionFrame.ypos, moduleX, moduleX);
      }
      if (onEat() == false && moveLeft() == false && moveRight() == false) {
        loopMoves();
      }  
    }
  }
  
  buttonBack.display("Back");
  levelTag.display(int(level));
  fill(255);
  text("FPS: "+ int(frameRate), 10, 30);
}

void createToad() {
  toad = new Toad(int(random(1,5)));
}

void createStage() {
  stage = new Stage();
}

void createFly() {
  for (int i = 0; i < level; i++) {
    Fly fly = new Fly(int(random(1,5)), int(random(1,5)));
    flies.add(fly);
  } 
}

void makeMoves(){
  Tag moveTag = tags.get(listLoop);
  if (moveTag.Type == "MoveLeft") {
    if (toad.toadRelativeX > moduleX) {
      frame = 0;
      tempToadPosition = toad.toadRelativeX;
      tempToadTarget = toad.toadRelativeX - moduleX;
      moveLeft = true;
    }
  } else if (moveTag.Type == "MoveRight") {
    if (toad.toadRelativeX <= width - moduleX) {
      frame = 0;
      tempToadPosition = toad.toadRelativeX;
      tempToadTarget = toad.toadRelativeX + moduleX;
      moveRight = true;
    }
  } else if (moveTag.Type == "Eat") {
    frame = 0;
    eatIn = true;
    eat = true;
    eatSound.play();
  }
}

boolean onEat() {
  collision();
  if (eat == true && toad.collisionTip == toad.toadPosY) {
    toad.collisionTip -= 60;
    eat = true;
    eatIn = true;
    return true;
  } else if (eat == true && toad.collisionTip > gridY1) {
    toad.collisionTip -= 60;
    eat = true;
    eatIn = true;
    eatOut = false;
    return true;
  } else if (eat == false && toad.collisionTip < toad.toadPosY) {
    toad.collisionTip += 60;
    eat = false;
    eatIn = false;
    eatOut = true;
    return true;
  } else if (eat == false && toad.collisionTip >= toad.toadPosY) {
    toad.collisionTip = toad.toadPosY;
    eatIn = false;
    eatOut = false;
    eat = false;
    return false;
  } else {
    frame = 0;
    eatIn = false;
    eatOut = true;
    eat = false;
    return true;
  }
}

boolean moveLeft(){
  eatOut = false;
  if (moveLeft == true && tempToadPosition == toad.toadRelativeX) {
    toad.toadRelativeX -= 10;
    return true;
  } else if (moveLeft == true && toad.toadRelativeX > tempToadTarget) {
    moveLeft = true;
    toad.toadRelativeX -= 10;
    return true;
  } else if (moveLeft == true && toad.toadRelativeX <= tempToadTarget || toad.toadRelativeX < moduleX/2) {
    moveLeft = false;
    return false;
  } else {
    moveLeft = false;
    return false;
  }
}
  
boolean moveRight() {
  eatOut = false;
  if (moveRight == true && tempToadPosition == toad.toadRelativeX) {
    toad.toadRelativeX += 10;
    return true;
  } else if (moveRight == true && toad.toadRelativeX < tempToadTarget) {
    moveRight = true;
    toad.toadRelativeX += 10;
    return true;
  } else if (moveRight == true && toad.toadRelativeX >= tempToadTarget || toad.toadRelativeX > width - moduleX/2) {
    moveRight = false;
    return false;
  } else {
    moveRight = false;
    return false;
  }
}

void loopMoves() {
    if (listLoop == 0) {
      makeMoves();
      listLoop = listLoop + 1;
      
    } else if (listLoop > 0 && listLoop < listSize) {
      makeMoves();
      listLoop = listLoop + 1;
      
    } else if (listLoop == listSize) {
      endStage();
      if (endCounter == 20) {
      state = 4;
      endCounter = 0;
      score();
      st2.stop();
      forestNoise.stop();
      ratio = score/level;
      if (ratio == 1) {
        victorySound.play();
      } else if (ratio == 0) {
        failSound.play();
      } else {
        victorySound.play();
      }
      listLoop = 0;
      scanned = 0;
      for (int i = tags.size() - 1; i >= 0; i--) {
         tags.remove(i);
      }
     }
   }   
}

void score() {
  for (Fly f : flies) {
    if (f.gotcha == true) {
      score++;
    }
  }
}
