int creditRoll = 0;

void creditScreen () {
  imageMode(CORNER);
  image(initBg,0,0,width,height);
  fill(0,65);
  cloud0.display();
  cloud1.display();
  cloud2.display();
  cloud3.display();
  cloud4.display();
  cloud5.display();
  cloud6.display();
  cloud7.display();
  rect(0,0,width,height);


  textSize(72);
  fill(255);
  text("Obrigado por jogar!", width/2 - textWidth("Obrigado por jogar!")/2, (height/2) - creditRoll);
  
  textSize(50);
  text("Um jogo desenvolvido por:", width/2 - textWidth("Um jogo desenvolvido por:")/2, (height/2 + 100) - creditRoll);
  
  textSize(36);
  text("Mauricio Melo", width/2 - textWidth("Mauricio Melo")/2, (height/2 + 150) - creditRoll);
  
  textSize(50);
  text("Orientador:", width/2 - textWidth("Orientador:")/2, (height/2 + 250) - creditRoll);
  
  textSize(36);
  text("Leonardo Cardarelli", width/2 - textWidth("Leonardo Cardarelli")/2, (height/2 + 300) - creditRoll);
  
  textSize(50);
  text("Agradecimentos:", width/2 - textWidth("Agradecimentos:")/2, (height/2 + 400) - creditRoll);
  
  textSize(36);
  text("Jessica Nascimento", width/2 - textWidth("Jessica Nascimento")/2, (height/2 + 450) - creditRoll);
  textSize(36);
  text("Davi Nascimento", width/2 - textWidth("Davi Nascimento")/2, (height/2 + 500) - creditRoll);
  textSize(36);
  text("Simone Melo de Arruda Souza", width/2 - textWidth("Simone Melo de Arruda Souza")/2, (height/2 + 550) - creditRoll);
  textSize(36);
  text("Jandai Oliveira de Souza", width/2 - textWidth("Jandai Oliveira de Souza")/2, (height/2 + 600) - creditRoll);
  textSize(36);
  text("Marinez Nascimento", width/2 - textWidth("Marinez Nascimento")/2, (height/2 + 650) - creditRoll);
  textSize(36);
  text("Romulo Matteoni", width/2 - textWidth("Romulo Matteoni")/2, (height/2 + 700) - creditRoll);
  textSize(36);
  text("Antonio Salgado", width/2 - textWidth("Antonio Salgado")/2, (height/2 + 750) - creditRoll);
  textSize(36);
  text("Jose Felipe Bichara", width/2 - textWidth("Jose Felipe Bichara")/2, (height/2 + 800) - creditRoll);
  textSize(36);
  text("Rafael Trota", width/2 - textWidth("Rafael Trota")/2, (height/2 + 850) - creditRoll);
  textSize(36);
  text("Joao Bonelli", width/2 - textWidth("Joao Bonelli")/2, (height/2 + 900) - creditRoll);
  textSize(36);
  text("Joao Alegria", width/2 - textWidth("Joao Alegria")/2, (height/2 + 950) - creditRoll);
  
  textSize(50);
  text("Repositorios:", width/2 - textWidth("Repositorios:")/2, (height/2 + 1050) - creditRoll);
  
  textSize(36);
  text("https://www.dl-sounds.com/", width/2 - textWidth("https://www.dl-sounds.com/")/2, (height/2 + 1100) - creditRoll);
  textSize(36);
  text("https://www.zapsplat.com/", width/2 - textWidth("https://www.zapsplat.com/")/2, (height/2 + 1150) - creditRoll);
  
  textSize(50);
  text("Feito com:", width/2 - textWidth("Feito com:")/2, (height/2 + 1250) - creditRoll);
  
  textSize(36);
  text("Processing for Android", width/2 - textWidth("Processing for Android")/2, (height/2 + 1300) - creditRoll);
  
  creditRoll += 5;
  
  if (creditRoll >= 2000) {
    state = 0;
    level = 1;
    openCredits = 0;
    creditRoll = 0;
    
  }
}
