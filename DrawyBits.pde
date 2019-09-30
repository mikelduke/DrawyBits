DrawMode drawModes[] = new DrawMode[] {
  new RandomCircles(),
  new NonOverlappingCircles(),
  new TouchingCircles(),
  new GrowingCircles(),
  new RandomSquares(),
  new NonOverlappingRectangles(),
  new ParametricsLines(),
};

int selectedMode = drawModes.length - 1;
DrawMode currentMode = drawModes[selectedMode];

boolean isPaused = false;

void nextMode() {
  currentMode.reset();

  selectedMode++;

  if (selectedMode >= drawModes.length) {
    selectedMode = 0;
  }

  currentMode = drawModes[selectedMode];
  currentMode.reset();
}

void setup() {
  //  size(800, 600);
  fullScreen(P2D, 1);
  background(0);
}

void draw() {
  if (!isPaused) {
    currentMode.draw();
  }
}

void keyPressed() {
  if (key == 'c') {
    currentMode.reset();
  } else if (key == ' ') {
    nextMode();
  } else if (key == 'p') {
    isPaused = !isPaused;
  } else if (key == 's') {
    saveFrame("screenshots/gen-######.png");
  }
}
