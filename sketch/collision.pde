void collision() {
  for (Fly f : flies) {
    if (checkCollision(toad.toadRelativeX, toad.collisionTip, f.flyPosX, f.flyPosY) == true) {
      f.soundTrigger++;
      f.flyPosY = toad.collisionTip;
      f.gotcha = true;
      eat = false;
    }
  }
}
