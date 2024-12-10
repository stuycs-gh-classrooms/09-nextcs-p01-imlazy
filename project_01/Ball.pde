class Ball {
  float x, y, diameter;
  float xVelocity=3, yVelocity=-3;

  Ball(float x, float y, float diameter) {
    this.x=x;
    this.y=y;
    this.diameter=diameter;
  }

  void move() {
    x+=xVelocity;
    y+=yVelocity;
    if (x<0||x+diameter>width) {
      xVelocity=-xVelocity;
    }
    if (y<0) {
      yVelocity=-yVelocity;
    }
  }

  void reverseY() {
    yVelocity=-yVelocity;
  }

  void reverseX() {
    xVelocity=-xVelocity;
  }

  void reset(float x, float y) {
    this.x=x;
    this.y=y;
  }

  boolean intersects(Brick brick) {
    if (!brick.isVisible()) {
      return false;
    }
    return x+diameter>brick.x&&x<brick.x+brick.width&&y+diameter>brick.y&&y<brick.y+brick.height;
  }

  boolean intersectsSide(Brick brick) {
    return x+diameter>=brick.x&&x<=brick.x+brick.width;
  }

  boolean intersectsTopBottom(Brick brick) {
    return y+diameter>=brick.y&&y<=brick.y+brick.height;
  }

  void display() {
    fill(255);
    ellipse(x, y, diameter, diameter);
  }

  boolean intersectsExact(Brick brick) {
    if (!brick.isVisible()) {
      return false;
    }
    boolean horizontalOverlap=x+diameter>brick.x&&x<brick.x+brick.width;
    boolean verticalOverlap=y+diameter>brick.y&&y<brick.y+brick.height;
    return horizontalOverlap&&verticalOverlap;
  }

  String getCollisionSide(Brick brick) {
    float ballCenterX=x+diameter/2;
    float ballCenterY=y+diameter/2;
    float brickCenterX=brick.x+brick.width/2;
    float brickCenterY=brick.y+brick.height/2;
    float dx=ballCenterX-brickCenterX;
    float dy=ballCenterY-brickCenterY;
    if (Math.abs(dx)>Math.abs(dy)) {
      return dx>0?"right":"left";
    } 
    else {
      return dy>0?"bottom":"top";
    }
  }
}
