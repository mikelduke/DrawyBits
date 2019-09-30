public class TouchingCircles extends MinColorDrawMode implements DrawMode {
    int maxAttempts = 100000;

    ArrayList<Circle> circleList = new ArrayList<Circle>();

    void draw() {
        for (int i = 0; i < maxAttempts; i++) {
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
        while (!CircleUtil.isOverlapping(c, circleList) && r <= rMax) {
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

    void reset() {
        super.reset();
        circleList.clear();
    }
}
