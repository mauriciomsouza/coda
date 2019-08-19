void scanScreen() {
    fill(0);
    stage.display();
    if (!cam.isStarted()) {
    } else {
      pushMatrix();
      imageMode(CENTER);
      translate(width/2, height/2);
      rotate(radians(90));
      image(cam, 0, 0, width, width);
      screen = get(0,(height/2)-(width/2),width,width);
      popMatrix();
      imageMode(CORNERS);
      image(scanFrame, gridX1, gridY2-80, gridX5+moduleX, gridY2+50);
      imageMode(CORNERS);
      image(scanFrame, gridX1, (gridY5-20)+moduleY, gridX5+moduleX, (gridY5+110)+moduleY);
    } 
    imageMode(CORNER);
    image(bar, 0, gridY7, width, moduleY);
    imageMode(CENTER);
    button.display("Scan");
    buttonBack.display("Back");
}
