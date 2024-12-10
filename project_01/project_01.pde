Brick[][] bricks;
int rows=5;
int cols=10;
int brickHits=1;
boolean gameOver=false;
Ball ball;
Racket racket;

void setup(){
  size(800,600);
  frameRate(60);
  ball=new Ball(300,300,10);
  racket=new Racket(350,550,120,15);
  bricks=new Brick[rows][cols];
  initializeBricks();
}

void draw(){
  background(0);
  if(!gameOver){
    ball.move();
    checkCollisions();
    if(ball.y>height){
      gameOver=true;
      resetGame();
    }
  }
  ball.display();
  racket.display();
  for(int row=0;row<rows;row++){
    for(int col=0;col<cols;col++){
      if(bricks[row][col]!=null){
        bricks[row][col].display();
      }
    }
  }
}

void keyPressed(){
  racket.move(key);
}

void initializeBricks(){
  int startX=50;
  int startY=50;
  int brickWidth=60;
  int brickHeight=20;
  int space=10;

  for(int row=0;row<rows;row++){
    for(int col=0;col<cols;col++){
      bricks[row][col]=new Brick(
        startX+(brickWidth+space)*col,
        startY+(brickHeight+space)*row,
        brickWidth,
        brickHeight,
        brickHits
      );
    }
  }
}

void checkCollisions(){
  for(int row=0;row<rows;row++){
    for(int col=0;col<cols;col++){
      Brick brick=bricks[row][col];
      if(brick!=null&&ball.intersectsExact(brick)){
        String collisionSide=ball.getCollisionSide(brick);
        if(collisionSide.equals("top")||collisionSide.equals("bottom")){
          ball.reverseY();
        }else if(collisionSide.equals("left")||collisionSide.equals("right")){
          ball.reverseX();
        }
        brick.hit();
        if(!brick.isVisible()){
          bricks[row][col]=null;
        }
        break;
      }
    }
  }
  if(racket.intersects(ball)){
    if(ball.y+ball.diameter>racket.y){
      ball.reverseY();
    }else if(ball.x+ball.diameter>racket.x&&ball.x<racket.x+racket.width){
      ball.reverseX();
    }
  }
}

void resetGame(){
  ball.reset(300,300);
  racket.reset(350,550);
  brickHits++;
  initializeBricks();
  gameOver=false;
}
