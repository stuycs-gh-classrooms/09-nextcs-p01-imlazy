class Brick {
  float x, y, width, height;
  int hitsRemaining;
  int brickColor;

  Brick(float x, float y, float width, float height, int hits) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.hitsRemaining = hits;
    this.brickColor = color(255, 255, 255); // White color
  }

  boolean isVisible() {
    return hitsRemaining > 0;
  }

  void hit() {
    if (isVisible()) {
      hitsRemaining--;
      if (!isVisible()) {
        brickColor = color(0, 0, 0);
      } else {
        int grayValue = (int) (255 * ((float) hitsRemaining / brickHits));
        brickColor = color(grayValue, grayValue, grayValue);
      }
    }
  }

  void display() {
    if (isVisible()) {
      fill(brickColor);
      rect(x, y, width, height);
    }
  }
}
