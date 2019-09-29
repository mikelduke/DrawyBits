float maxRadius = 300;

void setup() {
  // size(800, 600);
  fullScreen(P2D, 1);
  background(20);
}

void draw() {
  Circle c = new Circle(random(0,width), random(0,height), random(10, maxRadius));
  c.randomColor();

  c.draw();
}

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
    circle(x, y, rad);
  }

  void randomColor() {
    red = random(20, 255);
    green = random(200, 255);
    blue = random(20, 255);
  }
}
