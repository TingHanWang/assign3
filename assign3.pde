//You should implement your assign3 here.
PImage startImg1;
PImage startImg2;
PImage backgroundImg1;
PImage backgroundImg2;
PImage shipImg1;
PImage shipImg2;
PImage blood;
PImage thing;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
final int GAME_START=1,GAME_RUN=2,GAME_PP=3;
int gameState;
int bgX=0;
int bgQ=bgX-640;
int fighterX=580;
int fighterY=240;
int rectX=200;
int rectY=20;
int blood1=0;
int blood2=0;
int thingX=300;
int thingY=300;
int rnd;
int a=0;
int s=0;
float enemyX;
float enemyY;
final int COUNT=5;
float spacingX;
float spacingY;
float enemyQ=0, enemyW=240;
final int COUNT2=5;
float spacingQ;
float spacingW;
float speed = 5;
void setup(){
  size(640,480);
   startImg1 = loadImage("img/start1.png");
  startImg2 = loadImage("img/start2.png");
  backgroundImg1= loadImage("img/bg1.png");
  backgroundImg2= loadImage("img/bg2.png");
  shipImg1 = loadImage("img/fighter.png");
  shipImg2 = loadImage("img/enemy.png");
  blood = loadImage("img/hp.png");
  thing = loadImage("img/treasure.png");
  spacingX=(width/3)/COUNT;
  spacingY=(height/3)/COUNT;
  spacingQ=(width/3)/COUNT;
  spacingW=(height/3)/COUNT;
  enemyX=0;
  enemyY=240;
  bgX=0;
bgQ=bgX-640;
fighterX=580;
fighterY=240;
rectX=200;
rectY=20;
blood1=0;
blood2=0;
thingX=300;
thingY=300;
a=0;
s=0;
  gameState = GAME_START;
}
void draw(){
  
bgX+=1;
      bgQ+=1;
    if(bgX==0){
      bgQ =-640;
    }
    if(bgQ==0){
      bgX = -640;
    }
     image(backgroundImg1,bgX,0);
     image(backgroundImg2,bgQ,0);
      if(upPressed){
       fighterY -=speed;
     }
     if(downPressed){
       fighterY += speed;
     }
     if(leftPressed){
       fighterX -= speed;
     }
     if(rightPressed){
       fighterX += speed;
     }
     //no over
     if(fighterY > 480){
       fighterY = 0;
     }
     if(fighterY < 0){
       fighterY = 480;
     }
     if(fighterX >640){
       fighterX = 0;
     }
     if(fighterX < 0){
       fighterX = 640;
     }
     image(shipImg1,fighterX,fighterY);      
     image(thing,thingX,thingX);
       fill(255,0,0);
   rect(5,0,rectX,rectY);
   image(blood,blood1,blood2);
  
//background
 switch(gameState){
    case GAME_START:
 for (int i=0;i<COUNT;i++){
      image(shipImg2,enemyX-40,enemyY);
      image(shipImg2,enemyX-80,enemyY);
      image(shipImg2,enemyX-120,enemyY);
      image(shipImg2,enemyX-160,enemyY);
      image(shipImg2,enemyX-200,enemyY);
 } 
 enemyX+=3;
if(enemyX-200 > 640){    
  gameState = GAME_RUN;
   }
    break;
    case GAME_RUN:
       for (int i=0;i<COUNT;i++){
      image(shipImg2,enemyQ-40,enemyW);
      image(shipImg2,enemyQ-80,enemyW+40);
      image(shipImg2,enemyQ-120,enemyW+80);
      image(shipImg2,enemyQ-160,enemyW+120);
      image(shipImg2,enemyQ-200,enemyW+160);
 }
    enemyQ+=3;
 if(enemyQ  >= 840 ){
    gameState = GAME_PP;
    }
break;
  case GAME_PP:
 for (int i=0;i<COUNT;i++){
      image(shipImg2,enemyX-40,enemyY);
      image(shipImg2,enemyX-80,enemyY);
      image(shipImg2,enemyX-120,enemyY);
      image(shipImg2,enemyX-160,enemyY);
      image(shipImg2,enemyX-200,enemyY);
 } 
 enemyX+=3;
 if(enemyX-200 == 640 ){
    gameState = GAME_RUN;
    }
    break;
 }
}


 void keyPressed(){
   if(key == CODED){
     switch(keyCode){
       case UP:
       upPressed = true;
       break;
       case DOWN:
       downPressed = true;
       break;
       case LEFT:
       leftPressed = true;
       break;
       case RIGHT:
       rightPressed = true;
       break;
     }
   }
}
void keyReleased(){
   switch(keyCode){
       case UP:
       upPressed = false;
       break;
       case DOWN:
       downPressed = false;
       break;
       case LEFT:
       leftPressed = false;
       break;
       case RIGHT:
       rightPressed = false;
       break;
   }
}
