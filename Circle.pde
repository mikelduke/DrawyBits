class Circle extends Shape {
  float rad;
  
  Circle(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.rad = r;
  }
  
  void draw() {
    fill(this.red, this.green, this.blue);
    circle(this.x, this.y, this.rad * 2);
  }
}
