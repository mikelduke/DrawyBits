class Rectangle extends Shape {
  float w;
  float h;
  
  Rectangle(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void draw() {
    fill(this.red, this.green, this.blue);
    rect(x, y, w, h);
  }
}
