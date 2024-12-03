Brick[][] bricks;
int rows = 5;
int cols = 10;
int brickHits = 1;
boolean gameOver = false;
Ball ball;
Racket racket;

void setup() {
  size(800, 600);
  frameRate(60);
  ball = new Ball(300, 300, 10);
  racket = new Racket(350, 550, 100, 10);
  bricks = new Brick[rows][cols];
  initializeBricks();
}

void draw() {
  background(0);
  if (!gameOver) {
    ball.move();
    checkCollisions();
    if (ball.y > height) {
      gameOver = true;
      resetGame();
    }
  }
  ball.display();
  racket.display();
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      if (bricks[row][col] != null) {
        bricks[row][col].display();
      }
    }
  }
}

void keyPressed() {
  racket.move(key);
}

void initializeBricks() {
  int startX = 50;
  int startY = 50;
  int brickWidth = 60;
  int brickHeight = 20;
  int space = 10;

  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      bricks[row][col] = new Brick(
        startX + (brickWidth + space) * col,
        startY + (brickHeight + space) * row,
        brickWidth,
        brickHeight,
        brickHits
      );
    }
  }
}

void checkCollisions() {
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      Brick brick = bricks[row][col];
      if (brick != null && ball.intersects(brick)) {
        brick.hit();
        ball.reverseY();
        if (!brick.isVisible()) {
          bricks[row][col] = null; // Remove the brick when it is destroyed
        }
        break; // Prevent multiple collisions in one frame
      }
    }
  }

  if (racket.intersects(ball)) {
    ball.reverseY();
  }
}

void resetGame() {
  ball.reset(300, 300);
  racket.reset(350, 550);
  brickHits++;
  initializeBricks();
}
