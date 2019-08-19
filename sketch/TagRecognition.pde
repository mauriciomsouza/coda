color trackMoveLeft = color(253, 140, 130); //variavel que armazena a cor da Tag Jogar
color trackMoveRight = color(110, 163, 216);; //variavel que armazena a cor da Tag Jogar
color trackEat = color(141, 198, 63); //variavel que armazena a cor da Tag Comer
float colorThreshold = 60; //Antes 50 limiar de distância entre a cor alvo e a cor identificada
ArrayList<Tag> tags = new ArrayList<Tag>();

void check(){
  for (Tag b : tags) {
    b.show();
  }
}

void clean(){
   //loop invertido sobre a lista de comandos identificados
  for (int i = tags.size() - 1; i >= 0; i--) {
    float sizeX = tags.get(i).maxx - tags.get(i).minx;  
    float sizeY = tags.get(i).maxy - tags.get(i).miny;
    float sizeSq = sizeX * sizeY;
    //remoção dos falso positivos Antes 400
    if (sizeSq < 250) {
      tags.remove(i);
    }
  }
}

//calcula a distancia ao quadrado dos pixels
float distSq(float x1, float y1, float x2, float y2) {
  float d = (x2-x1)*(x2-x1) + (y2 - y1)*(y2 - y1);
  return d;
}

//scaneia a foto
void scan(PImage photo){
  for (int x = 0; x < photo.width; x++ ) { //itera sobre a linha de pixels
    for (int y = 0; y < photo.height; y++ ) { //itera sobre a coluna de pixels
      int loc = x + y * photo.width; //guarda a localização do pixel
      color currentColor = photo.pixels[loc]; //captura a cor do pixel
      //define o rgb das cores alvo e da cor do pixel atual
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackMoveLeft);
      float g2 = green(trackMoveLeft);
      float b2 = blue(trackMoveLeft);
      float r3 = red(trackMoveRight);
      float g3 = green(trackMoveRight);
      float b3 = blue(trackMoveRight);
      float r4 = red(trackEat);
      float g4 = green(trackEat);
      float b4 = blue(trackEat);
      
      //define as distâncias entre as cores alvo e a cor do pixel atual
      float dMoveLeft = dist(r1, g1, b1, r2, g2, b2);
      float dMoveRight = dist(r1, g1, b1, r3, g3, b3);
      float dEat = dist(r1, g1, b1, r4, g4, b4);

      
      //checa se o pixel atual é compatível com uma das tags
      if (dMoveLeft < colorThreshold) {
        boolean found = false;
        //itera sobre a lista de pixels identificados
        for (Tag b : tags) {  
          if(b.isNear(x,y)){
            //adiciona um novo ponto identificado a tag identificada
            b.add(x,y,"MoveLeft", trackMoveLeft);
            found = true;
            break;
          }
        }
        //adiciona uma nova tag a lista de comandos
        if (!found){
           Tag b = new Tag(x,y,"MoveLeft", trackMoveLeft);
           tags.add(b);
        }
      } if (dMoveRight < colorThreshold) {
        boolean found = false;
        for (Tag b : tags) {
          if(b.isNear(x,y)){
            b.add(x,y,"MoveRight", trackMoveRight);
            found = true;
            break;
          }
        }
        if (!found){
           Tag b = new Tag(x,y,"MoveRight", trackMoveRight);
           tags.add(b);
        }
      } if (dEat < colorThreshold) {
        boolean found = false;
        for (Tag b : tags) {
          if(b.isNear(x,y)){
            b.add(x,y,"Eat", trackEat);
            found = true;
            break;
          }
        }
        if (!found){
           Tag b = new Tag(x,y,"Eat", trackEat);
           tags.add(b);
        }
      } 
    }
  }
}
