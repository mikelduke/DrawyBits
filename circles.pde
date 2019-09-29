float maxRadius = 300;

enum Mode {
  RANDOM,
  NEXTTO,
  TOUCHING
}

Mode mode = Mode.TOUCHING;

ArrayList<Circle> circleList = new ArrayList<Circle>();

float minR = random(20, 200);
float minG = random(20, 200);
float minB = random(20, 200);

void nextMode() {
  reset();

  if (mode == Mode.RANDOM) {
    mode = Mode.NEXTTO;
  } else if (mode == Mode.NEXTTO) {
    mode = Mode.TOUCHING;
  } else if (mode == Mode.TOUCHING) {
    mode = Mode.RANDOM;
  }
}

void setup() {
  // size(800, 600);
  fullScreen(P2D, 1);
  background(0);
}

void draw() {

  if (mode == Mode.RANDOM) {
    drawRandomCircles();
  } else if (mode == Mode.NEXTTO) {
    for (int i = 0; i < 10000; i++) {
      if (drawCirclesNextToCircles()) {
        return;
      }
    }
    reset();
  } else if (mode == Mode.TOUCHING) {
    drawTouchingCircles();
  }
}

void keyPressed() {
  if (key == 'c') {
    reset();
  } else if (key == ' ') {
    nextMode();
  }
}

void drawRandomCircles() {
  Circle c = new Circle(random(0,width), random(0,height), random(10, maxRadius));
  c.randomColor(minR, minG, minB);

  c.draw();
}

boolean drawCirclesNextToCircles() {
  Circle c = new Circle(random(0,width), random(0,height), random(10, maxRadius));
  
  if (!isOverlapping(c)) {
    circleList.add(c);
    c.randomColor(minR, minG, minB);
    c.draw();

    return true;
  }

  return false;
}

boolean isOverlapping(Circle circleTest) {
    for (int i = 0; i < circleList.size(); i++) {
        Circle circle = circleList.get(i);
        // https://stackoverflow.com/questions/8367512/how-do-i-detect-intersections-between-a-circle-and-any-other-circle-in-the-same
        float aabb = pow(circleTest.x - circle.x, 2) + pow(circleTest.y - circle.y, 2);
        float cc = pow(circleTest.rad + circle.rad, 2);

        if (aabb <= cc) {
            return true;
        }
    }
    return false;
}

void reset() {
  background(0);
  circleList.clear();

  minR = random(20, 200);
  minG = random(20, 200);
  minB = random(20, 200);
}

void drawTouchingCircles() {
  for (int i = 0; i < 100000; i++) {
    if (drawNewTouchingCircle()) {
      return;
    }
  }
  reset();
}

boolean drawNewTouchingCircle() {
  float x = random(0,width);
  float y = random(0,height);
  float r = 0;
  float rMax = 300;

  Circle c = new Circle(x ,y, r);
  while (!isOverlapping(c) && r <= rMax) {
    c = new Circle(x, y, r+= 1);
  }

  if (r > 10) {
    circleList.add(c);
    c.randomColor(minR, minG, minB);
    c.draw();
    return true;
  }
  return false;
}