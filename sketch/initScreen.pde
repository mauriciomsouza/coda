Cloud cloud0, cloud1, cloud2, cloud3, cloud4, cloud5, cloud6, cloud7;

void initScreen() {
  imageMode(CORNER);
  image(initBg,0,0,width,height);
  
  cloud0.display();
  cloud1.display();
  cloud2.display();
  cloud3.display();
  cloud4.display();
  cloud5.display();
  cloud6.display();
  cloud7.display();
  
  pushMatrix();
  logo.resize(int(width/1.2),0);
  imageMode(CENTER);
  image(logo, width/2, gridY2);
  popMatrix();
  
  pushMatrix();
  imageMode(CORNER);
  downloadText.resize(int(moduleX*2),0);
  image(downloadText, gridX2, gridY6+10);
  popMatrix();
  
  buttonEnter.display("Play");
  buttonDownload.display("Download");
}
