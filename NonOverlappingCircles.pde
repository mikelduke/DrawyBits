public class NonOverlappingCircles extends MinColorDrawMode implements DrawMode {
    float maxRadius = 300;

    int maxAttempts = 10000;

    ArrayList<Circle> circleList = new ArrayList<Circle>();

    void draw() {
        for (int i = 0; i < maxAttempts; i++) {
            if (drawCirclesNextToCircles()) {
                return;
            }
        }
        reset();
    }

    boolean drawCirclesNextToCircles() {
        Circle c = new Circle(random(0,width), random(0,height), random(10, maxRadius));
        
        if (!CircleUtil.isOverlapping(c, circleList)) {
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
