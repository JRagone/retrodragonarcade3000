import ddf.minim.*;
//duckhunt
  //declaring all images and sounds
  PImage back;
  PImage leftblkdn;
  PImage leftblkup;
  PImage rightblkdn;
  PImage rightblkup;
  PImage crosshair;
  PImage fallingdk;
  PImage shotdk;
  PFont font;
  PImage dog;
  int score = 0;
  int sequence=0;
  import ddf.minim.*;
  AudioPlayer file;
  AudioPlayer intro;
  AudioPlayer doglaugh;
  int allDead;
  boolean laughSound=true;
  int ducks;
  //array of ducks
  duck[] duckHunter;
  
//breakout_
  //ball starting position
  float x2;
  int y2;
  //speed of the ball
  int Vel;
  //ball offset
  float Vel2;
  //array of blocks 
  boolean[] bloc;
  int[] blockx;
  //lives
  int lives;
  //block count
  int bc;
  PFont game;
  
//mario
  AudioPlayer marioBackgroundMusic;
  AudioPlayer marioJump;
  AudioPlayer lifeLostSound;
  AudioPlayer gameOverSound;
  AudioPlayer arcadeMusic;
  AudioPlayer coinCollect;
  AudioPlayer courseClear;
  Minim minim;
  
  //Goomba Images
  PImage goombaBaseImage;
  PImage rGoomba;
  PImage sGoomba;
  
  //Goomba Variables
  float goombaX;
  float goombaXV;
  float goombaY;
  
  //General Variables
  PFont baseFont;
  PImage emptySpace;
  
  //homeScreen Variables
  boolean startSound = true;
  PFont homeFont;
  int gameScreen = 0;
  float textX;
  float titleY;
  float duckHomeY;
  float breakoutHomeY;
  float marioHomeY;
  
  //homeScreen Images
  PImage homeBackground;
  
  //Background Images
  PImage marioBackground;
  PImage marioStart;
  
  //Background Variables
  int startScreenHold = 1;
  
  //Game Over Images
  PImage frozenLifeLostBackground;
  PImage gameOverScreen;
  PImage timeUpScreen;
  PImage continueEnd;
  PImage pointer;
  PImage notDeadYet;
  PImage angelMario;
  
  //Game Over Variables
  boolean timeUpSetup = true;
  boolean gameOverSetup = true;
  boolean notDeadSetup = true;
  boolean pointerUp = true;
  float pointerY;
  
  //HUD Images
  PImage marioHUDHeader;
  PImage coinHUD;
  PImage timeHUD;
  PImage xHUD;
  
  //HUD Variables
  int coinCollectCount = 0;
  int totalTime = 100;
  float timer = totalTime;
  int displayTimer = (int) Math.ceil(timer);
  int startLives = 3;
  int lifeCount = startLives;
  int storeLives;
  
  //Player Images
  PImage mario;
  PImage sMario;
  PImage rMario;
  PImage uMario;
  PImage cMario;
  PImage jMario;
  PImage fMario;
  
  //Player Variables
  boolean marioStartGame = true;
  boolean startAnimation = false;
  boolean stopTracking = false;
  boolean mirror = false;
  boolean running = false;
  boolean goRight = false;
  boolean goLeft = false;
  boolean wentLeft = false;
  boolean lookUp = false;
  boolean crouch = false;
  boolean jump = false;
  boolean playOnce = true;
  boolean alternateStart = true;
  float marioX = 2; //Set to this in order that it is smaller than goalPostX and does not return true for levelComplete()
  float mX;
  float oppositeMX;
  float mXV;
  float mY;
  float mYV;
  float mA;
  float fractionVel;
  int alternate;
  
  //Gravity Variables
  float y;
  float v;
  
  //world Images
  PImage ground;
  PImage belowGround;
  PImage belowGroundSide;
  PImage groundRCorner;
  PImage goalPost;
  
  //world Variables
  boolean groundIndexFirst = true;
  boolean victoryOnce = true;
  float gX = 0.0;
  float gY;
  float haltCreation;
  float restartCreation;
  int level = 1;
  float[] groundArray;
  float[] groundArray2;
  float goalPostX = 5;
  
  //coin Images
  PImage[] coinDisplayed;
  PImage coinSpin1;
  PImage coinSpin2;
  PImage coinSpin3;
  PImage coinSpin4;
  
  //coin Variables
  float indCoinX;
  float[] coinX;
  float[] coinY;
  int coinFrame;
  int initialCoinFrame;
  int coinSpin;
  boolean coinSound = false;
  boolean coinStart = true;
  float coinTop;
  float coinBottom;
  float coinLeft;
  float coinRight;
  
  player Mario = new player();
  ground Ground = new ground();
  coin Coins = new coin();
  HUD HUD = new HUD();
  pointerArrow pointerArrow = new pointerArrow();
  goalPost goal = new goalPost();
  goomba Goomba = new goomba();
  
  /*
    Mario Information -
      Mario image Dimensions:
        sMario: 500 x 714 from 14 x 20
        rMario: 500 x 667 from 15 x 19
        uMario: 500 x 700 from 15 x 21
        cMario: 500 x 467 from 15 x 14
        jMario: 500 x 688 from 16 x 22
        jMario: 500 x 625 from 16 x 20
  */

void setup(){
  size(800,750);
  minim = new Minim(this);
  //duckhunt
    //loading images and sound files
    back = loadImage("background.gif");
    leftblkdn = loadImage("leftblkdown.gif");
    leftblkup = loadImage("leftblkup.gif");
    rightblkdn = loadImage("rightblkdown.png");
    rightblkup= loadImage("rightblkup.gif");
    crosshair= loadImage("crosshair.png");
    fallingdk= loadImage("fallingdk.png");
    shotdk = loadImage("shotdk.png");
    font= createFont("prstartk.ttf",20);
    intro = minim.loadFile("intro.mp3",2048);
    dog = loadImage("doglaugh.gif");
    doglaugh = minim.loadFile("laugh.mp3",2048);
    //set volume of laugh
    doglaugh.setGain(50);
  
  //breakout
    lives= 3;
     Vel = 10;
     y2 = 400;
     x2= 400;
     bc=0;
     bloc = new boolean[800];
     for(int n=0; n<800;n++){
       bloc[n]=true;
     }
     blockx = new int[50];
     blockx[0]=0;
     for(int n=1;n<=49;n++){
       blockx[n]=blockx[n-1]+200;
     }
  
  //mario
    //General Font
    baseFont = createFont("Super-Mario-World.ttf", 28);
    
    //General Images
    emptySpace = loadImage("emptySpace.png");
    
    //Home Music
    arcadeMusic = minim.loadFile("ArcadeMusic.mp3", 2048);
    
    //Home Images
    homeBackground = loadImage("Arcade.jpg");
    
    //Home Font
    homeFont = createFont("prstart.ttf", 14);
    
    //Play Music
    marioBackgroundMusic = minim.loadFile("SuperMarioWorld.mp3", 2048);
    marioJump = minim.loadFile("marioJump.mp3", 2048);
    lifeLostSound = minim.loadFile("smw_lost_a_life.wav", 2048);
    courseClear = minim.loadFile("smw_course_clear.wav", 2048);
    
    //Load Goomba Sprites
    sGoomba = loadImage("sGoomba.png");
    rGoomba = loadImage("rGoomba.png");
    
    //Load Mario Sprites
    sMario = loadImage("stationaryMario.png");
    rMario = loadImage("runningMario.png");
    uMario = loadImage("lookingUpMario.png");
    cMario = loadImage("crouchingMario.png");
    jMario = loadImage("jumpingMario.png");
    fMario = loadImage("fallingMario.png");
    
    //Load Background Sprites
    marioStart = loadImage("marioStartScreen.png");
    marioBackground = loadImage("YoshiWorldBackground.png");
    ground = loadImage("GroundTile.png");
    belowGround = loadImage("BelowGroundTile.png");
    belowGroundSide = loadImage("belowGroundSide.png");
    groundRCorner = loadImage("rightGroundEndBlock.png");
    goalPost = loadImage("goalPost.png");
    
    //Load Coin Sprites
    coinSpin1 = loadImage("coinSpin1.png");
    coinSpin2 = loadImage("coinSpin2.png");
    coinSpin3 = loadImage("coinSpin3.png");
    coinSpin4 = loadImage("coinSpin4.png");
    
    //Load UI Sprites
    coinHUD = loadImage("coinHUD.png");
    timeHUD = loadImage("timeHUDSprite.png");
    marioHUDHeader = loadImage("marioHUDHeader.png");
    xHUD = loadImage("xHUD.png");
    
    //Load Gameover Sprites
    gameOverScreen = loadImage("gameOver.png");
    timeUpScreen = loadImage("timeUp.png");
    continueEnd = loadImage("continueEnd.png");
    pointer = loadImage("pointer.png");
    notDeadYet = loadImage("notGameOver.png");
    angelMario = loadImage("angelMario.png");
}

//breakout
  void bloc(int x,int y, int n){
     rectMode(CENTER);
     if(bloc[n]==true){
       rect(x,y,200,30);
       if(x2>x-100 && x2<x+100 && y2>y-15 && y2<y+15){
         bloc[n]=false;
         bc=bc+1;
         bounce();
         //ball bouncing off of the rectangles
       }
     }
   }
     
  
  void bounce(){
    Vel=-Vel;
  }
  //platform to bounce off
  void platform(int platformx, int platformy){
    fill(255,255,255);
    rectMode(CENTER);
    rect(platformx,platformy,125,15);
      
  }
  
  //ball setup
  void ball(){
    fill(255);
    ellipse(x2,y2,25,25);
    y2=y2+Vel;
    x2=x2+Vel2;
  }

void draw(){
  //duckhunt
    if(gameScreen==1){
      textAlign(CORNER);
      textFont(font);
      //all these if statements are checking what screen it should draw
      //start screen
      if(sequence==0){
        doglaugh.pause();
        if(startSound){
          intro.loop();
          startSound=false;
        }
        image(back,0,0,width,height);
        fill(0);
        textSize(35);
        text("Welcome to Duck Hunt", 75,300);
        textSize(25);
        text("Select Difficulty", 200,350);
        textSize(20);
        text("Baby",350,400);
        text("Almost There", 275,450);
        text("Arcade Master", 275, 500);
      }
      //game over screen
      if(sequence==3){
        intro.pause();
        image(back,0,0,width,height);
        fill(0);
        textSize(35);
        text("Game Over", 250,200);
        textSize(25);
        text("Score:"+score,290,250);
        text("Return to Menu", 250,275);
        text("Return to Main Menu",200, 350);
        image(dog,350,510,100,100);
        if(laughSound){
          doglaugh.loop();
          laughSound=false;
        }
      }
      //playing screen
      else if(sequence==1){
      noCursor();
      intro.pause();
      image(back,0,0,width,height);
      for(duck d : duckHunter){
        d.renderDuck();
      }
      imageMode(CENTER);
      image(crosshair,mouseX,mouseY,20,20);
      imageMode(CORNER);
      fill(0);
      text("Score:"+score,0,40);
      for(int i =0; i<duckHunter.length; i++){
        if(duckHunter[i].ypos+40<0){
          cursor(ARROW);
          sequence = 3;
          laughSound=true;
        }
        //looking to see if they are all dead
        println(allDead);
        if(allDead==duckHunter.length){
          cursor(ARROW);
          sequence=3;
          allDead=0;
          laughSound=true;
        }
      }
      }
    }
  
  //breakout
    if(gameScreen==2){
      background(0,0,0);
      platform(mouseX, height-40);
      textFont(homeFont);
      textAlign(CORNER);
      ball();
        if(y2+20 == height-40 && x2>mouseX-140 && x2<=mouseX+140){
          bounce();
          Vel2=(x2-mouseX)/25; 
          //makes the ball bounce off the paddle at an angle
      }
        if(y2<=0){
          bounce();
        }
        if(x2>=width && y2<height){
          Vel2=-(x2-height/2)/120;
           //makes the ball bounce off the paddle at an angle
        }
        if(x2<=0 && y2<height){
          Vel2=-(x2-height/2)/120;
           //makes the ball bounce off the paddle at an angle
        }
        //row 6 of blocks
        fill(255,0,0);
        for(int n=0; n<50; n=n+1){
          bloc(blockx[n],20,n);
        }
        //row 5
        fill(255,160,0);
        for(int n=0; n<50; n=n+1){
          bloc(blockx[n],40,n+200);
        }
        //row 4
        fill(255,255,0);
        for(int n=0; n<50; n=n+1){
          bloc(blockx[n], 60, n+300);
        }
        //row 3
        fill(0,255,0);
        for(int n=0; n<50; n=n+1){
          bloc(blockx[n], 80, n+400);
        }
        //row 2
        fill(0,0,255);
        for(int n=0;n<50;n=n+1){
          bloc(blockx[n],100,n+500);
        }
        //row 1
        fill(255,0,255);
        for(int n=0;n<50;n=n+1){
          bloc(blockx[n],120,n+600);
        }
        if(y2>height){
          x2=400;
          y2=400;
          lives=lives-1;
        }
        if(lives==3){
          text("You have "+lives+" lives left",50,740);
        }
        else if(lives==1){
          text("You have "+lives+" life left",50,740);
        }
        else if(lives==2){
           text("You have "+lives+" lives left",50,740);
        }
        if(lives==0){
          text("You",620,725);
          text("died!",700,725);
          y2=height;
          Vel=0;
          Vel2=0;
          text("Return to menu", 275,400);
          text("Restart",275,450);
        }
        if(bc==30){
          text("You", 620,725);
          text("win!",700,725);
          y2=height;
          Vel=0;
          Vel2=0;
          text("Return to menu", 275,400);
          text("Restart",275,450);
        } 
        if(bc==30){
        if(mousePressed==true){
          if(mouseX>280&&mouseX<420&&mouseY>430&&mouseY<450){
            for(int n=0; n<800;n++){
            bloc[n]=true;
            }
            x2=400;
            y2=400;
            Vel=10;
            lives=3;
            bc=0;
          }
          if(mouseX>280&&mouseX<480&&mouseY>380&&mouseY<400){
            for(int n=0; n<800;n++){
              bloc[n]=true;
            }
            x2=400;
            y2=400;
            Vel=10;
            lives=3;
            bc=0;
            gameScreen = 0;
            arcadeMusic.play();
          }
        }
        }
        if(lives==0){
          if(mousePressed==true){
            if(mouseX>280&&mouseX<420&&mouseY>430&&mouseY<450){
              for(int n=0; n<800;n++){
              bloc[n]=true;
              }
              x2=400;
              y2=400;
              Vel=10;
              lives = 3;
              bc = 0;
            }
            if(mouseX>280&&mouseX<480&&mouseY>380&&mouseY<400){
              for(int n=0; n<800;n++){
                bloc[n]=true;
              }
              x2=400;
              y2=400;
              Vel=10;
              lives=3;
              bc=0;
              gameScreen = 0;
              arcadeMusic.play();
            }
          }
        }
    }
  
  //mario
    if(gameScreen==0){
      if(startSound){
        arcadeMusic.setGain(-3);
        arcadeMusic.loop();
        startSound = false;
      }
      image(homeBackground, 0, 0, width, height);
      textX = width*.52;
      titleY = height*.2;
      duckHomeY = titleY + height*.08;
      breakoutHomeY = titleY + height*.13;
      marioHomeY = titleY + height*.18;
      fill(255);
      textFont(homeFont);
      textAlign(CENTER);
      textSize(15);
      fill(68,108,8);
      text("Retro Dragon Arcade 3000 2016", textX, titleY);
      fill(255);
      textSize(14);
      text("Duck Hunt", textX, duckHomeY);
      text("Breakout", textX, breakoutHomeY);
      text("Mario", textX, marioHomeY);
      if(mouseY<=duckHomeY+5 && mouseY>=duckHomeY-10 && mouseX>width*.35 && mouseX<width*.65){
        fill(105, 180, 35);
        text("Duck Hunt", textX, duckHomeY);
        fill(255);
        if(mousePressed){
          gameScreen = 1;
          arcadeMusic.pause();
          startSound = true;
        }
      }
      if(mouseY<=breakoutHomeY+5 && mouseY>=breakoutHomeY-10 && mouseX>width*.35 && mouseX<width*.65){
        fill(105, 180, 35);
        text("Breakout", textX, breakoutHomeY);
        fill(255);
        if(mousePressed){
          gameScreen = 2;
          arcadeMusic.pause();
        }
      }
      if(mouseY<=marioHomeY+5 && mouseY>=marioHomeY-10 && mouseX>width*.35 && mouseX<width*.65){
        fill(105, 180, 35);
        text("Mario", textX, marioHomeY);
        fill(255);
        if(mousePressed){
          gameScreen = 3;
          arcadeMusic.pause();
        }
      }
    }
    if(gameScreen==3){
      
      if(startScreenHold<=40){
        image(marioStart, 0, 0, width, height);
        startScreenHold++;
        if(startScreenHold==40){
          tint(255, 127);
        }
        if(startScreenHold==15){
          marioBackgroundMusic.loop();
        }
      }
      //Main draw
      else if(!Mario.levelComplete() && !Mario.lifeLost() && !lifeLostSound.isPlaying() && displayTimer!=0  && !courseClear.isPlaying()){
        //Draw sprites
        image(marioBackground, mX/3 - width*.5, -height, width*2, height*2);
        image(marioBackground, width*2+(mX/3 - width*.5), -height, width*2, height*2);
        tint(255);
        goal.creation();
        Ground.creation();
        Coins.creation();
        Coins.animate();
        //Goomba.creation();
        //Goomba.move();
        Mario.creation();
        Mario.movement();
        Mario.lifeLost();
        Mario.levelComplete();
        Coins.collect();
        HUD.creation();
      }
      
      //If out of lives
      else if(!lifeLostSound.isPlaying() && lifeCount==0){
        if(gameOverSetup){
          gameOverSound = minim.loadFile("smw_game_over.wav", 2048);
          gameOverSound.setGain(10);
          gameOverSound.play();
          gameOverSetup = false;
        }
        if(gameOverSound.isPlaying()){
          image(gameOverScreen, 0, 0, width, height);
        }
        else{
          reset();
          gameScreen = 0;
          arcadeMusic.loop();
        }
      }
      
      //If lost a life
      else if(Mario.lifeLost() && !lifeLostSound.isPlaying()){
        image(frozenLifeLostBackground, 0, 0);
        image(notDeadYet, 0, 0, width, height);
        angelMario.resize(0,55);
        image(angelMario, width*.14, height*.1);
        text(lifeCount, width*.3, height*.165);
        pointerArrow.creation();
        pointerArrow.shift();
        if(keyPressed){
          if(key=='x' || key=='X'){
            if(pointerUp){
              storeLives = lifeCount;
              reset();
              lifeCount = storeLives;
            }
            if(!pointerUp){
              reset();
              gameScreen = 0;
              arcadeMusic.loop();
            }
          }
        }
      }
      
      //If out of time
      else if(displayTimer<=0){
        if(timeUpSetup){
          marioBackgroundMusic.pause();
          gameOverSound = minim.loadFile("smw_game_over.wav", 2048);
          gameOverSound.setGain(10);
          gameOverSound.play();
          timeUpSetup = false;
        }
        if(gameOverSound.isPlaying()){
          image(timeUpScreen, 0, 0, width, height);
        }
        else{
          reset();
          gameScreen = 0;
          arcadeMusic.loop();
        }
      }
      
      //If level complete
      else if(Mario.levelComplete() && !courseClear.isPlaying()){
        reset();
        gameScreen = 0;
        arcadeMusic.loop();
      }
    }
}
//duckhunt
  class duck{
    int alternateDuckFlightLeft = 3;
    int alternateDuckFlightRight = 3;
    int counter =0;
    boolean alternateL =true;
    boolean alternateR =true;
    float xpos;
    float ypos;
    boolean leftorright;

    boolean shot;
    int speedx;
    float speedy;
    //constructor                                  what dir      is it dead?
    public duck(float x, float y, int x2,float y2, boolean face, boolean dead){
      xpos=x;
      ypos=y;
      leftorright=face;
      shot = dead;
      speedx=x2;
      speedy=y2;
    }
    //draws the duck
    public void renderDuck(){
      if(!shot){
        if(leftorright){
          if(alternateDuckFlightLeft<5){
            image(leftblkdn,xpos,ypos,50,50);
          }
          else{
            image(leftblkup,xpos,ypos,50,50);
          }
          if(alternateDuckFlightLeft>9){
            alternateDuckFlightLeft = 0;
          }
          alternateDuckFlightLeft++;
          xpos=xpos-speedx;
          
        }
        if(!leftorright){
          if(alternateDuckFlightRight<5){
          image(rightblkup,xpos,ypos,50,50);
          }
          else{
          image(rightblkdn,xpos,ypos,50,50);
          }
          if(alternateDuckFlightRight>9){
            alternateDuckFlightRight = 0;
          }
          alternateDuckFlightRight++;
          xpos=xpos+speedx;
        }
        ypos=ypos-speedy;
        if(xpos+40>width||xpos<0){
          if(leftorright){
            leftorright=false;
          }
          else if(!leftorright){
            leftorright=true;
          }
        }
      }
      else if (shot){
        if(counter<10){
          image(shotdk, xpos,ypos,50,50);
          counter++;
          print(counter);
        }
        if(counter>=10){
          image(fallingdk,xpos,ypos,50,50);
          ypos=ypos+5;
      }
    } 
  }
  }

//mario
  class goomba extends gravityObject {
    
    boolean start = true;
    
    goomba(){
    }
    
    void creation(){
      imageMode(CORNER);
      if(start){
        goombaBaseImage = sGoomba;
        goombaBaseImage.resize(0,40);
        goombaX = width*2;
        goombaXV = width/200;
        goombaY = groundHeight(goombaX) - goombaBaseImage.height;
        start = false;
      }
      goombaBaseImage.resize(0,40);
      
      gravity(goombaX, goombaY, 0, goombaBaseImage);
      image(goombaBaseImage, goombaX, goombaY);
    }
    
    void move(){
      goombaX-= goombaXV;
      goombaBaseImage = alternateImages(4, goombaBaseImage, rGoomba, false, sGoomba);
    }
    
  }

  class goalPost {
    
    goalPost(){
    }
    
    void creation(){
      goalPostX = mX + width*2.5;
      goalPost.resize(0, 400);
      image(goalPost, goalPostX, height - height*.12 - goalPost.height);
    }
    
  }
  
  void reset(){
    
    lifeCount = startLives;
    playOnce = true;
    victoryOnce = true;
    
    gameOverSetup = true;
    timeUpSetup = true;
    
    goalPostX = width*.6;
    
    mirror = false;
    mX = width*.5;
    oppositeMX = width*.5;
    mY = gY - mario.height/width/(width/45);
    startScreenHold = 1;
    marioBackgroundMusic.rewind();
    
    coinCollectCount = 0;
    coinStart = true;
    
    timer = totalTime;
    displayTimer = (int) Math.ceil(timer);
    
  }
  
  class pointerArrow{
    
    pointerArrow(){
    }
    
    void creation(){
      pointer.resize(0,32);
      if(pointerUp){
        pointerY = height*.49;
      }
      else{
        pointerY = height*.57;
      }
       image(pointer, width*.3, pointerY);
    }
    
    void shift(){
      if(keyPressed){
        if(keyCode==UP && !pointerUp){
          pointerUp = true;
        }
        else if(keyCode==DOWN && pointerUp){
          pointerUp = false;
        }
      }
    }
    
  }
  
  class player extends gravityObject {
    
    boolean start = true;
    
    player(){
    }
    
    void creation(){
      
      imageMode(CORNER);
      
      if(start){
        mario = sMario;
        mX = width*.5;
        oppositeMX = width*.5;
        marioX = width*.5;
        mY = gY - mario.height/width/(width/45);
        mXV = width/60;
        alternate = 4;
        fractionVel = mXV*.5;
        start=false;
      }
      if(mario==sMario || mario==rMario){
        mario.resize(0, 65);
      }
      
      //Center mario image
      if(mario==uMario && !stopTracking){
        if(mirror){
          marioX=width*.5+3;
        }
        else{
          marioX=width*.5-3;
        }
      }
      else if(!stopTracking){
        marioX = width*.5;
      }
      
      mY = gravity(oppositeMX, mY, mYV, mario)[0];
      mYV = gravity(oppositeMX, mY, mYV, mario)[1];
      
      //Mirror sprite
      if(mirror){
        pushMatrix();
        scale(-1, 1);
        image(mario, -marioX - width/(width/45), mY);
        popMatrix();
        mirror = false;
      }
      else{
        image(mario, marioX, mY);
      }
      
      if(wentLeft){
        mario = sMario;
        mirror = true;
      }
      else{
        mario = sMario;
      }
    }
    
    void movement(){
      if(lookUp){
        mirrorCheck();
        stayStill();
        if(mY == groundHeight(oppositeMX) - mario.height){
          mY = groundHeight(oppositeMX);
        }
        mario = uMario;
        lookUpResize();
      }
      if(crouch){
        mirrorCheck();
        stayStill();
        if(mY == groundHeight(oppositeMX) - mario.height){
          mY = groundHeight(oppositeMX);
        }
        mario = cMario;
        mario.resize(0, 45);
      }
      if(goRight){
        wentLeft = false;
        running = true;
        mario = alternateImages(2, mario, rMario, true, sMario);
        if(!stopTracking){
          mX-=mXV;
        }
        else{
          marioX+=mXV;
        }
        oppositeMX+=mXV;
      }
      if(mX-width*.5>=0){
        stopTracking = true;
      }
      if(marioX>width*.5){
        marioX = width*.5;
        stopTracking = false;
      }
      if(goLeft){
        if(goRight){
          stayStill();
        }
        mirror = true;
        wentLeft = true;
        mario = alternateImages(2, mario, rMario, true, sMario);
        //accelerateRun();
        if(!stopTracking){
          mX+=mXV;
          oppositeMX-=mXV;
        }
        else if(marioX - mXV>=0){
          marioX-=mXV;
          oppositeMX-=mXV;
        }
        
      }
      if(jump && mY == groundHeight(oppositeMX) - mario.height){
        mirrorCheck();
        mario = jMario;
        jumpResize();
        mYV = -height/15;
        marioJump = minim.loadFile("marioJump.mp3", 2048);
        marioJump.play();
      }
      if(mY<groundHeight(oppositeMX)-mario.height*1.1 && mario!=cMario && mYV<0){
        mario = jMario;
        jumpResize();
      }
      if(mY<groundHeight(oppositeMX)-mario.height*1.1 && mario!=cMario && mYV>=0){
        mario = fMario;
        fallResize();
      }
    }
    
    void fallResize(){
      mario.resize(0, 65);
    }
    
    void jumpResize(){
      mario.resize(0, 70);
    }
    
    void lookUpResize(){
      mario.resize(0,68);
    }
    
    void accelerateRun(){
      if(fractionVel<mXV){
        fractionVel+=mXV*.05;
      }
      mX+=fractionVel;
    }
    
    void stayStill(){
      goRight = false;
      goLeft = false;
      jump = false;
    }
    
    void mirrorCheck(){
      if(wentLeft){
        mirror = true;
      }
    }
    
    boolean lifeLost(){
      if(mY>height){
        if(playOnce){
          lifeCount-=1;
          frozenLifeLostBackground = get();
          marioBackgroundMusic.pause();
          lifeLostSound = minim.loadFile("smw_lost_a_life.wav", 2048);
          lifeLostSound.setGain(10);
          lifeLostSound.play();
          playOnce = false;
        }
        return true;
      }
      return false;
    }
    
    boolean levelComplete(){
      if(marioX>=goalPostX + goalPost.width/4){
        if(victoryOnce){
          marioBackgroundMusic.pause();
          courseClear = minim.loadFile("smw_course_clear.wav", 2048);
          courseClear.setGain(10);
          courseClear.play();
          victoryOnce = false;
        }
        return true;
      }
      return false;
    }
    
  }
  
  class gravityObject {
    
    gravityObject(){
    }
    
    float[] gravity(float x, float y, float v, PImage sprite){
      if(y+v<=groundHeight(x) - sprite.height){
        y+=v;
        if(sprite==cMario){
          v+=10;
        }
        else{
          v+=6;
        }
      }
      else if(sprite!=rMario) {
        y = groundHeight(x) - sprite.height;
      }
      float[] yAndV = {y, v};
      return yAndV;
    }
    
  }
  
 PImage alternateImages(int frequency, PImage baseImage, PImage firstImage, boolean bounce, PImage secondImage){
    if(alternateStart){
      alternate = 0;
      alternateStart = false;
    }
    if(frequency-alternate>0){
      if(bounce){
        mY-=1;
      }
      alternate++;
      return firstImage;
    }
    else if(frequency+alternate<3*frequency){
      alternate++;
      if(frequency+alternate==3*frequency){
        alternateStart = true;
      }
      return secondImage;
    }
    return baseImage;
  }
  
  class HUD {
    
    boolean start = true;
    
    HUD(){
    }
    
    void creation(){
      
      //Mario Lives
      textFont(baseFont);
      marioHUDHeader.resize(0,24);
      image(marioHUDHeader, width*.08, height *.05);
      xHUD.resize(0, 24);
      image(xHUD, width*.11, height*.09);
      text(lifeCount, width*.2, height*.118);
      
      //Timer
      timeHUD.resize (0,24);
      image(timeHUD, width*.65, height*.055);
      fill(247, 215, 121);
      text(displayTimer, width*.705, height*.12);
      fill(255);
      if(displayTimer>0){
        timer-=1/frameRate;
        displayTimer = (int) Math.ceil(timer);
      }
      
      //Coins
      coinHUD.resize(0,24);
      image(coinHUD, width*.83, height*.055);
      text(coinCollectCount, width*.95, height*.083);
      
    }
    
  }
  
  class ground {
    
    int i;
    int gap = 180;
    boolean start = true;
    
    ground(){
    }
    
    void creation(){
      if(start){
        haltCreation = mX+width*1.5;
        groundArray = new float[3200];
        groundArray2 = new float[3200];
        for(int i = 0; i<groundArray.length; i++){
          groundArray[i] = height*2;
        }
        start = false;
      }
      groundIndexFirst = true;
      i = 0;
      restartCreation = mX+width*1.5+gap;
      for(level=1; level<=3; level++){
        for(gX = mX - width*.5; gX<=mX+haltCreation; gX+=width/15){
          gY = height - level*(height*.04);
          if(level==3){
            groundArray[i] = gY;
            i++;
            if(gX+width/15>mX+haltCreation){
              image(groundRCorner, gX, gY, width/15, height*.04);
            }
            else{
              image(ground, gX, gY, width/15, height*.04);
            }
          }
          else{
            if(gX+width/15>mX+haltCreation){
              image(belowGroundSide, gX, gY, width/15, height*.04);
            }
            else{
              image(belowGround, gX, gY, width/15, height*.04);
            }
          }
        }
        for(gX = restartCreation; gX<= mX+width*5; gX+=width/15){
          gY = height - level*(height*.04);
          if(level==3){
            if(groundIndexFirst){
              i+=gap/(width/15);
              //i 30->34
              groundIndexFirst=false;
            }
            groundArray[i] = gY;
            i++;
            if(gX==restartCreation){
              pushMatrix();
              scale(-1, 1);
              image(groundRCorner, -gX - width/15, gY, width/15, height*.04);
              popMatrix();
            }
            else{
              image(ground, gX, gY, width/15, height*.04);
            }
          }
          else{
            if(gX==restartCreation){
              pushMatrix();
              scale(-1, 1);
              image(belowGroundSide, -gX - width/15, gY, width/15, height*.04);
              popMatrix();
            }
            else{
              image(belowGround, gX, gY, width/15, height*.04);
            }
          }
        }
      }
    }
    
  }
  
  float groundHeight(float x){
    for(int i = 0; i<groundArray.length; i++){
      if(!wentLeft){
        if(x<=i*(width/15)+(width/15)/1.15 && x>=i*(width/15) - (width/15)/2){
          System.out.println(i);
          System.out.println(groundArray[i]);
          return groundArray[i];
        }
      }
      else{
        if(x<=i*(width/15)+(width/15)/2 && x>=i*(width/15) - (width/15)/2){
          System.out.println(i);
          System.out.println(groundArray[i]);
          return groundArray[i];
        }
      }
    }
    return height*2;
  }
  
  class coin {
    
    coin(){
    }
    
    void creation(){
      if(coinStart){
        coinX = new float[3];
        coinY = new float[3];
        coinDisplayed = new PImage[3];
        coinFrame = 1;
        coinSpin = -1;
        coinDisplayed[0] = coinSpin1;
        coinDisplayed[1] = coinSpin1;
        coinDisplayed[2] = coinSpin1;
        coinStart = false;
      }
      indCoinX = mX+600;
      for(int i = 0; i<coinX.length; i++){
        coinX[i] = indCoinX;
        indCoinX+=80;
        coinY[i] = groundHeight(coinX[i])-50;
      }
      for(int i = 0; i<coinX.length; i++){
        coinDisplayed[i].resize(0, 40);
        imageMode(CENTER);
        image(coinDisplayed[i], coinX[i], coinY[i]);
      }
    }
    
    void animate(){
      for(int i = 0; i<coinDisplayed.length; i++){
          if(coinFrame==1){
            if(coinDisplayed[i]!=emptySpace){
              coinDisplayed[i] = coinSpin1;
            }
            coinSpin = -coinSpin;
          }
          if(coinFrame==4){
            if(coinDisplayed[i]!=emptySpace){
              coinDisplayed[i] = coinSpin2;
            }
          }
          if(coinFrame==7){
            if(coinDisplayed[i]!=emptySpace){
              coinDisplayed[i] = coinSpin3;
            }
          }
          if(coinFrame==10){
            if(coinDisplayed[i]!=emptySpace){
              coinDisplayed[i] = coinSpin4;
            }
            coinSpin = -coinSpin;
          }
      }
      if(coinSpin==1){
        coinFrame++;
      }
      else{
        coinFrame--;
      }
    }
    
    void collect(){
      for(int i = 0; i<coinX.length; i++){
        coinTop = coinY[i] - coinSpin1.height;
        coinBottom = coinY[i] + coinSpin1.height/2;
        coinLeft = coinX[i] - coinSpin1.width/2;
        coinRight = coinX[i] + coinSpin1.width/2;
        if(marioX+mario.width>=coinLeft && marioX<=coinRight && mY<=coinBottom && mY>=coinTop && coinDisplayed[i]!=emptySpace){
          coinCollectCount++;
          coinCollect = minim.loadFile("coinCollect.wav", 2048);
          coinCollect.play();
          coinDisplayed[i] = emptySpace;
        }
      }
    }
    
  }
  
  //Use void keyPressed and booleans
  
  void keyPressed(){
    if(gameScreen==3){
      if(keyCode==RIGHT){
        goRight = true;
      }
      if(keyCode==LEFT){
        goLeft = true;
      }
      if(keyCode==UP){
        lookUp = true;
      }
      if(keyCode==DOWN){
        crouch = true;
      }
      if(!Mario.lifeLost()){
        if(key=='x' || key=='X'){
          jump = true;
        }
      }
    }
  }
  
  void keyReleased(){
    if(gameScreen==3){
      if(keyCode==RIGHT){
        goRight = false;
      }
      if(keyCode==LEFT){
        goLeft = false;
      }
      if(keyCode==UP){
        lookUp = false;
      }
      if(keyCode==DOWN){
        crouch = false;
      }
      if(key=='x' || key=='X'){
        jump = false;
      }
    }
  }
//duckhunt
  void mousePressed(){
    if(gameScreen==1){
      //shotgun sound
      file = minim.loadFile("gunshot.mp3",2048);
      file.play();
      //baby
      if(sequence==0&&mouseX<450&&mouseX>300&&mouseY>375&&mouseY<375+30){
        ducks = 10;
        duckHunter = new duck[ducks];
        //makes ducks
        for(int i=0; i<duckHunter.length;i++){
        duckHunter[i]= new duck(random(0,width-40),height,5,random(2,5),(Math.random()<.5),false);
      }
        sequence = 1;
      }
      //almost there
      if(sequence == 0 && mouseX<525&&mouseX>275&&mouseY<455&&mouseY>425){
        ducks = 20;
        duckHunter = new duck[ducks];
        
        for(int i=0; i<duckHunter.length;i++){
        duckHunter[i]= new duck(random(0,width-40),height,5,random(2,5),(Math.random()<.5),false);
      }
        sequence=1;
      }
      //arcade master
      if(sequence==0&&mouseX>275&&mouseX<535&&mouseY<505&&mouseY>475){
        
        ducks = 100;
        duckHunter = new duck[ducks];
        
        for(int i=0; i<duckHunter.length;i++){
        duckHunter[i]= new duck(random(0,width-40),height,5,random(2,5),(Math.random()<.5),false);
      }
        sequence=1;
      }
      //checking to see if ducks are shot
      if(sequence == 1){
      for(int i =0; i<duckHunter.length; i++){
        if(mouseX<duckHunter[i].xpos+50&&mouseX>duckHunter[i].xpos&&mouseY<duckHunter[i].ypos+50&&mouseY>duckHunter[i].ypos){
          if(duckHunter[i].shot==false){
            score = score+100;
            allDead++;
          }
          duckHunter[i].shot=true;
          
        }
      }
      }
      //going back to main menu
      if(sequence==3){
        if(mouseX>250&&mouseX<600&&mouseY>250&&mouseY<280){
          sequence= 0;
          score=0;
          allDead=0;
          startSound=true;
        }
        if(mouseX>200&&mouseX<700&&mouseY>325&&mouseY<355){
           gameScreen=0;
           doglaugh.pause();
           arcadeMusic.play();
           sequence=0;
           fill(255);
        }
      }
    }
    if(gameScreen==2){
      if(mouseX>400&&mouseX<680&&mouseY>400&&mouseY<420){
        gameScreen = 0; 
      }
    }
  }