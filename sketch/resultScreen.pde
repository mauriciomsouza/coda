void resultScreen() { 
  stage.display();
  image(bar, 0, gridY7, width, moduleY);
  imageMode(CENTER);
  resultBg.resize(0,int(moduleY*4));
  image(resultBg, width/2, height/2);
  resultTag.display(int(level));
  if (ratio == 0) {
    zeroStar();
  } else if (ratio > 0 && ratio <= 0.5) {
    oneStar();
  } else if (ratio > 0.5 && ratio < 1) {
    twoStars();
  } else if (ratio == 1) {
    threeStars();
  }
  buttonNext.display("Next");
  buttonBack.display("Back");
  imageMode(CORNER);
}

void zeroStar() {
  starBlacked.resize(int(moduleX),0);
  image(starBlacked, width/2, (height/2)-(moduleY+20));
  starBlacked.resize(int(moduleX),0);
  image(starBlacked, (width/2)-(moduleX-10), (height/2)-(moduleY));
  starBlacked.resize(int(moduleX),0);
  image(starBlacked, (width/2)+(moduleX-10), (height/2)-(moduleY));
  message0.resize(int(moduleX*3),0);
  image(message0, (width/2), (height/2));
}

void oneStar() {
  starBlacked.resize(int(moduleX),0);
  image(starBlacked, width/2, (height/2)-(moduleY+20));
  star.resize(int(moduleX),0);
  image(star, (width/2)-(moduleX-10), (height/2)-(moduleY));
  starBlacked.resize(int(moduleX),0);
  image(starBlacked, (width/2)+(moduleX-10), (height/2)-(moduleY));
  message1.resize(int(moduleX*3),0);
  image(message1, (width/2), (height/2));
}

void twoStars() {
  star.resize(int(moduleX),0);
  image(star, width/2, (height/2)-(moduleY+20));
  star.resize(int(moduleX),0);
  image(star, (width/2)-(moduleX-10), (height/2)-(moduleY));
  starBlacked.resize(int(moduleX),0);
  image(starBlacked, (width/2)+(moduleX-10), (height/2)-(moduleY));
  message2.resize(int(moduleX*3),0);
  image(message2, (width/2), (height/2));
}

void threeStars() {
  star.resize(int(moduleX),0);
  image(star, width/2, (height/2)-(moduleY+20));
  star.resize(int(moduleX),0);
  image(star, (width/2)-(moduleX-10), (height/2)-(moduleY));
  star.resize(int(moduleX),0);
  image(star, (width/2)+(moduleX-10), (height/2)-(moduleY));
  message3.resize(int(moduleX*3),0);
  image(message3, (width/2), (height/2));
}
