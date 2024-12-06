class Racket {
  float x, y, width, height;
  float speed = 11;

  Racket(float x, float y, float width, float height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  void move(char key) {
    if (key == 'a' && x > 0) {
      x -= speed;
    } 
    else if (key == 'd' && x + width < 800) { // Ensure the right edge stays within the canvas width
      x += speed;
    }
  }

  boolean intersects(Ball ball) {
    return ball.x + 10 > x && ball.x < x + width
      && ball.y + 10 > y && ball.y < y + height;
  }

  void reset(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    fill(255);
    rect(x, y, width, height);
  }
}
