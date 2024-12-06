class Ball {
  float x, y, diameter;
  float xVelocity = 3, yVelocity = -3;

  Ball(float x, float y, float diameter) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
  }

  void move() {
    x += xVelocity;
    y += yVelocity;

    if (x < 0 || x + diameter > width) {
      xVelocity = -xVelocity;
    }
    if (y < 0) {
      yVelocity = -yVelocity;
    }
  }

  void reverseY() {
    yVelocity = -yVelocity;
  }

  void reset(float x, float y) {
    this.x = x;
    this.y = y;
  }

  boolean intersects(Brick brick) {
    if (!brick.isVisible()) {
      return false;
    }
    return x + diameter > brick.x && x < brick.x + brick.width && y + diameter > brick.y && y < brick.y + brick.height;
  }


  void display() {
    fill(255);
    ellipse(x, y, diameter, diameter);
  }
}
