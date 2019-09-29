class Circle {
  float x;
  float y;
  float rad;

  float red;
  float green;
  float blue;
  
  Circle(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.rad = r;
  }
  
  void draw() {
    fill(red, green, blue);
    circle(x, y, rad * 2);
  }

  void randomColor() {
    red = random(20, 255);
    green = random(200, 255);
    blue = random(20, 255);
  }
}
