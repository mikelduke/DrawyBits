DrawMode drawModes[] = new DrawMode[] {
  new RandomCircles(),
  new NonOverlappingCircles(),
  new TouchingCircles(),
  new GrowingCircles(),
  new RandomSquares(),
};

int selectedMode = 0;
DrawMode currentMode = drawModes[selectedMode];

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
  currentMode.draw();
}

void keyPressed() {
  if (key == 'c') {
    currentMode.reset();
  } else if (key == ' ') {
    nextMode();
  }
}
