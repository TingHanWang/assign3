PImage startImg1;
PImage startImg2;
PImage shipImg1;
PImage shipImg2;
PImage backgroundImg1;
PImage backgroundImg2;
PImage blood;
PImage thing;
PImage lost1;
PImage lost2;
final int GAME_START=1,GAME_WIN=2,GAME_LOST=3,GAME_RUN=4;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
float speed = 5;
int gameState;
int x = 0;
int y = 150;
int z = 0;
int q = 640;
int s = 580;
int e = 240;
int r = 200;
int t = 20;
int u = 200;
int i = 300;
int rnd;
void setup (){
  size(640,480);
  gameState = GAME_START;
  startImg1 = loadImage("img/start1.png");
  startImg2 = loadImage("img/start2.png");
  shipImg1 = loadImage("img/fighter.png");
  shipImg2 = loadImage("img/enemy.png");
  backgroundImg1 = loadImage("img/bg1.png");
  backgroundImg2 = loadImage("img/bg2.png");
  blood = loadImage("img/hp.png");
  thing = loadImage("img/treasure.png");
  lost1 = loadImage("img/end1.png");
  lost2 = loadImage("img/end2.png");
  gameState = GAME_START;
 
  }
void draw(){
  x = x+5;
  z = z-3;
  q = q-3;
  
  switch(gameState){
    case GAME_START:
    image(startImg1,0,0);
    if(mouseX >= 200 && mouseX <= 400 && mouseY >= 380 && mouseY <= 430){
      if(mousePressed){
        gameState = GAME_RUN;
      }
      else{
       image(startImg2,0,0);
      }
    }
        r = 200;
        x = 0;
        y = 150;
        z = 0;
        q = 640;
        s = 580;
        e = 240;
        r = 200;
        t = 20;
        u = 200;
        i = 300;
      break;
    case GAME_RUN:
    //background
    if(q<=0){
      z = q+640;
    }
    if(z<=0){
      q = z+640;
    }
     image(backgroundImg1,z,0);
     image(backgroundImg2,q,0);
     //fighter
     if(upPressed){
       e -=speed;
     }
     if(downPressed){
       e += speed;
     }
     if(leftPressed){
       s -= speed;
     }
     if(rightPressed){
       s += speed;
     }
     //no over
     if(e > 480){
       e = 0;
     }
     if(e < 0){
       e = 480;
     }
     if(s >640){
       s = 0;
     }
     if(s < 0){
       s = 640;
     }
     image(shipImg1,s,e);
     //enemy
     if(e >= y){
     y = y+2;
     }
     if(e <= y){
     y = y-2;
     }
     if(y > 480){
       y = 0;
     }
     if(y < 0){
       y = 480;
     }
     if(x >640){
       x = 0;
       y = rnd = (int)random(430)+1;
     }
     if(x < 0){
       x = 640;
       
     }
    
     image(shipImg2,x,y);
     
     if(s >= u && s <= u+20 && e >= i && e <= i+20 ){
       r = r+50;
       if((s+30) >= u && (s+30) <= u+20 && (e+30) >= i && (e+30) <= i+20){
         r = r+50;
       }
       if(r>=200){
       r = 200;
       }
       u = rnd = (int)random(600)+1;
       i = rnd = (int)random(430)+1;
     }
      if(s >= x && s <= x+30 && e >= y && e <= y+30 ){
       r = r-50;
       x = 0;
       y = rnd = (int)random(430)+1;
     }
     if(r==0){
       gameState = GAME_LOST;
     }
      fill(255,0,0);
     rect(5,0,r,t);
     image(blood,0,0);
     image(thing,u,i);
     break;
     case GAME_LOST:
     image(lost1,0,0);
     if(mouseX >= 200 && mouseX <= 400 && mouseY >= 300 && mouseY <= 350){
      if(mousePressed){
        gameState = GAME_START;
      }else{
        image(lost2,0,0);
      }
     break;
     }
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
