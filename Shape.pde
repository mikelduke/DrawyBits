abstract class Shape {
  float x;
  float y;

  float red;
  float green;
  float blue;
  
  abstract void draw();

  void randomColor() {
    this.red = random(20, 255);
    this.green = random(200, 255);
    this.blue = random(20, 255);
  }

  void randomColor(float minR, float minG, float minB) {
    this.red = random(minR, 255);
    this.green = random(minG, 255);
    this.blue = random(minB, 255);
  }
}
